# SOFTSUSY3.2.3
# B.C. Allanach, Comput. Phys. Commun. 143 (2002) 305-331, hep-ph/0104145
Block SPINFO         # Program information
     1   SOFTSUSY    # spectrum calculator
     2   3.2.3         # version number
Block MODSEL  # Select model
     1    0   # nonUniversal
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
Block EXTPAR          # non-universal SUSY breaking parameters
     1    3.00000000e+02         # M_1(MX)
     2    6.00000000e+02         # M_2(MX)
     3    9.20000000e+02         # M_3(MX)
     11   -1.70000000e+03         # At(MX)
     12    0.00000000e+00         # Ab(MX)
     13    0.00000000e+00         # Atau(MX)
     23    5.00000000e+02         # mu(MX)
     26    6.00000000e+02         # mA(pole)
     31    1.60000000e+03         # meL(MX)
     32    1.60000000e+03         # mmuL(MX)
     33    1.60000000e+03         # mtauL(MX)
     34    1.60000000e+03         # meR(MX)
     35    1.60000000e+03         # mmuR(MX)
     36    1.60000000e+03         # mtauR(MX)
     41    1.07085999e+03         # mqL1(MX)
     42    1.07085795e+03         # mqL2(MX)
     43    1.07072597e+03         # mqL3(MX)
     44    1.07084438e+03         # muR(MX)
     45    1.07084204e+03         # mcR(MX)
     46    1.07033646e+03         # mtR(MX)
     47    1.07074739e+03         # mdR(MX)
     48    1.07074546e+03         # msR(MX)
     49    1.07042643e+03         # mbR(MX)
# Low energy data in SOFTSUSY: MIXING=0 TOLERANCE=1.00000000e-03
# mgut=1.25556206e+03 GeV
Block MASS   # Mass spectrum
# PDG code     mass                     particle
        24     8.04049678e+01   # MW
        25     1.21356292e+02   # h0
        35     6.00286674e+02   # H0
        36     5.99997278e+02   # A0
        37     6.05449816e+02   # H+
   1000021     1.00971883e+03   # ~g
   1000022     2.93210754e+02   # ~neutralino(1)
   1000023     4.82610140e+02   # ~neutralino(2)
   1000024     4.80093347e+02   # ~chargino(1)
   1000025    -5.08130910e+02   # ~neutralino(3)
   1000035     6.44040215e+02   # ~neutralino(4)
   1000037     6.43087117e+02   # ~chargino(2)
   1000001     1.11311649e+03   # ~d_L
   1000002     1.11054902e+03   # ~u_L
   1000003     1.11311448e+03   # ~s_L
   1000004     1.11054700e+03   # ~c_L
   1000005     1.08919997e+03   # ~b_1
   1000006     9.64816075e+02   # ~t_1
   1000011     1.60387270e+03   # ~e_L
   1000012     1.60166759e+03   # ~nue_L
   1000013     1.60387309e+03   # ~mu_L
   1000014     1.60166748e+03   # ~numu_L
   1000015     1.59993161e+03   # ~stau_1
   1000016     1.60154785e+03   # ~nu_tau_L
   2000001     1.10877660e+03   # ~d_R
   2000002     1.10802465e+03   # ~u_R
   2000003     1.10877472e+03   # ~s_R
   2000004     1.10802231e+03   # ~c_R
   2000005     1.10977320e+03   # ~b_2
   2000006     1.20093053e+03   # ~t_2
   2000011     1.60207297e+03   # ~e_R
   2000013     1.60207275e+03   # ~mu_R
   2000015     1.60566131e+03   # ~stau_2
# Higgs mixing
Block alpha   # Effective Higgs mixing parameter
          -1.09694658e-01   # alpha
Block nmix  # neutralino mixing matrix
  1  1     9.84546375e-01   # N_{1,1}
  1  2    -2.67193950e-02   # N_{1,2}
  1  3     1.45228996e-01   # N_{1,3}
  1  4    -9.41437658e-02   # N_{1,4}
  2  1    -1.65799856e-01   # N_{2,1}
  2  2    -4.11941538e-01   # N_{2,2}
  2  3     6.45164827e-01   # N_{2,3}
  2  4    -6.21753105e-01   # N_{2,4}
  3  1    -3.46840748e-02   # N_{3,1}
  3  2     4.48636238e-02   # N_{3,2}
  3  3     7.02965357e-01   # N_{3,3}
  3  4     7.08959785e-01   # N_{3,4}
  4  1    -4.44506311e-02   # N_{4,1}
  4  2     9.09712866e-01   # N_{4,2}
  4  3     2.61745280e-01   # N_{4,3}
  4  4    -3.19274258e-01   # N_{4,4}
Block Umix  # chargino U mixing matrix 
  1  1    -3.64947623e-01   # U_{1,1}
  1  2     9.31028051e-01   # U_{1,2}
  2  1    -9.31028051e-01   # U_{2,1}
  2  2    -3.64947623e-01   # U_{2,2}
Block Vmix  # chargino V mixing matrix 
  1  1    -4.44079565e-01   # V_{1,1}
  1  2     8.95987355e-01   # V_{1,2}
  2  1    -8.95987355e-01   # V_{2,1}
  2  2    -4.44079565e-01   # V_{2,2}
Block stopmix  # stop mixing matrix
  1  1     6.76005151e-01   # F_{11}
  1  2     7.36896896e-01   # F_{12}
  2  1     7.36896896e-01   # F_{21}
  2  2    -6.76005151e-01   # F_{22}
Block sbotmix  # sbottom mixing matrix
  1  1     9.68302980e-01   # F_{11}
  1  2     2.49778581e-01   # F_{12}
  2  1    -2.49778581e-01   # F_{21}
  2  2     9.68302980e-01   # F_{22}
Block staumix  # stau mixing matrix
  1  1     5.76254466e-01   # F_{11}
  1  2     8.17270329e-01   # F_{12}
  2  1     8.17270329e-01   # F_{21}
  2  2    -5.76254466e-01   # F_{22}
Block gauge Q= 1.06616156e+03  
     1     3.62279638e-01   # g'(Q)MSSM DRbar
     2     6.41338955e-01   # g(Q)MSSM DRbar
     3     1.05844391e+00   # g3(Q)MSSM DRbar
Block yu Q= 1.06616156e+03  
  3  3     8.60040002e-01   # Yt(Q)MSSM DRbar
Block yd Q= 1.06616156e+03  
  3  3     1.39343453e-01   # Yb(Q)MSSM DRbar
Block ye Q= 1.06616156e+03  
  3  3     9.97006508e-02   # Ytau(Q)MSSM DRbar
Block hmix Q= 1.06616156e+03  # Higgs mixing parameters
     1     4.99999970e+02   # mu(Q)MSSM DRbar
     2     9.64579391e+00   # tan beta(Q)MSSM DRbar
     3     2.43197570e+02   # higgs vev(Q)MSSM DRbar
     4     3.92818660e+05   # mA^2(Q)MSSM DRbar
Block msoft Q= 1.06616156e+03 # MSSM DRbar SUSY breaking parameters
     1     2.99047413e+02   # M_1(Q)
     2     5.99255570e+02   # M_2(Q)
     3     9.26003502e+02   # M_3(Q)
    21     1.00108695e+05   # mH1^2(Q)
    22    -2.31670771e+05   # mH2^2(Q)
    31     1.60025763e+03   # meL(Q)
    32     1.60025751e+03   # mmuL(Q)
    33     1.60022403e+03   # mtauL(Q)
    34     1.60004969e+03   # meR(Q)
    35     1.60004947e+03   # mmuR(Q)
    36     1.59998215e+03   # mtauR(Q)
    41     1.07593366e+03   # mqL1(Q)
    42     1.07593156e+03   # mqL2(Q)
    43     1.07248701e+03   # mqL3(Q)
    44     1.07557819e+03   # muR(Q)
    45     1.07557575e+03   # mcR(Q)
    46     1.06834339e+03   # mtR(Q)
    47     1.07551468e+03   # mdR(Q)
    48     1.07551271e+03   # msR(Q)
    49     1.07510646e+03   # mbR(Q)
Block au Q= 1.06616156e+03  
  1  1    -1.70495843e+03   # Au(Q)MSSM DRbar
  2  2    -1.70495832e+03   # Ac(Q)MSSM DRbar
  3  3    -1.69743415e+03   # At(Q)MSSM DRbar
Block ad Q= 1.06616156e+03  
  1  1    -1.29302361e+01   # Ad(Q)MSSM DRbar
  2  2    -1.29301973e+01   # As(Q)MSSM DRbar
  3  3    -1.04532491e+01   # Ab(Q)MSSM DRbar
Block ae Q= 1.06616156e+03  
  1  1    -1.74687080e+00   # Ae(Q)MSSM DRbar
  2  2    -1.74686997e+00   # Amu(Q)MSSM DRbar
  3  3    -1.74662432e+00   # Atau(Q)MSSM DRbar
