# SOFTSUSY3.2.3
# B.C. Allanach, Comput. Phys. Commun. 143 (2002) 305-331, hep-ph/0104145
Block SPINFO         # Program information
     1   SOFTSUSY    # spectrum calculator
     2   3.2.3         # version number
Block MODSEL  # Select model
     1    1   # sugra
Block SMINPUTS   # Standard Model inputs
     1    1.27934000e+02   # alpha_em^(-1)(MZ) SM MSbar
     2    1.16637000e-05   # G_Fermi
     3    1.17200000e-01   # alpha_s(MZ)MSbar
     4    9.11876000e+01   # MZ(pole)
     5    4.25000000e+00   # mb(mb)
     6    1.74300000e+02   # Mtop(pole)
     7    1.77700000e+00   # Mtau(pole)
Block MINPAR  # SUSY breaking input parameters
     3    1.00000000e+01   # tanb
     4    1.00000000e+00   # sign(mu)
     1    1.00000000e+03   # m0
     2    5.00000000e+02   # m12
     5    0.00000000e+00   # A0
# Low energy data in SOFTSUSY: MIXING=0 TOLERANCE=1.00000000e-03
# mgut=2.06667847e+16 GeV
Block MASS   # Mass spectrum
# PDG code     mass                     particle
        24     8.03980960e+01   # MW
        25     1.16013523e+02   # h0
        35     1.21472234e+03   # H0
        36     1.21475677e+03   # A0
        37     1.21748252e+03   # H+
   1000021     1.19577576e+03   # ~g
   1000022     2.07628718e+02   # ~neutralino(1)
   1000023     3.94042517e+02   # ~neutralino(2)
   1000024     3.94216283e+02   # ~chargino(1)
   1000025    -6.46648765e+02   # ~neutralino(3)
   1000035     6.60543252e+02   # ~neutralino(4)
   1000037     6.60049618e+02   # ~chargino(2)
   1000001     1.42877640e+03   # ~d_L
   1000002     1.42676806e+03   # ~u_L
   1000003     1.42877153e+03   # ~s_L
   1000004     1.42676318e+03   # ~c_L
   1000005     1.24290593e+03   # ~b_1
   1000006     9.94498399e+02   # ~t_1
   1000011     1.05119563e+03   # ~e_L
   1000012     1.04793098e+03   # ~nue_L
   1000013     1.05123832e+03   # ~mu_L
   1000014     1.04791678e+03   # ~numu_L
   1000015     1.00702233e+03   # ~stau_1
   1000016     1.04355761e+03   # ~nu_tau_L
   2000001     1.39948305e+03   # ~d_R
   2000002     1.40155275e+03   # ~u_R
   2000003     1.39947831e+03   # ~s_R
   2000004     1.40154749e+03   # ~c_R
   2000005     1.39024144e+03   # ~b_2
   2000006     1.26586811e+03   # ~t_2
   2000011     1.01690537e+03   # ~e_R
   2000013     1.01687597e+03   # ~mu_R
   2000015     1.04762805e+03   # ~stau_2
# Higgs mixing
Block alpha   # Effective Higgs mixing parameter
          -1.04764572e-01   # alpha
Block nmix  # neutralino mixing matrix
  1  1     9.95948245e-01   # N_{1,1}
  1  2    -1.67113220e-02   # N_{1,2}
  1  3     8.16378221e-02   # N_{1,3}
  1  4    -3.38096375e-02   # N_{1,4}
  2  1     3.67844477e-02   # N_{2,1}
  2  2     9.71187017e-01   # N_{2,2}
  2  3    -1.95769904e-01   # N_{2,3}
  2  4     1.30831293e-01   # N_{2,4}
  3  1    -3.28325700e-02   # N_{3,1}
  3  2     4.76682446e-02   # N_{3,2}
  3  3     7.03608127e-01   # N_{3,3}
  3  4     7.08226916e-01   # N_{3,4}
  4  1    -7.52065198e-02   # N_{4,1}
  4  2     2.32903947e-01   # N_{4,2}
  4  3     6.78192461e-01   # N_{4,3}
  4  4    -6.92931971e-01   # N_{4,4}
Block Umix  # chargino U mixing matrix 
  1  1     9.60812938e-01   # U_{1,1}
  1  2    -2.77197581e-01   # U_{1,2}
  2  1     2.77197581e-01   # U_{2,1}
  2  2     9.60812938e-01   # U_{2,2}
Block Vmix  # chargino V mixing matrix 
  1  1     9.82281140e-01   # V_{1,1}
  1  2    -1.87413346e-01   # V_{1,2}
  2  1     1.87413346e-01   # V_{2,1}
  2  2     9.82281140e-01   # V_{2,2}
Block stopmix  # stop mixing matrix
  1  1     2.42674339e-01   # F_{11}
  1  2     9.70107811e-01   # F_{12}
  2  1     9.70107811e-01   # F_{21}
  2  2    -2.42674339e-01   # F_{22}
Block sbotmix  # sbottom mixing matrix
  1  1     9.98944561e-01   # F_{11}
  1  2     4.59321617e-02   # F_{12}
  2  1    -4.59321617e-02   # F_{21}
  2  2     9.98944561e-01   # F_{22}
Block staumix  # stau mixing matrix
  1  1     1.41673220e-01   # F_{11}
  1  2     9.89913480e-01   # F_{12}
  2  1     9.89913480e-01   # F_{21}
  2  2    -1.41673220e-01   # F_{22}
Block gauge Q= 1.09132896e+03  
     1     3.62390862e-01   # g'(Q)MSSM DRbar
     2     6.41794428e-01   # g(Q)MSSM DRbar
     3     1.05229647e+00   # g3(Q)MSSM DRbar
Block yu Q= 1.09132896e+03  
  3  3     8.63735051e-01   # Yt(Q)MSSM DRbar
Block yd Q= 1.09132896e+03  
  3  3     1.35190704e-01   # Yb(Q)MSSM DRbar
Block ye Q= 1.09132896e+03  
  3  3     9.95755682e-02   # Ytau(Q)MSSM DRbar
Block hmix Q= 1.09132896e+03  # Higgs mixing parameters
     1     6.39291723e+02   # mu(Q)MSSM DRbar
     2     9.63940347e+00   # tan beta(Q)MSSM DRbar
     3     2.43602680e+02   # higgs vev(Q)MSSM DRbar
     4     1.50743274e+06   # mA^2(Q)MSSM DRbar
Block msoft Q= 1.09132896e+03 # MSSM DRbar SUSY breaking parameters
     1     2.10609081e+02   # M_1(Q)
     2     3.89740113e+02   # M_2(Q)
     3     1.10174449e+03   # M_3(Q)
    21     1.05005952e+06   # mH1^2(Q)
    22    -3.75171831e+05   # mH2^2(Q)
    31     1.04816471e+03   # meL(Q)
    32     1.04815054e+03   # mmuL(Q)
    33     1.04392690e+03   # mtauL(Q)
    34     1.01460988e+03   # meR(Q)
    35     1.01458045e+03   # mmuR(Q)
    36     1.00578896e+03   # mtauR(Q)
    41     1.39579638e+03   # mqL1(Q)
    42     1.39579137e+03   # mqL2(Q)
    43     1.21399577e+03   # mqL3(Q)
    44     1.37138054e+03   # muR(Q)
    45     1.37137513e+03   # mcR(Q)
    46     9.70562554e+02   # mtR(Q)
    47     1.36851151e+03   # mdR(Q)
    48     1.36850662e+03   # msR(Q)
    49     1.35915840e+03   # mbR(Q)
Block au Q= 1.09132896e+03  
  1  1    -1.11762247e+03   # Au(Q)MSSM DRbar
  2  2    -1.11761748e+03   # Ac(Q)MSSM DRbar
  3  3    -8.58360307e+02   # At(Q)MSSM DRbar
Block ad Q= 1.09132896e+03  
  1  1    -1.37126050e+03   # Ad(Q)MSSM DRbar
  2  2    -1.37125589e+03   # As(Q)MSSM DRbar
  3  3    -1.28029129e+03   # Ab(Q)MSSM DRbar
Block ae Q= 1.09132896e+03  
  1  1    -2.97490329e+02   # Ae(Q)MSSM DRbar
  2  2    -2.97485030e+02   # Amu(Q)MSSM DRbar
  3  3    -2.95908786e+02   # Atau(Q)MSSM DRbar
DECAY   1000022     3.23641924E-14   # chi_10
     0.50000000E+00    3          12       -11        11   # BR(chi_10 -> nu_1 e+ e-)
     0.50000000E+00    3          14       -13        13   # BR(chi_10 -> nu_2 mu+ mu-)

