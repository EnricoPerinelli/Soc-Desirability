
# Conditional Latent Basis Model 3: Age (`lftdcat`) ---------

liss_19_24_comp$lftdcat <- as.numeric(liss_19_24_comp$lftdcat)


LGCcond3_BF_JS_Age <- glue::glue('

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
   
   
   # Latent exogenous covariances: Big5, i, s, age 
   
   extrTOT_19_lv  ~~ agrTOT_19_lv   + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv + lftdcat
   agrTOT_19_lv   ~~ conscTOT_19_lv + neurTOT_19_lv  + openTOT_19_lv + lftdcat
   conscTOT_19_lv ~~ neurTOT_19_lv  + openTOT_19_lv  + lftdcat
   neurTOT_19_lv  ~~ openTOT_19_lv  + lftdcat

   i ~~ extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv + lftdcat
   s ~~ extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv + lftdcat
   
   
   # Job Satisfaction 2024 regressed on Big5, i, s, and age

   js24 ~ i + s + extrTOT_19_lv + agrTOT_19_lv + conscTOT_19_lv + neurTOT_19_lv + openTOT_19_lv + lftdcat
  
   
   # Invariance script
   
   {LGCmodel3_slopeNL}
  
  ')


## Fit and Summary --------------------------------------------------------

fit_LGCcond3_BF_JS_Age <- sem(
  model = LGCcond3_BF_JS_Age,
  data = liss_19_24_comp,
  ordered = paste0("SocDes", rep(1:10, 6), "_", rep(19:24, each = 10)),
  estimator = "WLSMV",
  parameterization = "theta",
  # std.lv = TRUE,  # NOT TO BE USED IN LGC (otherwise, it standardizes I and S)
  control = list(iter.max = 10000)
)

summary(
  fit_LGCcond3_BF_JS_Age,
  fit.measures = TRUE,
  standardized = TRUE,
  rsquare = TRUE
)
