
# Intercept-only Model ----------------------------------------------------

LGCmodel1_int <- '
  
  # Invariant Loadings (first one fixed to be 1)
  
  f19 =~ 1*SocDes1_19  + l2*SocDes2_19 + l3*SocDes3_19 + l4*SocDes4_19 + l5*SocDes5_19 +
         l6*SocDes6_19 + l7*SocDes7_19 + l8*SocDes8_19 + l9*SocDes9_19 + l10*SocDes10_19
  f20 =~ 1*SocDes1_20  + l2*SocDes2_20 + l3*SocDes3_20 + l4*SocDes4_20 + l5*SocDes5_20 +
         l6*SocDes6_20 + l7*SocDes7_20 + l8*SocDes8_20 + l9*SocDes9_20 + l10*SocDes10_20
  f21 =~ 1*SocDes1_21  + l2*SocDes2_21 + l3*SocDes3_21 + l4*SocDes4_21 + l5*SocDes5_21 +
         l6*SocDes6_21 + l7*SocDes7_21 + l8*SocDes8_21 + l9*SocDes9_21 + l10*SocDes10_21
  f22 =~ 1*SocDes1_22  + l2*SocDes2_22 + l3*SocDes3_22 + l4*SocDes4_22 + l5*SocDes5_22 +
         l6*SocDes6_22 + l7*SocDes7_22 + l8*SocDes8_22 + l9*SocDes9_22 + l10*SocDes10_22
  f23 =~ 1*SocDes1_23  + l2*SocDes2_23 + l3*SocDes3_23 + l4*SocDes4_23 + l5*SocDes5_23 +
         l6*SocDes6_23 + l7*SocDes7_23 + l8*SocDes8_23 + l9*SocDes9_23 + l10*SocDes10_23
  f24 =~ 1*SocDes1_24  + l2*SocDes2_24 + l3*SocDes3_24 + l4*SocDes4_24 + l5*SocDes5_24 +
         l6*SocDes6_24 + l7*SocDes7_24 + l8*SocDes8_24 + l9*SocDes9_24 + l10*SocDes10_24

  # Latent residual variables (equal; Grimm et al., 2017, p. 391)
  
  f19 ~~ r*f19
  f20 ~~ r*f20
  f21 ~~ r*f21
  f22 ~~ r*f22
  f23 ~~ r*f23
  f24 ~~ r*f24
  
  # Latent residual covariances (fixed to be zero)

  f19 ~~ 0*f20 + 0*f21 + 0*f22 + 0*f23 + 0*f24
  f20 ~~ 0*f21 + 0*f22 + 0*f23 + 0*f24
  f21 ~~ 0*f22 + 0*f23 + 0*f24
  f22 ~~ 0*f23 + 0*f24
  f23 ~~ 0*f24
  
  # Intercepts of Latent Factors (fixed to be zero)

  f19 ~ 0*1
  f20 ~ 0*1
  f21 ~ 0*1
  f22 ~ 0*1
  f23 ~ 0*1
  f24 ~ 0*1
  
  # Latent Curve
  
  i =~ 1*f19 + 1*f20 + 1*f21 + 1*f22 + 1*f23 + 1*f24
  i ~  0*1                # FIXED TO BE ZERO (Grimm et al., 2017, p. 390)
  i ~~ i

# s =~ 0*f19 + 1*f20 + 2*f21 + 3*f22 + 4*f23 + 5*f24
# s ~  1
# s ~~ s

# i ~~ s

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

fit_LGCmodel1_int <- sem(
  model = LGCmodel1_int,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(fit_LGCmodel1_int, fit.measures = TRUE, standardized = TRUE)



# Linear Slope Model ------------------------------------------------------

LGCmodel2_slope <- '
  
  # Invariant Loadings (first one fixed to be 1)
  
  f19 =~ 1*SocDes1_19  + l2*SocDes2_19 + l3*SocDes3_19 + l4*SocDes4_19 + l5*SocDes5_19 +
         l6*SocDes6_19 + l7*SocDes7_19 + l8*SocDes8_19 + l9*SocDes9_19 + l10*SocDes10_19
  f20 =~ 1*SocDes1_20  + l2*SocDes2_20 + l3*SocDes3_20 + l4*SocDes4_20 + l5*SocDes5_20 +
         l6*SocDes6_20 + l7*SocDes7_20 + l8*SocDes8_20 + l9*SocDes9_20 + l10*SocDes10_20
  f21 =~ 1*SocDes1_21  + l2*SocDes2_21 + l3*SocDes3_21 + l4*SocDes4_21 + l5*SocDes5_21 +
         l6*SocDes6_21 + l7*SocDes7_21 + l8*SocDes8_21 + l9*SocDes9_21 + l10*SocDes10_21
  f22 =~ 1*SocDes1_22  + l2*SocDes2_22 + l3*SocDes3_22 + l4*SocDes4_22 + l5*SocDes5_22 +
         l6*SocDes6_22 + l7*SocDes7_22 + l8*SocDes8_22 + l9*SocDes9_22 + l10*SocDes10_22
  f23 =~ 1*SocDes1_23  + l2*SocDes2_23 + l3*SocDes3_23 + l4*SocDes4_23 + l5*SocDes5_23 +
         l6*SocDes6_23 + l7*SocDes7_23 + l8*SocDes8_23 + l9*SocDes9_23 + l10*SocDes10_23
  f24 =~ 1*SocDes1_24  + l2*SocDes2_24 + l3*SocDes3_24 + l4*SocDes4_24 + l5*SocDes5_24 +
         l6*SocDes6_24 + l7*SocDes7_24 + l8*SocDes8_24 + l9*SocDes9_24 + l10*SocDes10_24

  # Latent residual variables (equal; Grimm et al., 2017, p. 391)
  
  f19 ~~ r*f19
  f20 ~~ r*f20
  f21 ~~ r*f21
  f22 ~~ r*f22
  f23 ~~ r*f23
  f24 ~~ r*f24
  
  # Latent residual covariances (fixed to be zero)

  f19 ~~ 0*f20 + 0*f21 + 0*f22 + 0*f23 + 0*f24
  f20 ~~ 0*f21 + 0*f22 + 0*f23 + 0*f24
  f21 ~~ 0*f22 + 0*f23 + 0*f24
  f22 ~~ 0*f23 + 0*f24
  f23 ~~ 0*f24
  
  # Intercepts of Latent Factors (fixed to be zero)

  f19 ~ 0*1
  f20 ~ 0*1
  f21 ~ 0*1
  f22 ~ 0*1
  f23 ~ 0*1
  f24 ~ 0*1
  
  # Latent Curve
  
  i =~ 1*f19 + 1*f20 + 1*f21 + 1*f22 + 1*f23 + 1*f24
  i ~  0*1                # FIXED TO BE ZERO (Grimm et al., 2017, p. 390)
  i ~~ i

  s =~ 0*f19 + 1*f20 + 2*f21 + 3*f22 + 4*f23 + 5*f24
  s ~  1
  s ~~ s

  i ~~ s

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

fit_LGCmodel2_slope <- sem(
  model = LGCmodel2_slope,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(fit_LGCmodel2_slope, fit.measures = TRUE, standardized = TRUE)


# Non-Linear Slope (Latent Basis) Model -----------------------------------

LGCmodel3_slopeNL <- '
  
  # Invariant Loadings (first one fixed to be 1)
  
  f19 =~ 1*SocDes1_19  + l2*SocDes2_19 + l3*SocDes3_19 + l4*SocDes4_19 + l5*SocDes5_19 +
         l6*SocDes6_19 + l7*SocDes7_19 + l8*SocDes8_19 + l9*SocDes9_19 + l10*SocDes10_19
  f20 =~ 1*SocDes1_20  + l2*SocDes2_20 + l3*SocDes3_20 + l4*SocDes4_20 + l5*SocDes5_20 +
         l6*SocDes6_20 + l7*SocDes7_20 + l8*SocDes8_20 + l9*SocDes9_20 + l10*SocDes10_20
  f21 =~ 1*SocDes1_21  + l2*SocDes2_21 + l3*SocDes3_21 + l4*SocDes4_21 + l5*SocDes5_21 +
         l6*SocDes6_21 + l7*SocDes7_21 + l8*SocDes8_21 + l9*SocDes9_21 + l10*SocDes10_21
  f22 =~ 1*SocDes1_22  + l2*SocDes2_22 + l3*SocDes3_22 + l4*SocDes4_22 + l5*SocDes5_22 +
         l6*SocDes6_22 + l7*SocDes7_22 + l8*SocDes8_22 + l9*SocDes9_22 + l10*SocDes10_22
  f23 =~ 1*SocDes1_23  + l2*SocDes2_23 + l3*SocDes3_23 + l4*SocDes4_23 + l5*SocDes5_23 +
         l6*SocDes6_23 + l7*SocDes7_23 + l8*SocDes8_23 + l9*SocDes9_23 + l10*SocDes10_23
  f24 =~ 1*SocDes1_24  + l2*SocDes2_24 + l3*SocDes3_24 + l4*SocDes4_24 + l5*SocDes5_24 +
         l6*SocDes6_24 + l7*SocDes7_24 + l8*SocDes8_24 + l9*SocDes9_24 + l10*SocDes10_24

  # Latent residual variables (equal; Grimm et al., 2017, p. 391)
  
  f19 ~~ r*f19
  f20 ~~ r*f20
  f21 ~~ r*f21
  f22 ~~ r*f22
  f23 ~~ r*f23
  f24 ~~ r*f24
  
  # Latent residual covariances (fixed to be zero)

  f19 ~~ 0*f20 + 0*f21 + 0*f22 + 0*f23 + 0*f24
  f20 ~~ 0*f21 + 0*f22 + 0*f23 + 0*f24
  f21 ~~ 0*f22 + 0*f23 + 0*f24
  f22 ~~ 0*f23 + 0*f24
  f23 ~~ 0*f24
  
  # Intercepts of Latent Factors (fixed to be zero)

  f19 ~ 0*1
  f20 ~ 0*1
  f21 ~ 0*1
  f22 ~ 0*1
  f23 ~ 0*1
  f24 ~ 0*1
  
  # Latent Curve
  
  i =~ 1*f19 + 1*f20 + 1*f21 + 1*f22 + 1*f23 + 1*f24
  i ~  0*1                # FIXED TO BE ZERO (Grimm et al., 2017, p. 390)
  i ~~ i

# s =~ 0*f19  + f20   + f21 + f22 + f23 + 1*f24  # old non-linear slope
  s =~ NA*f19 + 0*f20 + f21 + f22 + f23 + 1*f24
  s ~  1
  s ~~ s

  i ~~ s

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

fit_LGCmodel3_slopeNL <- sem(
  model = LGCmodel3_slopeNL,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(fit_LGCmodel3_slopeNL, fit.measures = TRUE, standardized = TRUE)


### Print CI for the best fitting LGC (only Intercepts and Slope parameters) ----

parameterEstimates(
  fit_LGCmodel3_slopeNL
  )[parameterEstimates(
    fit_LGCmodel3_slopeNL)$lhs == "s" | parameterEstimates(
      fit_LGCmodel3_slopeNL)$rhs == "s" | parameterEstimates(
        fit_LGCmodel3_slopeNL)$rhs == "i" , ]


# Quadratic Model -----------------------------------

LGCmodel4_Quadr <- '
  
  # Invariant Loadings (first one fixed to be 1)
  
  f19 =~ 1*SocDes1_19  + l2*SocDes2_19 + l3*SocDes3_19 + l4*SocDes4_19 + l5*SocDes5_19 +
         l6*SocDes6_19 + l7*SocDes7_19 + l8*SocDes8_19 + l9*SocDes9_19 + l10*SocDes10_19
  f20 =~ 1*SocDes1_20  + l2*SocDes2_20 + l3*SocDes3_20 + l4*SocDes4_20 + l5*SocDes5_20 +
         l6*SocDes6_20 + l7*SocDes7_20 + l8*SocDes8_20 + l9*SocDes9_20 + l10*SocDes10_20
  f21 =~ 1*SocDes1_21  + l2*SocDes2_21 + l3*SocDes3_21 + l4*SocDes4_21 + l5*SocDes5_21 +
         l6*SocDes6_21 + l7*SocDes7_21 + l8*SocDes8_21 + l9*SocDes9_21 + l10*SocDes10_21
  f22 =~ 1*SocDes1_22  + l2*SocDes2_22 + l3*SocDes3_22 + l4*SocDes4_22 + l5*SocDes5_22 +
         l6*SocDes6_22 + l7*SocDes7_22 + l8*SocDes8_22 + l9*SocDes9_22 + l10*SocDes10_22
  f23 =~ 1*SocDes1_23  + l2*SocDes2_23 + l3*SocDes3_23 + l4*SocDes4_23 + l5*SocDes5_23 +
         l6*SocDes6_23 + l7*SocDes7_23 + l8*SocDes8_23 + l9*SocDes9_23 + l10*SocDes10_23
  f24 =~ 1*SocDes1_24  + l2*SocDes2_24 + l3*SocDes3_24 + l4*SocDes4_24 + l5*SocDes5_24 +
         l6*SocDes6_24 + l7*SocDes7_24 + l8*SocDes8_24 + l9*SocDes9_24 + l10*SocDes10_24

  # Latent residual variables (equal; Grimm et al., 2017, p. 391)
  
  f19 ~~ r*f19
  f20 ~~ r*f20
  f21 ~~ r*f21
  f22 ~~ r*f22
  f23 ~~ r*f23
  f24 ~~ r*f24
  
  # Latent residual covariances (fixed to be zero)

  f19 ~~ 0*f20 + 0*f21 + 0*f22 + 0*f23 + 0*f24
  f20 ~~ 0*f21 + 0*f22 + 0*f23 + 0*f24
  f21 ~~ 0*f22 + 0*f23 + 0*f24
  f22 ~~ 0*f23 + 0*f24
  f23 ~~ 0*f24
  
  # Intercepts of Latent Factors (fixed to be zero)

  f19 ~ 0*1
  f20 ~ 0*1
  f21 ~ 0*1
  f22 ~ 0*1
  f23 ~ 0*1
  f24 ~ 0*1
  
  # Latent Curve
  
  i =~ 1*f19 + 1*f20 + 1*f21 + 1*f22 + 1*f23 + 1*f24
  i ~  0*1                # FIXED TO BE ZERO (Grimm et al., 2017, p. 390)
  i ~~ i

  s =~ -1*f19 + 0*f20 + 1*f21 + 2*f22 + 3*f23 + 4*f24
  s ~  1
  s ~~ s
  
  q =~ 1*f19 + 0*f20 + 1*f21 + 4*f22 + 9*f23 + 16*f24
  q ~  1
  q ~~ q
  

  i ~~ s
  i ~~ q
  s ~~ q
  

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

fit_LGCmodel4_Quadr <- sem(
  model = LGCmodel4_Quadr,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(fit_LGCmodel4_Quadr, fit.measures = TRUE, standardized = TRUE)

# Model Comparison --------------------------------------------------------

lavTestLRT(
  fit_LGCmodel1_int,
  fit_LGCmodel2_slope,
  fit_LGCmodel3_slopeNL,
  # fit_LGCmodel4_Quadr     # Removed, since cov matrix of latent variables is not positive definite
  method =  "satorra.2000"
)
