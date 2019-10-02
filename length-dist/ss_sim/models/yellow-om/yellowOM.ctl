#V3.30.13.00-trans;_2019_03_09;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: codOM.dat // codOM.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none, only when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern
# begin and end years of blocks
 0 0
#
# controls for all timevary parameters
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for rest of years
#
#
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.01 0.15 0.08 0.05 -1 0.0226 -6 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 10 35 18 300 0 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40 120 62 66 -1 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.2 0.047 0.05 -1 0 -2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.2 0.13 0.19 -1 0 -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 -2 2 0.13 0.1 -1 0 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 -3 3 9.77e-006 2.09e-005 -1 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem
 -3 4 3.17125 2.96956 -1 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem
 38 39 38.78 40 -1 0 -50 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -0.437 -0.4 -1 0 -50 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 300000 137900 137900 -1 0 -6 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 39000 36500 36500 -1 0 -6 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem

# Hermaphroditism
#  Recruitment Distribution
 0 2 1 1 -1 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 -1 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 -1 0 -50 0 0 0 0 0 0 0 # RecrDist_Seas_1
 0 2 1 1 -1 0 -50 0 0 0 0 0 0 0 # CohortGrowDev
#  Cohort growth dev base
#  -4 4 1 0 0 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
#3 15 5.6 5 -1 99 -1 # SR_LN(R0)
# 0.2 1 0.44 0.44 -1 0.1 -7 # SR_BH_steep
# 0 5 0.5 1 -1 99 -50 # SR_sigmaR
# -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
#             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr

#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
            3             15          5.6          10.3            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.44           0.7          0.05             0         -4          0          0          0          0          0          0          0 # SR_BH_steep
             0             5           1           0.8           0.8             0         -5          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr



#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1 # first year of main recr_devs; early devs can preceed this era
500 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 500 #_last_yr_fullbias_adj_in_MPD
 500 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1R 2R 3R 4R 5R 6R 7R 8R 9R 10R 11R 12R 13R 14R 15R 16R 17R 18R 19R 20R 21R 22R 23R 24R 25R 26R 27R 28R 29R 30R 31R 32R 33R 34R 35R 36R 37R 38R 39R 40R 41R 42R 43R 44R 45R 46R 47R 48R 49R 50R 51R 52R 53R 54R 55R 56R 57R 58R 59R 60R 61R 62R 63R 64R 65R 66R 67R 68R 69R 70R 71R 72R 73R 74R 75R 76R 77R 78R 79R 80R 81R 82R 83R 84R 85R 86R 87R 88R 89R 90R 91R 92R 93R 94R 95R 96R 97R 98R 99R 100R 101R 102R 103R 104R 105R 106R 107R 108R 109R 110R 111R 112R 113R 114R 115R 116R 117R 118R 119R 120R 121R 122R 123R 124R 125R 126R 127R 128R 129R 130R 131R 132R 133R 134R 135R 136R 137R 138R 139R 140R 141R 142R 143R 144R 145R 146R 147R 148R 149R 150R 151R 152R 153R 154R 155R 156R 157R 158R 159R 160R 161R 162R 163R 164R 165R 166R 167R 168R 169R 170R 171R 172R 173R 174R 175R 176R 177R 178R 179R 180R 181R 182R 183R 184R 185R 186R 187R 188R 189R 190R 191R 192R 193R 194R 195R 196R 197R 198R 199R 200R 201R 202R 203R 204R 205R 206R 207R 208R 209R 210R 211R 212R 213R 214R 215R 216R 217R 218R 219R 220R 221R 222R 223R 224R 225R 226R 227R 228R 229R 230R 231R 232R 233R 234R 235R 236R 237R 238R 239R 240R 241R 242R 243R 244R 245R 246R 247R 248R 249R 250R 251R 252R 253R 254R 255R 256R 257R 258R 259R 260R 261R 262R 263R 264R 265R 266R 267R 268R 269R 270R 271R 272R 273R 274R 275R 276R 277R 278R 279R 280R 281R 282R 283R 284R 285R 286R 287R 288R 289R 290R 291R 292R 293R 294R 295R 296R 297R 298R 299R 300R 301R 302R 303R 304R 305R 306R 307R 308R 309R 310R 311R 312R 313R 314R 315R 316R 317R 318R 319R 320R 321R 322R 323R 324R 325R 326R 327R 328R 329R 330R 331R 332R 333R 334R 335R 336R 337R 338R 339R 340R 341R 342R 343R 344R 345R 346R 347R 348R 349R 350R 351R 352R 353R 354R 355R 356R 357R 358R 359R 360R 361R 362R 363R 364R 365R 366R 367R 368R 369R 370R 371R 372R 373R 374R 375R 376R 377R 378R 379R 380R 381R 382R 383R 384R 385R 386R 387R 388R 389R 390R 391R 392R 393R 394R 395R 396R 397R 398R 399R 400R 401R 402R 403R 404R 405R 406R 407R 408R 409R 410R 411R 412R 413R 414R 415R 416R 417R 418R 419R 420R 421R 422R 423R 424R 425R 426R 427R 428R 429R 430R 431R 432R 433R 434R 435R 436R 437R 438R 439R 440R 441R 442R 443R 444R 445R 446R 447R 448R 449R 450R 451R 452R 453R 454R 455R 456R 457R 458R 459R 460R 461R 462R 463R 464R 465R 466R 467R 468R 469R 470R 471R 472R 473R 474R 475R 476R 477R 478R 479R 480R 481R 482R 483R 484R 485R 486R 487R 488R 489R 490R 491R 492R 493R 494R 495R 496R 497R 498R 499R 500F
# 0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	
# implementation error by year in forecast:  0
#
#Fishing Mortality info
0.1 # F ballpark
-2001 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
1.5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
 0.2 1 1 # overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)
 1 1 1 0.004 0.005 -1
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#101 121
# F rates by fleet
# Yr:  1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fishery 0.004 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         0         0         0  #  Fishery
         2         1         0         0         0         0  #  Survey
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            -3             3             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_Fishery(1)
            -3             3             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_Survey(2)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 Fishery
 24 0 0 0 # 2 Survey
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 11 0 0 0 # 1 Fishery
 11 0 0 0 # 2 Survey
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Fishery LenSelex
            5           199          46.43          50.8          0.05             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_Fishery(1)
            -5             3            -1            -3          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_Fishery(1)
            -4            12           4.24           5.1          0.05             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Fishery(1)
            -2            16            15            15          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P4_Fishery(1)
           -15             5          -999          -999          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P5_Fishery(1)
            -5          1000           999           999          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P6_Fishery(1)
# 2   Survey LenSelex
            20           199          38.68          41.8          0.05             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_Survey(2)
            -5             3            -1            -4          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_Survey(2)
            -4            12           4.24           5.2          0.05             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Survey(2)
            -2            15            15           14          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P4_Survey(2)
          -100           100           -99           -99          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P5_Survey(2)
          -100           100            99            99          0.05             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P6_Survey(2)
# 1   Fishery AgeSelex
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_Fishery(1)
             0           101           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_Fishery(1)
# 2   Survey AgeSelex
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_Survey(2)
             0           101           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_Survey(2)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors:
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  1 1 1 1 #_CPUE/survey:_2
#  1 1 1 1 #_CPUE/survey:_3
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  0 0 0 0 #_lencomp:_3
#  1 1 1 1 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, year, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

