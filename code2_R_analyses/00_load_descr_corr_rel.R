
# Libraries and Import data -----------------------------------------------

library(haven)
library(corrplot)
library(tidyverse)
library(psych)
library(lavaan)
library(semTools)
library(summarytools)

load("./socDesWorkspace.RData")
# save.image("./socDesWorkspace.RData")


liss_19_24_comp <- read_sav("./output_data/liss_19_24_comp.sav")

# Transform variables from <dbl+lbl> to <dbl> and create parcels ----------

## Job satisfaction -------------------------------------------------------

liss_19_24_comp$cw24q128 <- as.numeric(liss_19_24_comp$cw24q128)
liss_19_24_comp$cw24q129 <- as.numeric(liss_19_24_comp$cw24q129)
liss_19_24_comp$cw24q130 <- as.numeric(liss_19_24_comp$cw24q130)
liss_19_24_comp$cw24q131 <- as.numeric(liss_19_24_comp$cw24q131)
liss_19_24_comp$cw24q133 <- as.numeric(liss_19_24_comp$cw24q133)

## Personality Traits -----------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(across(c(
    extr1_19:extr10_19,
    agr1_19:agr10_19,
    consc1_19:consc10_19,
    neur1_19:neur10_19,
    open1_19:open10_19
  ),
  as.numeric)) %>% 
  # Parcelling: Extraversion
  mutate(
    extr_p1_19 = rowMeans(select(., extr1_19, extr4_19, extr7_19, extr10_19), na.rm = TRUE),
    extr_p2_19 = rowMeans(select(., extr2_19, extr5_19, extr8_19), na.rm = TRUE),
    extr_p3_19 = rowMeans(select(., extr3_19, extr6_19, extr9_19), na.rm = TRUE),
    
    # Agreeableness
    agr_p1_19 = rowMeans(select(., agr1_19, agr4_19, agr7_19, agr10_19), na.rm = TRUE),
    agr_p2_19 = rowMeans(select(., agr2_19, agr5_19, agr8_19), na.rm = TRUE),
    agr_p3_19 = rowMeans(select(., agr3_19, agr6_19, agr9_19), na.rm = TRUE),
    
    # Conscientiousness
    consc_p1_19 = rowMeans(select(., consc1_19, consc4_19, consc7_19, consc10_19), na.rm = TRUE),
    consc_p2_19 = rowMeans(select(., consc2_19, consc5_19, consc8_19), na.rm = TRUE),
    consc_p3_19 = rowMeans(select(., consc3_19, consc6_19, consc9_19), na.rm = TRUE),
    
    # Neuroticism
    neur_p1_19 = rowMeans(select(., neur1_19, neur4_19, neur7_19, neur10_19), na.rm = TRUE),
    neur_p2_19 = rowMeans(select(., neur2_19, neur5_19, neur8_19), na.rm = TRUE),
    neur_p3_19 = rowMeans(select(., neur3_19, neur6_19, neur9_19), na.rm = TRUE),
    
    # Openness
    open_p1_19 = rowMeans(select(., open1_19, open4_19, open7_19, open10_19), na.rm = TRUE),
    open_p2_19 = rowMeans(select(., open2_19, open5_19, open8_19), na.rm = TRUE),
    open_p3_19 = rowMeans(select(., open3_19, open6_19, open9_19), na.rm = TRUE)
  )


## Age and Gender ---------------------------------------------------------

liss_19_24_comp <- liss_19_24_comp %>%
  mutate(
    age_2019 = as.numeric(2019 - gebjaar),    # gebjaar = Year of birth
    gender = factor(
      geslacht,
      levels = c(1, 2),
      labels = c("Male", "Female")
    ),
    age_categ_2019 = factor(
      lftdcat,
      levels = c(1,2,3,4,5,6,7),
      labels = c("14 years and younger",
                 "15 - 24 years",
                 "25 - 34 years",
                 "35 - 44 years",
                 "45 - 54 years",
                 "55 - 64 years",
                 "65 years and older")
    )
  )


##  Check
# liss_19_24_comp %>% dplyr::select(age_2019, gebjaar, gender, geslacht, age_categ_2019, lftdcat) %>% View()


# Tetrachoric correlations ------------------------------------------------

tetra_all_items <- psych::tetrachoric(
  liss_19_24_comp %>%
    select(starts_with("SocDes"))
)

## Export in Excel --------------------------------------------------------

### Export corr -----------------------------------------------------------

writexl::write_xlsx(
  round(
    as.data.frame(tetra_all_items[["rho"]]), 2
  ) |>
    rownames_to_column(var = "Item"),
  "./output_results/tetrach_corr.xlsx"
)


### Export tau (thresholds) -----------------------------------------------

writexl::write_xlsx(
  round(
    as.data.frame(tetra_all_items[["tau"]]), 3
  ) |>
    setNames("Tau (Threshold)") |>
    rownames_to_column(var = "Item"),
  "./output_results/tetrach_tau.xlsx"
)


## Export in png ----------------------------------------------------------

png("./figs/Fig4-tetrachoric_matrix.png", width = 1600, height = 1200, res = 300)
corrplot(
  tetra_all_items$rho,
  method = "color",       # Use a color gradient to represent the correlation values
  type = "lower",         # Display only the lower triangle of the correlation matrix
  tl.col = "black",       # Color of the variable labels
  tl.cex = 0.4,           # Size of the text labels for variable names
  tl.srt = 45,            # Rotation angle of the text labels (in degrees)
  cl.cex = 0.6,           # Size of the text in the color legend bar
  cl.ratio = 0.1,         # Relative width of the color legend bar
  # addCoef.col = "black", # (optional) Add numerical correlation values to each cell
  # number.cex = 0.35,     # (optional) Size of the numbers if displayed
  diag = FALSE            # Do not display the diagonal of the matrix
)
dev.off()

# Percentage of Yes for SD items ------------------------------------------

sd_item_heatmap <- liss_19_24_comp %>%
  pivot_longer(cols = starts_with("SocDes"),
               names_to = "item_year",
               values_to = "response") %>%
  mutate(
    item = sub("_(\\d+)$", "", item_year),
    year = sub(".*_(\\d+)$", "\\1", item_year),
    item = factor(item, levels = paste0("SocDes", 1:10))  # <-- Correctly arrange items
  ) %>%
  group_by(item, year) %>%
  summarise(perc_yes = mean(response, na.rm = TRUE) * 100,
            .groups = "drop") %>%
  ggplot(aes(x = year, y = item, fill = perc_yes)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.1f%%", perc_yes)), size = 3) +
  scale_fill_gradient(low = "white", high = "steelblue") +
  theme_minimal() +
  labs(x = "Year",
       y = "Item",
       fill = "% Yes",
       title = "Proportion of 'Yes' responses for Social Desirability items across years (2019–2024)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  "./figs/Fig3-sd_item_heatmap.png",
  plot = sd_item_heatmap,
  width = 8,
  height = 6,
  dpi = 300
)

# Stability using sum scores ----------------------------------------------

liss_19_24_comp %>% 
  select(Social_Des_2019, Social_Des_2020, Social_Des_2021,
         Social_Des_2022, Social_Des_2023, Social_Des_2024) %>% 
  psych::corr.test(.,
  use = "pairwise",
  method = "spearman")



# Descriptive stats -------------------------------------------------------

summarytools::freq(liss_19_24_comp$gender)

#               Freq    % Valid   % Valid Cum.   % Total      % Total Cum.
#
# Male          1301     49.169     49.169         49.131     49.131
# Female        1345     50.831    100.000         50.793     99.924
# <NA>             2                                0.076     100.000
# Total         2648    100.000    100.000        100.000     100.000

summarytools::freq(liss_19_24_comp$age_categ_2019)

#                             Freq   % Valid   % Valid Cum.   % Total   % Total Cum.
#
# 14 years and younger          0     0.000          0.000     0.000          0.000
# 15 - 24 years               145     5.480          5.480     5.476          5.476
# 25 - 34 years               204     7.710         13.190     7.704         13.180
# 35 - 44 years               265    10.015         23.205    10.008         23.187
# 45 - 54 years               435    16.440         39.645    16.427         39.615
# 55 - 64 years               641    24.225         63.870    24.207         63.822
# 65 years and older          956    36.130        100.000    36.103         99.924
# <NA>                          2                              0.076        100.000
# Total                      2648   100.000        100.000   100.000        100.000

psych::describe(liss_19_24_comp$age_2019)

#     vars  n     mean    sd   median trimmed   mad  min   max  range  skew   kurtosis   se
# X1    1  2646   56.54 16.03     60    57.82 14.83  16    102    86   -0.64   -0.33    0.31


liss_19_24_comp %>% select(starts_with("SocDes")) %>% freq()


liss_19_24_comp %>% 
  dplyr::select(Social_Des_2019, Social_Des_2020, Social_Des_2021,
         Social_Des_2022, Social_Des_2023, Social_Des_2024,
         se_estTOT_19, extrTOT_19, agrTOT_19, conscTOT_19,
         neurTOT_19, openTOT_19, job_satTOT_24
         ) %>%
  psych::describe()

# Correlations SD and predictors ------------------------------------------------------------

liss_19_24_comp %>% 
  dplyr::select(Social_Des_2019, Social_Des_2020, Social_Des_2021,
         Social_Des_2022, Social_Des_2023, Social_Des_2024,
         se_estTOT_19, extrTOT_19, agrTOT_19, conscTOT_19,
         neurTOT_19, openTOT_19, job_satTOT_24,
         age_2019
  ) %>%
  psych::cor.ci()



# Reliability predictors/outcomes -----------------------------------------

liss_19_24_comp %>% 
  select(se_est1_19:se_est10_19) %>%
  psych::alpha()
# Self-est: 0.91

liss_19_24_comp %>% 
  select(extr1_19:extr10_19) %>%
  psych::alpha() 
# Extr: 0.88

liss_19_24_comp %>% 
  select(agr1_19:agr10_19) %>%
  psych::alpha()
# Agr: 0.83

liss_19_24_comp %>% 
  select(consc1_19:consc10_19) %>%
  psych::alpha()
# Consc: 0.78

liss_19_24_comp %>% 
  select(neur1_19:neur10_19) %>%
  psych::alpha()
# Neur: 0.9

liss_19_24_comp %>% 
  select(open1_19:open10_19) %>%
  psych::alpha()
# Open: 0.76

liss_19_24_comp %>% 
  select(cw24q128:cw24q133) %>%
  psych::alpha()
# Job Satisf: 0.83
