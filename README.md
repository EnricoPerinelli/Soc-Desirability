## Supplementary Material - Social Desirability Stability and Change (*JRP*, 2026)

This repository contains code, figures, and full results related to the following article:

> Perinelli, E. (2026). Substantive individual differences in social desirability: Stability, change, and associations with personality traits and job satisfaction in a large-scale longitudinal survey. *Journal of Research in Personality*, *122*, Article 104726. [	
https://doi.org/10.1016/j.jrp.2026.104726 ](	
https://doi.org/10.1016/j.jrp.2026.104726)

------------------------------------------------------------------------

### Folders and Files

[`code1_R_pre-proces`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/code1_R_pre-proces)

- R script ([`00_pre-processing.R`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/code1_R_pre-proces/00_pre-processing.R)) for the preliminary data wrangling phase.



[`code2_R_analyses`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/code2_R_analyses)

- Five R scripts related to all the analyses reported in the article.



[`figs`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs)

- Figure 1

  - [`Fig1-plot-categor-LatVar.R`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig1-plot-categor-LatVar.R): This R script generates the two plots on the right-hand side, merges them with the left-hand side figure, and exports the final combined figure.\

  - [`Fig1a-Latent-categor.tex`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig1a-Latent-categor.tex): LaTeX code generating the latent variable representation on the left-hand side. The generated PDF is in [`Fig1a-Latent-categor.pdf`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig1a-Latent-categor.pdf), and the converted JPG file is in [`Fig1a-Latent-categor.jpg`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig1a-Latent-categor.jpg).\

  - [`Fig1.jpg`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig1.jpg): Final combined figure generated using the command at the bottom of [`Fig1-plot-categor-LatVar.R`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig1-plot-categor-LatVar.R).

- Figure 2

  - [`Fig2-rank-inv.tex`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig2-rank-inv.tex): LaTeX source file.\

  - Output available as [`Fig2-rank-inv.pdf`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig2-rank-inv.pdf) and [`Fig2-rank-inv.jpg`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig2-rank-inv.jpg).

- Figures 3 and 4

  - Generated within: [`code2_R_analyses/00_load_descr_corr_rel.R`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/code2_R_analyses/00_load_descr_corr_rel.R).\

  - Available as PNG files in [`Fig3-sd_item_heatmap.png`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig3-sd_item_heatmap.png) and [`Fig4-tetrachoric_matrix.png`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig4-tetrachoric_matrix.png), respectively.

- Figure 5

  - [`Fig5-SOLGC.tex`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig5-SOLGC.tex): LaTeX source file.\

  - Output available as [`Fig5-SOLGC.pdf`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig5-SOLGC.pdf) and [`Fig5-SOLGC.jpg`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig5-SOLGC.jpg).



[`output_results`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/output_results)

- Descriptive statistics:

  - [`freq_SD_items.txt`](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/freq_SD_items.txt): Detailed frequencies of Social Desirability items over time.

- Full results for tetrachoric correlations:

  - [`tetrach_corr.xlsx`](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/tetrach_corr.xlsx): values for the correlations shown in the correlogram/heatmap in [`Figure 4`](https://github.com/EnricoPerinelli/Soc-Desirability/tree/main/figs/Fig4-tetrachoric_matrix.png).\
  - [`tetrach_tau.xlsx`](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/tetrach_tau.xlsx): values of the threshold parameter ($\tau_{1}$) for each item.

- Full results for Structural Equation Models:
    
| File                            | Quarto source (.qmd)                                                                                                 | Raw HTML (.html)                                                                                                       | View HTML output in browser                                                                                 |
|:--------------------------------|:--------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------:|
| 01_Measur_Inv-Results           | [qmd](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/01_Measur_Inv-Results.qmd)        | [html](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/01_Measur_Inv-Results.html)        | [view](https://enricoperinelli.github.io/Soc-Desirability/output_results/01_Measur_Inv-Results.html)        |
| 02_LGC-Binary-Uncond-Results    | [qmd](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/02_LGC-Binary-Uncond-Results.qmd) | [html](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/02_LGC-Binary-Uncond-Results.html) | [view](https://enricoperinelli.github.io/Soc-Desirability/output_results/02_LGC-Binary-Uncond-Results.html) |
| 03_LGC-Binary-Cond-Results      | [qmd](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/03_LGC-Binary-Cond-Results.qmd)   | [html](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/03_LGC-Binary-Cond-Results.html)   | [view](https://enricoperinelli.github.io/Soc-Desirability/output_results/03_LGC-Binary-Cond-Results.html)   |
| 04_LGC-SupplAnalys-Results      | [qmd](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/04_LGC-SupplAnalys-Results.qmd)   | [html](https://github.com/EnricoPerinelli/Soc-Desirability/blob/main/output_results/04_LGC-SupplAnalys-Results.html)   | [view](https://enricoperinelli.github.io/Soc-Desirability/output_results/04_LGC-SupplAnalys-Results.html)   |
    
------------------------------------------------------------------------

### Data Availability

The data used in this study are part of the LISS panel archive and are not redistributed in this repository.\
They can be obtained upon request from the [LISS panel website](https://www.lissdata.nl/).

To reproduce the analyses, the required datasets should be placed in a local `data/` folder (which is excluded via `.gitignore` because of data access restrictions).

#### Required LISS dataset

``` text
data/
├── avars_201905_EN_1.0p.sav
├── cp08a_1p_EN.sav
├── cp09b_1.0p_EN.sav
├── cp10c_1.0p_EN.sav
├── cp11d_1.0p_EN.sav
├── cp12e_1.0p_EN.sav
├── cp13f_EN_1.0p.sav
├── cp14g_EN_1.0p.sav
├── cp15h_EN_1.0p.sav
├── cp17i_EN_1.0p.sav
├── cp18j_EN_1.0p.sav
├── cp19k_EN_1.0p.sav
├── cp20l_EN_1.0p.sav
├── cp21m_EN_1.0p.sav
├── cp22n_EN_1.0p.sav
├── cp23o_EN_1.0p.sav
├── cp24p_EN_1.0p.sav
└── cw24q_EN_1.0p.sav
```

------------------------------------------------------------------------

### License

This Supplementary Material provided in this GitHub repository is licensed under the\
**Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)**.\
Read more: [![Creative Commons License](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
