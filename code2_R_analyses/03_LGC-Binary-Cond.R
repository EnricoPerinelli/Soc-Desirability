
# Conditional Latent Basis Model 1: Big Five ------------------------------

LGCcond1_BF <- glue::glue('

  # Latent variables for Big5 and Job Satisfaction
  
   extrTOT_19_lv  =~ extr_p1_19  + extr_p2_19  + extr_p3_19
   agrTOT_19_lv   =~ agr_p1_19   + agr_p2_19   + agr_p3_19
   conscTOT_19_lv =~ consc_p1_19 + consc_p2_19 + consc_p3_19
   neurTOT_19_lv  =~ neur_p1_19  + neur_p2_19  + neur_p3_19
   openTOT_19_lv  =~ open_p1_19  + open_p2_19  + open_p3_19
   
   # js24           =~ cw24q128 + cw24q129 + cw24q130 + cw24q131 + cw24q133
   
   
   # Latent exogenous covariances: Big5, i, s 
   
   extrTOT_19_lv  ~~ agrTOT_19_lv   + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
   agrTOT_19_lv   ~~ conscTOT_19_lv + neurTOT_19_lv  + openTOT_19_lv
   conscTOT_19_lv ~~ neurTOT_19_lv  + openTOT_19_lv
   neurTOT_19_lv  ~~ openTOT_19_lv

   i ~~ extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
   s ~~ extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
   
   
   # Job Satisfaction 2024 regressed on Big5, i, and s

   # js24 ~ i + s + extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
  
   
   # Invariance script
   
   {LGCmodel3_slopeNL}
  
  ')


## Fit and Summary --------------------------------------------------------

fit_LGCcond1_BF <- sem(
  model = LGCcond1_BF,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(
  fit_LGCcond1_BF,
  fit.measures = TRUE,
  standardized = TRUE,
  rsquare = TRUE
)


# Conditional Latent Basis Model 2: Big Five and Job satisfaction ---------

LGCcond2_BF_JS <- glue::glue('

  # Latent variables for Big5 and Job Satisfaction
  
   extrTOT_19_lv  =~ 1*extr_p1_19  + extr_p2_19  + extr_p3_19
   agrTOT_19_lv   =~ 1*agr_p1_19   + agr_p2_19   + agr_p3_19
   conscTOT_19_lv =~ 1*consc_p1_19 + consc_p2_19 + consc_p3_19
   neurTOT_19_lv  =~ 1*neur_p1_19  + neur_p2_19  + neur_p3_19
   openTOT_19_lv  =~ 1*open_p1_19  + open_p2_19  + open_p3_19
   
   js24           =~ 1*cw24q128 + cw24q129 + cw24q130 + cw24q131 + cw24q133
   
   
   extrTOT_19_lv  ~~ extrTOT_19_lv
   agrTOT_19_lv   ~~ agrTOT_19_lv
   conscTOT_19_lv ~~ conscTOT_19_lv
   neurTOT_19_lv  ~~ neurTOT_19_lv
   openTOT_19_lv  ~~ openTOT_19_lv
   
   js24           ~~ js24
   
   
   # Latent exogenous covariances: Big5, i, s 
   
   extrTOT_19_lv  ~~ agrTOT_19_lv   + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
   agrTOT_19_lv   ~~ conscTOT_19_lv + neurTOT_19_lv  + openTOT_19_lv
   conscTOT_19_lv ~~ neurTOT_19_lv  + openTOT_19_lv
   neurTOT_19_lv  ~~ openTOT_19_lv

   i ~~ extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
   s ~~ extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
   
   
   # Job Satisfaction 2024 regressed on Big5, i, and s

   js24 ~ i + s + extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv
  
   
   # Invariance script
   
   {LGCmodel3_slopeNL}
  
  ')


## Fit and Summary --------------------------------------------------------

fit_LGCcond2_BF_JS <- sem(
  model = LGCcond2_BF_JS,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(
  fit_LGCcond2_BF_JS,
  fit.measures = TRUE,
  standardized = TRUE,
  rsquare = TRUE
)
