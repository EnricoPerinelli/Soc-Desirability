
library(tidyverse)
library(haven)


# Import all LISS "Personality" dataset ----------------------------------------------------
# (2008-2024; 2016 not collected),
# selecting only Social Desirability items

liss_08 <- read_sav("data/cp08a_1p_EN.sav")   %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp08a136:cp08a145) %>% na.omit()
liss_09 <- read_sav("data/cp09b_1.0p_EN.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp09b136:cp09b145) %>% na.omit()
liss_10 <- read_sav("data/cp10c_1.0p_EN.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp10c136:cp10c145) %>% na.omit()
liss_11 <- read_sav("data/cp11d_1.0p_EN.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp11d136:cp11d145) %>% na.omit()
liss_12 <- read_sav("data/cp12e_1.0p_EN.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp12e136:cp12e145) %>% na.omit()
liss_13 <- read_sav("data/cp13f_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp13f136:cp13f145) %>% na.omit()
liss_14 <- read_sav("data/cp14g_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp14g136:cp14g145) %>% na.omit()
liss_15 <- read_sav("data/cp15h_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp15h136:cp15h145) %>% na.omit()
liss_17 <- read_sav("data/cp17i_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp17i136:cp17i145) %>% na.omit()
liss_18 <- read_sav("data/cp18j_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp18j136:cp18j145) %>% na.omit()
liss_19 <- read_sav("data/cp19k_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp19k136:cp19k145) %>% na.omit()
liss_20 <- read_sav("data/cp20l_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp20l136:cp20l145) %>% na.omit()
liss_21 <- read_sav("data/cp21m_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp21m136:cp21m145) %>% na.omit()
liss_22 <- read_sav("data/cp22n_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp22n136:cp22n145) %>% na.omit()
liss_23 <- read_sav("data/cp23o_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp23o136:cp23o145) %>% na.omit()
liss_24 <- read_sav("data/cp24p_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) %>% select(nomem_encr, cp24p136:cp24p145) %>% na.omit()


# Create a list of dataframe
waves <- list(
  `2008` = liss_08,
  `2009` = liss_09,
  `2010` = liss_10,
  `2011` = liss_11,
  `2012` = liss_12,
  `2013` = liss_13,
  `2014` = liss_14,
  `2015` = liss_15,
  `2017` = liss_17,
  `2018` = liss_18,
  `2019` = liss_19,
  `2020` = liss_20,
  `2021` = liss_21,
  `2022` = liss_22,
  `2023` = liss_23,
  `2024` = liss_24
)

# Combine in long format
long_liss <- bind_rows(waves, .id = "year") %>%
  mutate(year = as.integer(year))

# Count how many waves each subject has completed
retention_counts <- long_liss %>%
  count(nomem_encr, name = "n_waves") %>%
  arrange(desc(n_waves))

# Calculate retention for groups of consecutive waves
id_per_year <- long_liss %>%
  group_by(year) %>%
  summarise(id_list = list(nomem_encr), .groups = "drop")
years <- sort(unique(long_liss$year))

retention_social_desirability_AR1 <- map_dfr(1:(length(years) - 1), function(i) {
  y1 <- years[i]
  y2 <- years[i + 1]
  id1 <- id_per_year %>% filter(year == y1) %>% pull(id_list) %>% .[[1]]
  id2 <- id_per_year %>% filter(year == y2) %>% pull(id_list) %>% .[[1]]
  tibble(
    from = y1,
    to = y2,
    n_common = length(intersect(id1, id2)),
    n_y1 = length(id1),
    retention_rate = length(intersect(id1, id2)) / length(id1)
  )
})

retention_social_desirability_AR1

# # A tibble: 15 × 5
# from        to   n_common  n_y1   retention_rate
# <int>     <int>    <int> <int>      <dbl>
# 1   2008  2009     5191  6766       0.767   
# 2   2009  2010        0  5618       0       
# 3   2010  2011      963  1368       0.704   
# 4   2011  2012        5  5281       0.000947
# 5   2012  2013      990  1467       0.675   
# 6   2013  2014     4295  5059       0.849   
# 7   2014  2015       14  6464       0.00217 
# 8   2015  2017      288   495       0.582   
# 9   2017  2018        7  6030       0.00116 
# 10  2018  2019      480   788       0.609   
# 11  2019  2020     4375  5022       0.871   
# 12  2020  2021     4862  5871       0.828   
# 13  2021  2022     4387  5317       0.825   
# 14  2022  2023     4690  5791       0.810   
# 15  2023  2024     4144  5175       0.801   


# Filter only 2019–2024
long_liss_19_24 <- long_liss %>%
  filter(year >= 2019, year <= 2024)

# Count number of years for each ID (`nomem_encr`)
particip_19_24 <- long_liss_19_24 %>%
  group_by(nomem_encr) %>%
  summarise(n_waves = n_distinct(year)) %>%
  arrange(desc(n_waves))

# Distribution of participation
particip_19_24 %>%
  count(n_waves) %>%
  arrange(desc(n_waves))

# # A tibble: 6 × 2
#    n_waves  n
#   <int> <int>
#      6  2648
#      5  1031
#      4   754
#      3  1249
#      2  1141
#      1  2511


# A dataframe including only ID with 6 waves
# If needed, export it in excel
full_retention_ids <- particip_19_24 %>%
  filter(n_waves == 6)





# Import only chosen dataset (i.e., 2019-2024) ----------------------------

dat_liss_19 <- read_sav("data/cp19k_EN_1.0p.sav") %>% arrange(desc("nomem_encr")) 
dat_liss_20 <- read_sav("data/cp20l_EN_1.0p.sav") %>% arrange(desc("nomem_encr"))
dat_liss_21 <- read_sav("data/cp21m_EN_1.0p.sav") %>% arrange(desc("nomem_encr"))
dat_liss_22 <- read_sav("data/cp22n_EN_1.0p.sav") %>% arrange(desc("nomem_encr"))
dat_liss_23 <- read_sav("data/cp23o_EN_1.0p.sav") %>% arrange(desc("nomem_encr"))
dat_liss_24 <- read_sav("data/cp24p_EN_1.0p.sav") %>% arrange(desc("nomem_encr"))

liss_19_24 <- list(
  dat_liss_19, dat_liss_20, dat_liss_21,
  dat_liss_22, dat_liss_23, dat_liss_24) %>%
  reduce(full_join, by = "nomem_encr")


## "Work and Schooling" dataset -------------------------------------------

dat_liss_24_work <- read_sav("data/cw24q_EN_1.0p.sav") %>%
  arrange(desc("nomem_encr")) %>%
  select(
    nomem_encr,
    # Job Satisfaction items
    cw24q128,
    cw24q129,
    cw24q130,
    cw24q131,
    cw24q133
  )

## "Background Variables" dataset --------------------------------------------

dat_liss_19_age_gender <- read_sav("data/avars_201905_EN_1.0p.sav") %>%
  arrange(desc("nomem_encr")) %>%
  dplyr::select(
    nomem_encr,
    geslacht,   # Gender (1 = Male, 2 = Female)
    gebjaar,    # Year of birth
    lftdcat     # Age in CBS (Statistics Netherlands) categories
  )


## Join -------------------------------------------------------------------

liss_19_24 <- liss_19_24 %>%
  left_join(dat_liss_24_work,       by = "nomem_encr") %>%
  left_join(dat_liss_19_age_gender, by = "nomem_encr")


## Export -----------------------------------------------------------------

write_sav(liss_19_24, "./output_data/liss_19_24.sav")

# Print Social Desirability items

for (i in 136:145) {
  print(
    liss_19_24 %>%
      select(ends_with(as.character(i))) %>%
      names()
  )
}


# Create SD items and Composite scores ------------------------------------

liss_19_24_comp <- liss_19_24

## 2019 ----

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    SocDes1_19 = case_when(
      cp19k136 == 1 ~ 0,
      cp19k136 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes2_19 = case_when(
      cp19k137 == 1 ~ 0,
      cp19k137 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes3_19 = case_when(  # reverse
      cp19k138 == 1 ~ 1,
      cp19k138 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes4_19 = case_when(  # reverse
      cp19k139 == 1 ~ 1,
      cp19k139 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes5_19 = case_when(
      cp19k140 == 1 ~ 0,
      cp19k140 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes6_19 = case_when(
      cp19k141 == 1 ~ 0,
      cp19k141 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes7_19 = case_when(  # reverse
      cp19k142 == 1 ~ 1,
      cp19k142 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes8_19 = case_when(
      cp19k143 == 1 ~ 0,
      cp19k143 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes9_19 = case_when(  # reverse
      cp19k144 == 1 ~ 1,
      cp19k144 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes10_19 = case_when(  # reverse
      cp19k145 == 1 ~ 1,
      cp19k145 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    Social_Des_2019 = rowSums(across(c(
      SocDes1_19, SocDes2_19, SocDes3_19, SocDes4_19, SocDes5_19,
      SocDes6_19, SocDes7_19, SocDes8_19, SocDes9_19, SocDes10_19
    )))
  )

## 2020 ----

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    SocDes1_20 = case_when(
      cp20l136 == 1 ~ 0,
      cp20l136 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes2_20 = case_when(
      cp20l137 == 1 ~ 0,
      cp20l137 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes3_20 = case_when(  # reverse
      cp20l138 == 1 ~ 1,
      cp20l138 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes4_20 = case_when(  # reverse
      cp20l139 == 1 ~ 1,
      cp20l139 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes5_20 = case_when(
      cp20l140 == 1 ~ 0,
      cp20l140 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes6_20 = case_when(
      cp20l141 == 1 ~ 0,
      cp20l141 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes7_20 = case_when(  # reverse
      cp20l142 == 1 ~ 1,
      cp20l142 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes8_20 = case_when(
      cp20l143 == 1 ~ 0,
      cp20l143 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes9_20 = case_when(  # reverse
      cp20l144 == 1 ~ 1,
      cp20l144 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes10_20 = case_when(  # reverse
      cp20l145 == 1 ~ 1,
      cp20l145 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    Social_Des_2020 = rowSums(across(c(
      SocDes1_20, SocDes2_20, SocDes3_20, SocDes4_20, SocDes5_20,
      SocDes6_20, SocDes7_20, SocDes8_20, SocDes9_20, SocDes10_20
    )))
  )

## 2021 ----

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    SocDes1_21 = case_when(
      cp21m136 == 1 ~ 0,
      cp21m136 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes2_21 = case_when(
      cp21m137 == 1 ~ 0,
      cp21m137 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes3_21 = case_when(  # reverse
      cp21m138 == 1 ~ 1,
      cp21m138 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes4_21 = case_when(  # reverse
      cp21m139 == 1 ~ 1,
      cp21m139 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes5_21 = case_when(
      cp21m140 == 1 ~ 0,
      cp21m140 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes6_21 = case_when(
      cp21m141 == 1 ~ 0,
      cp21m141 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes7_21 = case_when(  # reverse
      cp21m142 == 1 ~ 1,
      cp21m142 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes8_21 = case_when(
      cp21m143 == 1 ~ 0,
      cp21m143 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes9_21 = case_when(  # reverse
      cp21m144 == 1 ~ 1,
      cp21m144 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes10_21 = case_when(  # reverse
      cp21m145 == 1 ~ 1,
      cp21m145 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    Social_Des_2021 = rowSums(across(c(
      SocDes1_21, SocDes2_21, SocDes3_21, SocDes4_21, SocDes5_21,
      SocDes6_21, SocDes7_21, SocDes8_21, SocDes9_21, SocDes10_21
    )))
  )

## 2022 ----

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    SocDes1_22 = case_when(
      cp22n136 == 1 ~ 0,
      cp22n136 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes2_22 = case_when(
      cp22n137 == 1 ~ 0,
      cp22n137 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes3_22 = case_when(  # reverse
      cp22n138 == 1 ~ 1,
      cp22n138 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes4_22 = case_when(  # reverse
      cp22n139 == 1 ~ 1,
      cp22n139 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes5_22 = case_when(
      cp22n140 == 1 ~ 0,
      cp22n140 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes6_22 = case_when(
      cp22n141 == 1 ~ 0,
      cp22n141 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes7_22 = case_when(  # reverse
      cp22n142 == 1 ~ 1,
      cp22n142 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes8_22 = case_when(
      cp22n143 == 1 ~ 0,
      cp22n143 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes9_22 = case_when(  # reverse
      cp22n144 == 1 ~ 1,
      cp22n144 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes10_22 = case_when(  # reverse
      cp22n145 == 1 ~ 1,
      cp22n145 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    Social_Des_2022 = rowSums(across(c(
      SocDes1_22, SocDes2_22, SocDes3_22, SocDes4_22, SocDes5_22,
      SocDes6_22, SocDes7_22, SocDes8_22, SocDes9_22, SocDes10_22
    )))
  )

## 2023 ----

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    SocDes1_23 = case_when(
      cp23o136 == 1 ~ 0,
      cp23o136 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes2_23 = case_when(
      cp23o137 == 1 ~ 0,
      cp23o137 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes3_23 = case_when(  # reverse
      cp23o138 == 1 ~ 1,
      cp23o138 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes4_23 = case_when(  # reverse
      cp23o139 == 1 ~ 1,
      cp23o139 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes5_23 = case_when(
      cp23o140 == 1 ~ 0,
      cp23o140 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes6_23 = case_when(
      cp23o141 == 1 ~ 0,
      cp23o141 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes7_23 = case_when(  # reverse
      cp23o142 == 1 ~ 1,
      cp23o142 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes8_23 = case_when(
      cp23o143 == 1 ~ 0,
      cp23o143 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes9_23 = case_when(  # reverse
      cp23o144 == 1 ~ 1,
      cp23o144 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes10_23 = case_when(  # reverse
      cp23o145 == 1 ~ 1,
      cp23o145 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    Social_Des_2023 = rowSums(across(c(
      SocDes1_23, SocDes2_23, SocDes3_23, SocDes4_23, SocDes5_23,
      SocDes6_23, SocDes7_23, SocDes8_23, SocDes9_23, SocDes10_23
    )))
  )

## 2024 ----

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    SocDes1_24 = case_when(
      cp24p136 == 1 ~ 0,
      cp24p136 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes2_24 = case_when(
      cp24p137 == 1 ~ 0,
      cp24p137 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes3_24 = case_when(  # reverse
      cp24p138 == 1 ~ 1,
      cp24p138 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes4_24 = case_when(  # reverse
      cp24p139 == 1 ~ 1,
      cp24p139 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes5_24 = case_when(
      cp24p140 == 1 ~ 0,
      cp24p140 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes6_24 = case_when(
      cp24p141 == 1 ~ 0,
      cp24p141 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes7_24 = case_when(  # reverse
      cp24p142 == 1 ~ 1,
      cp24p142 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes8_24 = case_when(
      cp24p143 == 1 ~ 0,
      cp24p143 == 2 ~ 1,
      TRUE ~ NA_real_
    ),
    SocDes9_24 = case_when(  # reverse
      cp24p144 == 1 ~ 1,
      cp24p144 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    SocDes10_24 = case_when(  # reverse
      cp24p145 == 1 ~ 1,
      cp24p145 == 2 ~ 0,
      TRUE ~ NA_real_
    ),
    Social_Des_2024 = rowSums(across(c(
      SocDes1_24, SocDes2_24, SocDes3_24, SocDes4_24, SocDes5_24,
      SocDes6_24, SocDes7_24, SocDes8_24, SocDes9_24, SocDes10_24
    )))
  )


# Create predictors composite scores (only 2019) --------------------------


## Self-esteem ------------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>% 
  mutate(
    se_est1_19  = cp19k070,
    se_est2_19  = cp19k071,
    se_est3_19  = 8 - cp19k072,
    se_est4_19  = cp19k073,
    se_est5_19  = 8 - cp19k074,
    se_est6_19  = cp19k075,
    se_est7_19  = cp19k076,
    se_est8_19  = 8 - cp19k077,
    se_est9_19  = 8 - cp19k078,
    se_est10_19 = 8 - cp19k079,
    # Composite Score
    se_estTOT_19 = mean(c(
      se_est1_19, se_est2_19, se_est3_19, 
      se_est4_19, se_est5_19, se_est6_19,
      se_est7_19, se_est8_19, se_est9_19,
      se_est10_19))
  ) %>% 
  ungroup()

## Extraversion -----------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>% 
  mutate(
    extr1_19  = cp19k020,
    extr2_19  = 6 - cp19k025,
    extr3_19  = cp19k030,
    extr4_19  = 6 - cp19k035,
    extr5_19  = cp19k040,
    extr6_19  = 6 - cp19k045,
    extr7_19  = cp19k050,
    extr8_19  = 6 - cp19k055,
    extr9_19  = cp19k060,
    extr10_19 = 6 - cp19k065,
    # Composite Score
    extrTOT_19 = mean(c(
      extr1_19, extr2_19, extr3_19, 
      extr4_19, extr5_19, extr6_19,
      extr7_19, extr8_19, extr9_19,
      extr10_19))
  ) %>% 
  ungroup()

## Agreeableness ----------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>% 
  mutate(
    agr1_19  = 6 - cp19k021,
    agr2_19  = cp19k026,
    agr3_19  = 6 - cp19k031,
    agr4_19  = cp19k036,
    agr5_19  = 6 - cp19k041,
    agr6_19  = cp19k046,
    agr7_19  = 6 - cp19k051,
    agr8_19  = cp19k056,
    agr9_19  = cp19k061,
    agr10_19 = cp19k066,
    # Composite Score
    agrTOT_19 = mean(c(
      agr1_19, agr2_19, agr3_19, 
      agr4_19, agr5_19, agr6_19,
      agr7_19, agr8_19, agr9_19,
      agr10_19))
  ) %>% 
  ungroup()

## Conscientiousness ------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>% 
  mutate(
    consc1_19  = cp19k022,
    consc2_19  = 6 - cp19k027,
    consc3_19  = cp19k032,
    consc4_19  = 6 - cp19k037,
    consc5_19  = cp19k042,
    consc6_19  = 6 - cp19k047,
    consc7_19  = cp19k052,
    consc8_19  = 6 - cp19k057,
    consc9_19  = cp19k062,
    consc10_19 = cp19k067,
    # Composite Score
    conscTOT_19 = mean(c(
      consc1_19, consc2_19, consc3_19, 
      consc4_19, consc5_19, consc6_19,
      consc7_19, consc8_19, consc9_19,
      consc10_19))
  ) %>% 
  ungroup()

## Neuroticism ------------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>% 
  mutate(
    neur1_19  = cp19k023,
    neur2_19  = 6 - cp19k028,
    neur3_19  = cp19k033,
    neur4_19  = 6 - cp19k038,
    neur5_19  = cp19k043,
    neur6_19  = cp19k048,
    neur7_19  = cp19k053,
    neur8_19  = cp19k058,
    neur9_19  = cp19k063,
    neur10_19 = cp19k068,
    # Composite Score
    neurTOT_19 = mean(c(
      neur1_19, neur2_19, neur3_19, 
      neur4_19, neur5_19, neur6_19,
      neur7_19, neur8_19, neur9_19,
      neur10_19))
  ) %>% 
  ungroup()

## Openness ---------------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>% 
  mutate(
    open1_19  = cp19k024,
    open2_19  = 6 - cp19k029,
    open3_19  = cp19k034,
    open4_19  = 6 - cp19k039,
    open5_19  = cp19k044,
    open6_19  = 6 - cp19k049,
    open7_19  = cp19k054,
    open8_19  = cp19k059,
    open9_19  = cp19k064,
    open10_19 = cp19k069,
    # Composite Score
    openTOT_19 = mean(c(
      open1_19, open2_19, open3_19, 
      open4_19, open5_19, open6_19,
      open7_19, open8_19, open9_19,
      open10_19))
  ) %>% 
  ungroup()


# Create outcomes composite scores (only 2024) ----------------------------

## Job Satisfaction -------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  rowwise() %>%
  mutate(
    # Composite Score
    job_satTOT_24 = mean(c(
      cw24q128,
      cw24q129,
      cw24q130,
      cw24q131,
      cw24q133))
  ) %>% 
  ungroup()

# Export file in SPSS -----------------------------------------------------

## Remove missing data for SocDes -----------------------------------------
# (since WLSMV does not use FIML)

liss_19_24_comp <- liss_19_24_comp %>%
  filter(
    SocDes1_19 != "NA" & SocDes1_20 != "NA" & SocDes1_21 != "NA" & SocDes1_22 != "NA" & SocDes1_23 != "NA" & SocDes1_24 != "NA"
  )

## Write in .sav ----------------------------------------------------------

write_sav(
  liss_19_24_comp,
  "./output_data/liss_19_24_comp.sav"
)
