
# Configural Invariance ---------------------------------------------------

MI_configural <- '
  
  # Latent factors (2019-2024) for Social Desirability
  
  f19 =~ SocDes1_19 + SocDes2_19 + SocDes3_19 + SocDes4_19 + SocDes5_19 +
         SocDes6_19 + SocDes7_19 + SocDes8_19 + SocDes9_19 + SocDes10_19
  f20 =~ SocDes1_20 + SocDes2_20 + SocDes3_20 + SocDes4_20 + SocDes5_20 +
         SocDes6_20 + SocDes7_20 + SocDes8_20 + SocDes9_20 + SocDes10_20
  f21 =~ SocDes1_21 + SocDes2_21 + SocDes3_21 + SocDes4_21 + SocDes5_21 +
         SocDes6_21 + SocDes7_21 + SocDes8_21 + SocDes9_21 + SocDes10_21
  f22 =~ SocDes1_22 + SocDes2_22 + SocDes3_22 + SocDes4_22 + SocDes5_22 +
         SocDes6_22 + SocDes7_22 + SocDes8_22 + SocDes9_22 + SocDes10_22
  f23 =~ SocDes1_23 + SocDes2_23 + SocDes3_23 + SocDes4_23 + SocDes5_23 +
         SocDes6_23 + SocDes7_23 + SocDes8_23 + SocDes9_23 + SocDes10_23
  f24 =~ SocDes1_24 + SocDes2_24 + SocDes3_24 + SocDes4_24 + SocDes5_24 +
         SocDes6_24 + SocDes7_24 + SocDes8_24 + SocDes9_24 + SocDes10_24
  
  # Latent-factor variances
  
  f19 ~~ 1*f19
  f20 ~~ 1*f20
  f21 ~~ 1*f21
  f22 ~~ 1*f22
  f23 ~~ 1*f23
  f24 ~~ 1*f24
  
  # Latent Covariances
  
  f19 ~~ f20 + f21 + f22 + f23 + f24
  f20 ~~ f21 + f22 + f23 + f24
  f21 ~~ f22 + f23 + f24
  f22 ~~ f23 + f24
  f23 ~~ f24
  
  # Residual Covariances across waves for each pair of items
  
  SocDes1_19 ~~ SocDes1_20 + SocDes1_21 + SocDes1_22 + SocDes1_23 + SocDes1_24
  SocDes1_20 ~~ SocDes1_21 + SocDes1_22 + SocDes1_23 + SocDes1_24
  SocDes1_21 ~~ SocDes1_22 + SocDes1_23 + SocDes1_24
  SocDes1_22 ~~ SocDes1_23 + SocDes1_24
  SocDes1_23 ~~ SocDes1_24

  SocDes2_19 ~~ SocDes2_20 + SocDes2_21 + SocDes2_22 + SocDes2_23 + SocDes2_24
  SocDes2_20 ~~ SocDes2_21 + SocDes2_22 + SocDes2_23 + SocDes2_24
  SocDes2_21 ~~ SocDes2_22 + SocDes2_23 + SocDes2_24
  SocDes2_22 ~~ SocDes2_23 + SocDes2_24
  SocDes2_23 ~~ SocDes2_24

  SocDes3_19 ~~ SocDes3_20 + SocDes3_21 + SocDes3_22 + SocDes3_23 + SocDes3_24
  SocDes3_20 ~~ SocDes3_21 + SocDes3_22 + SocDes3_23 + SocDes3_24
  SocDes3_21 ~~ SocDes3_22 + SocDes3_23 + SocDes3_24
  SocDes3_22 ~~ SocDes3_23 + SocDes3_24
  SocDes3_23 ~~ SocDes3_24

  SocDes4_19 ~~ SocDes4_20 + SocDes4_21 + SocDes4_22 + SocDes4_23 + SocDes4_24
  SocDes4_20 ~~ SocDes4_21 + SocDes4_22 + SocDes4_23 + SocDes4_24
  SocDes4_21 ~~ SocDes4_22 + SocDes4_23 + SocDes4_24
  SocDes4_22 ~~ SocDes4_23 + SocDes4_24
  SocDes4_23 ~~ SocDes4_24

  SocDes5_19 ~~ SocDes5_20 + SocDes5_21 + SocDes5_22 + SocDes5_23 + SocDes5_24
  SocDes5_20 ~~ SocDes5_21 + SocDes5_22 + SocDes5_23 + SocDes5_24
  SocDes5_21 ~~ SocDes5_22 + SocDes5_23 + SocDes5_24
  SocDes5_22 ~~ SocDes5_23 + SocDes5_24
  SocDes5_23 ~~ SocDes5_24

  SocDes6_19 ~~ SocDes6_20 + SocDes6_21 + SocDes6_22 + SocDes6_23 + SocDes6_24
  SocDes6_20 ~~ SocDes6_21 + SocDes6_22 + SocDes6_23 + SocDes6_24
  SocDes6_21 ~~ SocDes6_22 + SocDes6_23 + SocDes6_24
  SocDes6_22 ~~ SocDes6_23 + SocDes6_24
  SocDes6_23 ~~ SocDes6_24

  SocDes7_19 ~~ SocDes7_20 + SocDes7_21 + SocDes7_22 + SocDes7_23 + SocDes7_24
  SocDes7_20 ~~ SocDes7_21 + SocDes7_22 + SocDes7_23 + SocDes7_24
  SocDes7_21 ~~ SocDes7_22 + SocDes7_23 + SocDes7_24
  SocDes7_22 ~~ SocDes7_23 + SocDes7_24
  SocDes7_23 ~~ SocDes7_24

  SocDes8_19 ~~ SocDes8_20 + SocDes8_21 + SocDes8_22 + SocDes8_23 + SocDes8_24
  SocDes8_20 ~~ SocDes8_21 + SocDes8_22 + SocDes8_23 + SocDes8_24
  SocDes8_21 ~~ SocDes8_22 + SocDes8_23 + SocDes8_24
  SocDes8_22 ~~ SocDes8_23 + SocDes8_24
  SocDes8_23 ~~ SocDes8_24

  SocDes9_19 ~~ SocDes9_20 + SocDes9_21 + SocDes9_22 + SocDes9_23 + SocDes9_24
  SocDes9_20 ~~ SocDes9_21 + SocDes9_22 + SocDes9_23 + SocDes9_24
  SocDes9_21 ~~ SocDes9_22 + SocDes9_23 + SocDes9_24
  SocDes9_22 ~~ SocDes9_23 + SocDes9_24
  SocDes9_23 ~~ SocDes9_24

  SocDes10_19 ~~ SocDes10_20 + SocDes10_21 + SocDes10_22 + SocDes10_23 + SocDes10_24
  SocDes10_20 ~~ SocDes10_21 + SocDes10_22 + SocDes10_23 + SocDes10_24
  SocDes10_21 ~~ SocDes10_22 + SocDes10_23 + SocDes10_24
  SocDes10_22 ~~ SocDes10_23 + SocDes10_24
  SocDes10_23 ~~ SocDes10_24
'

## Fit and Summary --------------------------------------------------------

fit_MI_configural <- cfa(
  model = MI_configural,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  std.lv = TRUE, # Free lambda#1 and fix latent variances to be 1
  control = list(iter.max = 10000)
)

summary(fit_MI_configural, fit.measures = TRUE, standardized = TRUE)


# Reliability -------------------------------------------------------------

# semTools::compRelSEM(fit_MI_configural) # NO LONGER WORKS (27-mar-2026)
#   f19   f20   f21   f22   f23   f24 
# 0.561 0.554 0.550 0.551 0.537 0.560



# Thresholds/Loadings Invariance ------------------------------------------

## For binary data, thresholds and loadings must be constrained together
## for model identification (Millsap & Yun-Tein, 2004; Wu & Estabrook, 2016)
 

MI_thr_load <- '
  
  # Invariant Loadings
  
  f19 =~ l1*SocDes1_19 + l2*SocDes2_19 + l3*SocDes3_19 + l4*SocDes4_19 + l5*SocDes5_19 +
         l6*SocDes6_19 + l7*SocDes7_19 + l8*SocDes8_19 + l9*SocDes9_19 + l10*SocDes10_19
  f20 =~ l1*SocDes1_20 + l2*SocDes2_20 + l3*SocDes3_20 + l4*SocDes4_20 + l5*SocDes5_20 +
         l6*SocDes6_20 + l7*SocDes7_20 + l8*SocDes8_20 + l9*SocDes9_20 + l10*SocDes10_20
  f21 =~ l1*SocDes1_21 + l2*SocDes2_21 + l3*SocDes3_21 + l4*SocDes4_21 + l5*SocDes5_21 +
         l6*SocDes6_21 + l7*SocDes7_21 + l8*SocDes8_21 + l9*SocDes9_21 + l10*SocDes10_21
  f22 =~ l1*SocDes1_22 + l2*SocDes2_22 + l3*SocDes3_22 + l4*SocDes4_22 + l5*SocDes5_22 +
         l6*SocDes6_22 + l7*SocDes7_22 + l8*SocDes8_22 + l9*SocDes9_22 + l10*SocDes10_22
  f23 =~ l1*SocDes1_23 + l2*SocDes2_23 + l3*SocDes3_23 + l4*SocDes4_23 + l5*SocDes5_23 +
         l6*SocDes6_23 + l7*SocDes7_23 + l8*SocDes8_23 + l9*SocDes9_23 + l10*SocDes10_23
  f24 =~ l1*SocDes1_24 + l2*SocDes2_24 + l3*SocDes3_24 + l4*SocDes4_24 + l5*SocDes5_24 +
         l6*SocDes6_24 + l7*SocDes7_24 + l8*SocDes8_24 + l9*SocDes9_24 + l10*SocDes10_24

  # Latent-factor variances
  
  f19 ~~ 1*f19
  f20 ~~ 1*f20
  f21 ~~ 1*f21
  f22 ~~ 1*f22
  f23 ~~ 1*f23
  f24 ~~ 1*f24
  
  # Latent Covariances
  
  f19 ~~ f20 + f21 + f22 + f23 + f24
  f20 ~~ f21 + f22 + f23 + f24
  f21 ~~ f22 + f23 + f24
  f22 ~~ f23 + f24
  f23 ~~ f24

  # Invariant Theresholds

  SocDes1_19 | a*t1
  SocDes1_20 | a*t1
  SocDes1_21 | a*t1
  SocDes1_22 | a*t1
  SocDes1_23 | a*t1
  SocDes1_24 | a*t1

  SocDes2_19 | b*t1
  SocDes2_20 | b*t1
  SocDes2_21 | b*t1
  SocDes2_22 | b*t1
  SocDes2_23 | b*t1
  SocDes2_24 | b*t1

  SocDes3_19 | c*t1
  SocDes3_20 | c*t1
  SocDes3_21 | c*t1
  SocDes3_22 | c*t1
  SocDes3_23 | c*t1
  SocDes3_24 | c*t1

  SocDes4_19 | d*t1
  SocDes4_20 | d*t1
  SocDes4_21 | d*t1
  SocDes4_22 | d*t1
  SocDes4_23 | d*t1
  SocDes4_24 | d*t1

  SocDes5_19 | e*t1
  SocDes5_20 | e*t1
  SocDes5_21 | e*t1
  SocDes5_22 | e*t1
  SocDes5_23 | e*t1
  SocDes5_24 | e*t1

  SocDes6_19 | f*t1
  SocDes6_20 | f*t1
  SocDes6_21 | f*t1
  SocDes6_22 | f*t1
  SocDes6_23 | f*t1
  SocDes6_24 | f*t1

  SocDes7_19 | g*t1
  SocDes7_20 | g*t1
  SocDes7_21 | g*t1
  SocDes7_22 | g*t1
  SocDes7_23 | g*t1
  SocDes7_24 | g*t1

  SocDes8_19 | h*t1
  SocDes8_20 | h*t1
  SocDes8_21 | h*t1
  SocDes8_22 | h*t1
  SocDes8_23 | h*t1
  SocDes8_24 | h*t1

  SocDes9_19 | i*t1
  SocDes9_20 | i*t1
  SocDes9_21 | i*t1
  SocDes9_22 | i*t1
  SocDes9_23 | i*t1
  SocDes9_24 | i*t1

  SocDes10_19 | m*t1
  SocDes10_20 | m*t1
  SocDes10_21 | m*t1
  SocDes10_22 | m*t1
  SocDes10_23 | m*t1
  SocDes10_24 | m*t1

  
  # Latent Means (fixed to be zero at T1; Grimm et al., 2017, Ch. 15)
  
  f19 ~ 0*1
  f20 ~ 1
  f21 ~ 1
  f22 ~ 1
  f23 ~ 1
  f24 ~ 1
  
  # Residual Covariances across waves for each pair of items

  SocDes1_19 ~~ SocDes1_20 + SocDes1_21 + SocDes1_22 + SocDes1_23 + SocDes1_24
  SocDes1_20 ~~ SocDes1_21 + SocDes1_22 + SocDes1_23 + SocDes1_24
  SocDes1_21 ~~ SocDes1_22 + SocDes1_23 + SocDes1_24
  SocDes1_22 ~~ SocDes1_23 + SocDes1_24
  SocDes1_23 ~~ SocDes1_24

  SocDes2_19 ~~ SocDes2_20 + SocDes2_21 + SocDes2_22 + SocDes2_23 + SocDes2_24
  SocDes2_20 ~~ SocDes2_21 + SocDes2_22 + SocDes2_23 + SocDes2_24
  SocDes2_21 ~~ SocDes2_22 + SocDes2_23 + SocDes2_24
  SocDes2_22 ~~ SocDes2_23 + SocDes2_24
  SocDes2_23 ~~ SocDes2_24

  SocDes3_19 ~~ SocDes3_20 + SocDes3_21 + SocDes3_22 + SocDes3_23 + SocDes3_24
  SocDes3_20 ~~ SocDes3_21 + SocDes3_22 + SocDes3_23 + SocDes3_24
  SocDes3_21 ~~ SocDes3_22 + SocDes3_23 + SocDes3_24
  SocDes3_22 ~~ SocDes3_23 + SocDes3_24
  SocDes3_23 ~~ SocDes3_24

  SocDes4_19 ~~ SocDes4_20 + SocDes4_21 + SocDes4_22 + SocDes4_23 + SocDes4_24
  SocDes4_20 ~~ SocDes4_21 + SocDes4_22 + SocDes4_23 + SocDes4_24
  SocDes4_21 ~~ SocDes4_22 + SocDes4_23 + SocDes4_24
  SocDes4_22 ~~ SocDes4_23 + SocDes4_24
  SocDes4_23 ~~ SocDes4_24

  SocDes5_19 ~~ SocDes5_20 + SocDes5_21 + SocDes5_22 + SocDes5_23 + SocDes5_24
  SocDes5_20 ~~ SocDes5_21 + SocDes5_22 + SocDes5_23 + SocDes5_24
  SocDes5_21 ~~ SocDes5_22 + SocDes5_23 + SocDes5_24
  SocDes5_22 ~~ SocDes5_23 + SocDes5_24
  SocDes5_23 ~~ SocDes5_24

  SocDes6_19 ~~ SocDes6_20 + SocDes6_21 + SocDes6_22 + SocDes6_23 + SocDes6_24
  SocDes6_20 ~~ SocDes6_21 + SocDes6_22 + SocDes6_23 + SocDes6_24
  SocDes6_21 ~~ SocDes6_22 + SocDes6_23 + SocDes6_24
  SocDes6_22 ~~ SocDes6_23 + SocDes6_24
  SocDes6_23 ~~ SocDes6_24

  SocDes7_19 ~~ SocDes7_20 + SocDes7_21 + SocDes7_22 + SocDes7_23 + SocDes7_24
  SocDes7_20 ~~ SocDes7_21 + SocDes7_22 + SocDes7_23 + SocDes7_24
  SocDes7_21 ~~ SocDes7_22 + SocDes7_23 + SocDes7_24
  SocDes7_22 ~~ SocDes7_23 + SocDes7_24
  SocDes7_23 ~~ SocDes7_24

  SocDes8_19 ~~ SocDes8_20 + SocDes8_21 + SocDes8_22 + SocDes8_23 + SocDes8_24
  SocDes8_20 ~~ SocDes8_21 + SocDes8_22 + SocDes8_23 + SocDes8_24
  SocDes8_21 ~~ SocDes8_22 + SocDes8_23 + SocDes8_24
  SocDes8_22 ~~ SocDes8_23 + SocDes8_24
  SocDes8_23 ~~ SocDes8_24

  SocDes9_19 ~~ SocDes9_20 + SocDes9_21 + SocDes9_22 + SocDes9_23 + SocDes9_24
  SocDes9_20 ~~ SocDes9_21 + SocDes9_22 + SocDes9_23 + SocDes9_24
  SocDes9_21 ~~ SocDes9_22 + SocDes9_23 + SocDes9_24
  SocDes9_22 ~~ SocDes9_23 + SocDes9_24
  SocDes9_23 ~~ SocDes9_24

  SocDes10_19 ~~ SocDes10_20 + SocDes10_21 + SocDes10_22 + SocDes10_23 + SocDes10_24
  SocDes10_20 ~~ SocDes10_21 + SocDes10_22 + SocDes10_23 + SocDes10_24
  SocDes10_21 ~~ SocDes10_22 + SocDes10_23 + SocDes10_24
  SocDes10_22 ~~ SocDes10_23 + SocDes10_24
  SocDes10_23 ~~ SocDes10_24
'

## Fit and Summary --------------------------------------------------------

fit_MI_thr_load <- cfa(
  model = MI_thr_load,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  std.lv = TRUE, # Free lambda#1 and fix latent variances to be 1
  control = list(iter.max = 10000)
)

summary(fit_MI_thr_load, fit.measures = TRUE, standardized = TRUE)


# Model Comparison --------------------------------------------------------

lavTestLRT(fit_MI_configural, fit_MI_thr_load)

# Scaled Chi-Squared Difference Test (method = “satorra.2000”)
# 
# lavaan->lavTestLRT():  
#   lavaan NOTE: The “Chisq” column contains standard test statistics, not the robust test that should be reported per model. A 
# robust difference test is a function of two standard (not robust) statistics.
# 
#                    Df AIC BIC  Chisq  Chisq diff  RMSEA   Df diff Pr(>Chisq)  
# fit_MI_configural 1545         6308.4                                         
# fit_MI_thr_load   1640         6608.1     127.04 0.028526     95     0.0157 *
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
