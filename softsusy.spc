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
     1    3.60000000e+02         # M_1(MX)
     2    7.20000000e+02         # M_2(MX)
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
        24     8.04062458e+01   # MW
        25     1.21254959e+02   # h0
        35     6.00271321e+02   # H0
        36     5.99997238e+02   # A0
        37     6.05421200e+02   # H+
   1000021     1.00971895e+03   # ~g
   1000022     3.50436935e+02   # ~neutralino(1)
   1000023     4.97191944e+02   # ~neutralino(2)
   1000024     4.91919279e+02   # ~chargino(1)
   1000025    -5.08164679e+02   # ~neutralino(3)
   1000035     7.51005944e+02   # ~neutralino(4)
   1000037     7.50433455e+02   # ~chargino(2)
   1000001     1.11418586e+03   # ~d_L
   1000002     1.11162392e+03   # ~u_L
   1000003     1.11418386e+03   # ~s_L
   1000004     1.11162191e+03   # ~c_L
   1000005     1.09021473e+03   # ~b_1
   1000006     9.65279995e+02   # ~t_1
   1000011     1.60424892e+03   # ~e_L
   1000012     1.60204603e+03   # ~nue_L
   1000013     1.60424953e+03   # ~mu_L
   1000014     1.60204592e+03   # ~numu_L
   1000015     1.60006753e+03   # ~stau_1
   1000016     1.60192622e+03   # ~nu_tau_L
   2000001     1.10878542e+03   # ~d_R
   2000002     1.10806432e+03   # ~u_R
   2000003     1.10878353e+03   # ~s_R
   2000004     1.10806197e+03   # ~c_R
   2000005     1.10986569e+03   # ~b_2
   2000006     1.20158957e+03   # ~t_2
   2000011     1.60210106e+03   # ~e_R
   2000013     1.60210084e+03   # ~mu_R
   2000015     1.60592994e+03   # ~stau_2
# Higgs mixing
Block alpha   # Effective Higgs mixing parameter
          -1.09687977e-01   # alpha
Block nmix  # neutralino mixing matrix
  1  1     9.71630317e-01   # N_{1,1}
  1  2    -3.27200357e-02   # N_{1,2}
  1  3     1.87721151e-01   # N_{1,3}
  1  4    -1.40088174e-01   # N_{1,4}
  2  1    -2.33013892e-01   # N_{2,1}
  2  2    -2.43396038e-01   # N_{2,2}
  2  3     6.69999697e-01   # N_{2,3}
  2  4    -6.61485677e-01   # N_{2,4}
  3  1    -3.23218466e-02   # N_{3,1}
  3  2     4.05563123e-02   # N_{3,2}
  3  3     7.03391768e-01   # N_{3,3}
  3  4     7.08907966e-01   # N_{3,4}
  4  1    -2.43793355e-02   # N_{4,1}
  4  2     9.68526176e-01   # N_{4,2}
  4  3     1.45262505e-01   # N_{4,3}
  4  4    -2.00652683e-01   # N_{4,4}
Block Umix  # chargino U mixing matrix 
  1  1    -2.03154381e-01   # U_{1,1}
  1  2     9.79146719e-01   # U_{1,2}
  2  1    -9.79146719e-01   # U_{2,1}
  2  2    -2.03154381e-01   # U_{2,2}
Block Vmix  # chargino V mixing matrix 
  1  1    -2.79220093e-01   # V_{1,1}
  1  2     9.60227129e-01   # V_{1,2}
  2  1    -9.60227129e-01   # V_{2,1}
  2  2    -2.79220093e-01   # V_{2,2}
Block stopmix  # stop mixing matrix
  1  1     6.74163002e-01   # F_{11}
  1  2     7.38582593e-01   # F_{12}
  2  1     7.38582593e-01   # F_{21}
  2  2    -6.74163002e-01   # F_{22}
Block sbotmix  # sbottom mixing matrix
  1  1     9.64544559e-01   # F_{11}
  1  2     2.63920051e-01   # F_{12}
  2  1    -2.63920051e-01   # F_{21}
  2  2     9.64544559e-01   # F_{22}
Block staumix  # stau mixing matrix
  1  1     5.52881721e-01   # F_{11}
  1  2     8.33259745e-01   # F_{12}
  2  1     8.33259745e-01   # F_{21}
  2  2    -5.52881721e-01   # F_{22}
Block gauge Q= 1.06624556e+03  
     1     3.62279283e-01   # g'(Q)MSSM DRbar
     2     6.40931686e-01   # g(Q)MSSM DRbar
     3     1.05842615e+00   # g3(Q)MSSM DRbar
Block yu Q= 1.06624556e+03  
  3  3     8.59907447e-01   # Yt(Q)MSSM DRbar
Block yd Q= 1.06624556e+03  
  3  3     1.39464170e-01   # Yb(Q)MSSM DRbar
Block ye Q= 1.06624556e+03  
  3  3     9.97479357e-02   # Ytau(Q)MSSM DRbar
Block hmix Q= 1.06624556e+03  # Higgs mixing parameters
     1     4.99999969e+02   # mu(Q)MSSM DRbar
     2     9.64591409e+00   # tan beta(Q)MSSM DRbar
     3     2.43303723e+02   # higgs vev(Q)MSSM DRbar
     4     3.92806399e+05   # mA^2(Q)MSSM DRbar
Block msoft Q= 1.06624556e+03 # MSSM DRbar SUSY breaking parameters
     1     3.58864121e+02   # M_1(Q)
     2     7.19126886e+02   # M_2(Q)
     3     9.25993563e+02   # M_3(Q)
    21     9.89009342e+04   # mH1^2(Q)
    22    -2.32462837e+05   # mH2^2(Q)
    31     1.60038466e+03   # meL(Q)
    32     1.60038454e+03   # mmuL(Q)
    33     1.60035105e+03   # mtauL(Q)
    34     1.60006262e+03   # meR(Q)
    35     1.60006239e+03   # mmuR(Q)
    36     1.59999503e+03   # mtauR(Q)
    41     1.07610403e+03   # mqL1(Q)
    42     1.07610193e+03   # mqL2(Q)
    43     1.07266036e+03   # mqL3(Q)
    44     1.07558354e+03   # muR(Q)
    45     1.07558110e+03   # mcR(Q)
    46     1.06834650e+03   # mtR(Q)
    47     1.07551410e+03   # mdR(Q)
    48     1.07551213e+03   # msR(Q)
    49     1.07510572e+03   # mbR(Q)
Block au Q= 1.06624556e+03  
  1  1    -1.70527404e+03   # Au(Q)MSSM DRbar
  2  2    -1.70527392e+03   # Ac(Q)MSSM DRbar
  3  3    -1.69775204e+03   # At(Q)MSSM DRbar
Block ad Q= 1.06624556e+03  
  1  1    -1.32301641e+01   # Ad(Q)MSSM DRbar
  2  2    -1.32301252e+01   # As(Q)MSSM DRbar
  3  3    -1.07546621e+01   # Ab(Q)MSSM DRbar
Block ae Q= 1.06624556e+03  
  1  1    -2.09373787e+00   # Ae(Q)MSSM DRbar
  2  2    -2.09373688e+00   # Amu(Q)MSSM DRbar
  3  3    -2.09344230e+00   # Atau(Q)MSSM DRbar
