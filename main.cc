#include "main.h" // include header file

using namespace Pythia8;

double deltaR(double p1eta, double p1phi, double p2eta, double p2phi){
  return sqrt( pow(p1phi-p2phi,2) + pow(p1eta-p2eta,2) );
}

bool isIsolated( Event &event, vector<int> index, double R ){
 
  double I_rel;

  for ( unsigned int i = 0; i < index.size(); i++){

    I_rel = 0;
    
    for ( int j = 0; j < event.size(); ++j ){
      
      if ( j == index[i] ) continue; // Avoid analysis over the same index
      if ( !(event[j].isFinal()) ) continue; // Only stable particles
      if ( event[j].pT() < 8.0 ) continue; // pT >= 8 GeV/c
      if ( abs( event[j].eta() ) >= 2.1 ) continue; // |eta| < 2.1
      
      if ( deltaR( event[j].eta(), event[j].phi(), event[i].eta(), event[i].eta() ) < R ) I_rel += ( event[j].pT() + event[j].eT() ) / event[i].pT();

    }
    if ( I_rel > 0.15 ) return false;
  }
  return true;
}

bool ZVeto( Event &event, vector<int> iMu, vector<int> iMup, vector<int> iE, vector<int> iEp, float minMass, float maxMass ){

  for ( unsigned int i = 0; i < iMu.size(); i++ ){
    for ( unsigned int j = 0; j < iMup.size(); j++ ){
      if ( m(event[iMu[i]], event[iMup[j]]) > minMass && m(event[iMu[i]], event[iMup[j]]) < maxMass ) return true;
      }
  }
  for ( unsigned int i = 0; i < iE.size(); i++ ){
    for ( unsigned int j = 0; j < iEp.size(); j++ ){
      if ( m(event[iE[i]], event[iEp[j]]) > minMass && m(event[iE[i]], event[iEp[j]]) < maxMass ) return true;
      }
  }
  return false;
}

int main(int argc, char * argv[])
{

  // Define Variables
  ofstream file;
  file.open("s.data");

  int DY13[] = {0,0,0}; // ST low, mid, high
  int DY13Z[] = {0,0,0}; // ST low, mid, high with Zveto

  vector<int> iMu; // Muon event storage
  vector<int> iE;  // Electron event storage
  vector<int> iMup; // Antimuon event storage
  vector<int> iEp;  // Antielectron event storage
  int pTelectrons[3];  // Count electrons with [0]: pT > 10 [1]: pT > 20 [2]: pT > 70
  int pTmuons[3];  // Count muons with [0]: pT > 10 [1]: pT > 15 [2]: pT > 20
  double HT; // Jets tri momentum sum
  double ST; // MET_T + HT + ptl
  double pTl; // pT isolated leptons
  
  Vec4 MET; // 4-vector for missing energy

  bool trigger;

  // Handful Histograms
  Hist pTe("electron pT dist.", 100, 0, 300);
  Hist pTmu("muon pT dist.", 100, 0, 300);
  Hist pTt("total pT dist.", 100, 0, 300);
  Hist sHist("S_{T} distribution", 100, 400, 10000);
 
  // Fastjet analysis - select algorithm and parameters
  double Rparam = 0.5;
  fastjet::Strategy               strategy = fastjet::Best;
  fastjet::RecombinationScheme    recombScheme = fastjet::E_scheme;
  fastjet::JetDefinition          *jetDef = NULL;
  jetDef = new fastjet::JetDefinition(fastjet::kt_algorithm, Rparam,
                                      recombScheme, strategy);

  // Fastjet input
  std::vector <fastjet::PseudoJet> fjInputs;

  // Set up generation
  Pythia pythia; // Declare pythia object
  pythia.readFile("main0.cmnd"); // Read file of parameters
  pythia.init(); // Initialize with .cmnd file parameters

  // Pythia Settings
  int nEvents;
  if ( argc > 1 ) 
    nEvents = atoi(argv[1]);
  else 
    nEvents = pythia.mode("Main:numberOfEvents");
  int nList = pythia.mode("Main:numberToList");
  int nShow = pythia.mode("Main:timesToShow");
  
  for ( int iEvent = 0; iEvent < nEvents; iEvent++ ) { // Event loop
    
    // Reset variables in the new event
    trigger = false;
    MET.reset();
    iE.clear();
    iMu.clear(); 
    iEp.clear();
    iMup.clear();
    fjInputs.clear();
    pTelectrons[0] = 0; pTelectrons[1] = 0; pTelectrons[2] = 0; 
    pTmuons[0] = 0; pTmuons[1] = 0; pTmuons[2] = 0;
    HT = 0;
    ST = 0;
    pTl = 0;

    if ( !pythia.next() ) continue;
    if ( iEvent < nList ){ // Event listing
      pythia.process.list(); 
      pythia.event.list();
    }
    //pythia.process.list();
    // pythia.event.list();

    int percent = static_cast<float>(iEvent)/static_cast<float>(nEvents)*100.0;
    int nPace = max(1, nEvents / max(1, nShow) ); // 
    if (nShow > 0 && iEvent%nPace == 0) {printf(" Genarating Event %u of %u\t %u%% completed\n",iEvent,nEvents,percent);}
    
    for ( int i = 0; i < pythia.event.size(); ++i ){ // Particle loop

      if ( pythia.event[i].id() == -13 ) iMup.push_back(i); // Tag antimuons
      if ( pythia.event[i].id() == -11 ) iEp.push_back(i); // Tag positrons
      if ( pythia.event[i].id() == 13 ) iMu.push_back(i); // Tag muons
      if ( pythia.event[i].id() == 11 ) iE.push_back(i); // Tag electrons

      if ( pythia.event[i].pT() < 8.0 ) continue; // pT >= 8 GeV/c
      if ( abs( pythia.event[i].eta() ) >= 2.1 ) continue; // |eta| < 2.1
      if ( !(pythia.event[i].isFinal()) ) continue; // Only final particles i.e. status >= 0
      // if ( pythia.event[i].hasVertex() ) continue; // Particles originated at the primary vertex (origin) only
      if ( sqrt( pow(pythia.event[i].xProd(),2)+pow(pythia.event[i].yProd(),2)+pow(pythia.event[i].zProd(),2) ) > 100E-3 ) continue; // Decay lengths <= 100E-3 mm

      // MET
      if ( pythia.event[i].id() == 12 || pythia.event[i].id() == 14 || pythia.event[i].id() == 16 ){MET+=pythia.event[i].p(); continue;} // Neutrinos   
      if ( pythia.event[i].id() == 1000039 ){MET+=pythia.event[i].p(); continue;} // Gravitinos
      
      // Tag electron momentum for triggers
      if ( pythia.event[i].id() == 11 ){
	if ( pythia.event[i].pT() > 70 ){ pTelectrons[2] += 1; continue; }
	if ( pythia.event[i].pT() > 20 ){ pTelectrons[1] += 1; continue; }
	if ( pythia.event[i].pT() > 10 ){ pTelectrons[0] += 1; continue; }
      }
      
      // Tag muon momentum for triggers
      if ( pythia.event[i].id() == 13 ){
	if ( pythia.event[i].pT() > 20 ){ pTmuons[2] += 1; continue; }
	if ( pythia.event[i].pT() > 15 ){ pTmuons[1] += 1; continue; }
	if ( pythia.event[i].pT() > 10 ){ pTmuons[0] += 1; continue; }
      }

      // Store as input to Fastjet
      fjInputs.push_back( fastjet::PseudoJet (pythia.event[i].px(), pythia.event[i].py(), pythia.event[i].pz(), pythia.event[i].e() ) );

    }

    /* Z-veto */
    //    if ( ZVeto(pythia.event,iMu, iMup, iE, iEp, 75., 105.) ) {continue;} // Check for OSSF leptons with invariante mass in [75,105] GeV/c

    // cout << "Event " << iEvent << " Mu-Mup: " << iMu.size() << " " << iMup.size()  << "\tE-Ep: " << iE.size() << " " << iEp.size() << endl;
    // getchar();

    /* === e-mu trigger === */
    if ( iE.size() > 0 && iMu.size() > 0 ) {

      if ( pTmuons[2] > 0 && // at least one mu with pT > 20 GeV/c
	   pTelectrons[0] > 0  && // at least one e with pT > 10 GeV/c
	   isIsolated( pythia.event, iE, 0.4 ) && // Check isolation of tagged electrons (R<0.4)
	   isIsolated( pythia.event, iMu, 0.3 ) // Check isolation of tagged muons (R<0.3)
	   ){
	trigger = true;
      }
     
      // goto jets;
    }

    /* === e-e trigger === */
    if ( iE.size() > 1 && iMu.size() == 0 ) {
         
      if ( pTelectrons[1] > 0 && // at least one e with pT > 20 GeV/c
	   pTelectrons[0] > 0 && // at least one e with pT > 10 GeV/c
	   isIsolated( pythia.event, iE, 0.4 ) // Check isolation of tagged electrons (R<0.4)
	   ){
	trigger = true;
      }
      // goto jets;
    }

    /* === mu-mu trigger === */
    if ( iMu.size() > 1 && iE.size() == 0 ) {
     
      if ( pTmuons[1] > 0 && // at least one e with pT > 20 GeV/c
	   pTmuons[0] > 0 && // at least one e with pT > 10 GeV/c
	   isIsolated( pythia.event, iMu, 0.3 ) // Check isolation of tagged electrons (R<0.4)
	   ){
	trigger = true;
      }
      // goto jets;
    }

    /* === single lepton trigger === */
    if ( iE.size() == 1 && iMu.size() == 0 ){ // Single electron
      if ( pTelectrons[2] > 0 && // at least one e with pT > 70 GeV/c
	   isIsolated( pythia.event, iE, 0.4 ) // Check isolation of tagged electrons (R<0.4)
	   ){
	trigger = true;
      }

    }
    if ( iMu.size() == 1 && iE.size() == 0 ){ // Single muon
      if ( pTmuons[2] > 0 && // at least one e with pT > 20 GeV/c
	   isIsolated( pythia.event, iMu, 0.3 ) // Check isolation of tagged muons (R<0.3)
	   ){
	trigger = true;
      }

    }

    if (trigger){ // if the event passed one trigger then analyze it
    
      // Run Fastjet algorithm 
      vector <fastjet::PseudoJet> jets;
      fastjet::ClusterSequence clustSeq(fjInputs, *jetDef); // Run clustering
      
      // For the first event, print the FastJet details
      if (iEvent == 0) {
	cout << "\nRan " << jetDef->description() << endl << endl;
      }
    
      // Extract jets
      jets = clustSeq.inclusive_jets();
    
      // Apply jets cuts
      fastjet::Selector select_ET = fastjet::SelectorEtMin(40.0);
      fastjet::Selector select_eta = fastjet::SelectorEtaMax(2.5);
      jets = select_ET(jets);
      jets = select_eta(jets);
      jets = sorted_by_E(jets);

      for ( unsigned int i = 0; i < jets.size(); i++ ) HT += jets[i].perp();

      // Isolated leptons pT sum
      for ( unsigned int i = 0; i < iE.size(); i++ ) pTl += pythia.event[iE[i]].pT();
      for ( unsigned int i = 0; i < iMu.size(); i++ ) pTl += pythia.event[iMu[i]].pT();
      for ( unsigned int i = 0; i < iEp.size(); i++ ) pTl += pythia.event[iEp[i]].pT();
      for ( unsigned int i = 0; i < iMup.size(); i++ ) pTl += pythia.event[iMup[i]].pT();
      ST = HT + pTl + MET.pT();
      sHist.fill(ST);
      file << ST << endl;

      if ( ST < 300 ) { // ST low
	if ( iE.size() == 1 && iEp.size() == 1 && ( iMup.size() == 1 ^ iMu.size() == 1 ) ) {cout << 3 << " (DY1) ST(low)" << endl; DY13[0] +=1;}
	if ( iMu.size() == 1 && iMup.size() == 1 && ( iEp.size() == 1 ^ iE.size() == 1 ) ) {cout << 3 << " (DY1) ST(low)" << endl; DY13[0] +=1;}
      }  
      if ( 300 <= ST && ST < 600 ) { // ST mid
	if ( iE.size() == 1 && iEp.size() == 1 && ( iMup.size() == 1 ^ iMu.size() == 1 ) ) {cout << 3 << " (DY1) ST(mid)" << endl; DY13[1] +=1;}
	if ( iMu.size() == 1 && iMup.size() == 1 && ( iEp.size() == 1 ^ iE.size() == 1 ) ) {cout << 3 << " (DY1) ST(mid)" << endl; DY13[1] +=1;}
      }   
      if ( 600 <= ST ) { // ST high
	if ( iE.size() == 1 && iEp.size() == 1 && ( iMup.size() == 1 ^ iMu.size() == 1 ) ) {cout << 3 << " (DY1) ST(high)" << endl; DY13[2] +=1;}
	if ( iMu.size() == 1 && iMup.size() == 1 && ( iEp.size() == 1 ^ iE.size() == 1 ) ) {cout << 3 << " (DY1) ST(high)" << endl; DY13[2] +=1;}
      }   

      if ( !(ZVeto(pythia.event,iMu, iMup, iE, iEp, 75., 105.)) ){ // Check for OSSF leptons with invariante mass outside of [75,105] GeV/c

	if ( ST < 300 ) { // ST low
	  if ( iE.size() == 1 && iEp.size() == 1 && ( iMup.size() == 1 ^ iMu.size() == 1 ) ) {cout << 3 << " (DY1,ZV) ST(low)" << endl; DY13Z[0] +=1;}
	  if ( iMu.size() == 1 && iMup.size() == 1 && ( iEp.size() == 1 ^ iE.size() == 1 ) ) {cout << 3 << " (DY1,ZV) ST(low)" << endl; DY13Z[0] +=1;}
	}  
	if ( 300 <= ST && ST < 600 ) { // ST mid
	  if ( iE.size() == 1 && iEp.size() == 1 && ( iMup.size() == 1 ^ iMu.size() == 1 ) ) {cout << 3 << " (DY1,ZV) ST(mid)" << endl; DY13Z[1] +=1;}
	  if ( iMu.size() == 1 && iMup.size() == 1 && ( iEp.size() == 1 ^ iE.size() == 1 ) ) {cout << 3 << " (DY1,ZV) ST(mid)" << endl; DY13Z[1] +=1;}
	}   
	if ( 600 <= ST ) { // ST high
	  if ( iE.size() == 1 && iEp.size() == 1 && ( iMup.size() == 1 ^ iMu.size() == 1 ) ) {cout << 3 << " (DY1,ZV) ST(high)" << endl; DY13Z[2] +=1;}
	  if ( iMu.size() == 1 && iMup.size() == 1 && ( iEp.size() == 1 ^ iE.size() == 1 ) ) {cout << 3 << " (DY1,ZV) ST(high)" << endl; DY13Z[2] +=1;}
	}   

      } 

    } // End trigger if

  } // End event loop

  file.close();
  
  // pTt += pTmu;
  // pTt += pTe;
  // cout << pTe << endl << pTmu << pTt << endl;
  // cout << sHist << endl;
  cout << endl << endl << "====== Events Recolected ======" << endl << endl;
  cout << 3 << " (DY1,ZV) ST(High) " << DY13Z[2] << endl;
  cout << 3 << " (DY1) ST(High) " << DY13[2] << endl;
  cout << 3 << " (DY1,ZV) ST(Mid) " << DY13Z[1] << endl;
  cout << 3 << " (DY1) ST(Mid) " << DY13[1] << endl;
  cout << 3 << " (DY1,ZV) ST(Low) " << DY13Z[0] << endl;
  cout << 3 << " (DY1) ST(Low) " << DY13[0] << endl;

  return 0; // End main program with error-free return
  
}
