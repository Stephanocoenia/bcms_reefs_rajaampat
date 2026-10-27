# Benthic cyanobacterial mats of the reefs of Raja Ampat: analysis scripts


| Script | Aim/Analyses | Input | Output |
|---|---|---|---|
| `0.file_rename.R` | Shortens the raw file names | `data/sequences/` | `data/sequences_renamed/` |
| `1.Illumina_pipeline.Rmd` | DADA2, taxonomy, decontamination, reef subset | raw reads, `data/metadata_all_combined.csv` | `data/bcm_reefs_raja2023.rds` |
| `2.reads_filtering.Rmd` | Removes mats < 10,000 reads and ASVs in < 10% of mats; TSS; stacked table | `data/bcm_reefs_raja2023.rds` | `data/bcms_filtered_raja2023.rds`, `data/bcms_filtered&tss_reefs_raja2023.rds`, `data/ASV_taxa_stacked_tss.csv`, `data/ASV_taxa_table_tss.csv` |
| `3.environmental_correlations.Rmd` | Correlations, VIF, predictor selection, environment per site | `data/bcms_filtered_raja2023.rds` | – |
| `4.community_analysis.Rmd` | Composition, core microbiome, Hill numbers, PERMANOVA, PCoA, dbRDA | TSS rds, stacked csv | – |
| `5.morphotypes.Rmd` | Colour morphotypes and substrates | TSS rds | – |
| `6.gllvm_genus_responses.Rmd` | Genus-level GLLVMs and robust responses | `data/bcms_filtered_raja2023.rds` | models in `outputs/models/gllvm/` |
| `7.faprotax.Rmd` | FAPROTAX functions, beta regressions | `data/bcms_filtered_raja2023.rds` | – |

Environmental predictors (DIN, PO₄³⁻, temperature, chl-a) are selected in script 3 and standardised
within the reef mats in each script that uses them (4 and 6).

The raw reads and the intermediate DADA2 files are not in the repository (`.gitignore`). Raw reads: European Nucleotide Archive (ENA) under project accession PRJEB106188.

## Supplementary material and script outputs

| Supplement | Script output |
|---|---|
| Figure S1 | `figures/2.reads_filtering/F1_reads_per_mat.pdf` |
| Figure S2, S3 | `figures/4.community/F1_phyla_top10_site.pdf`, `F2_phyla_top10_mats.pdf` |
| Figure S4, S5 | `figures/5.morphotypes/F3_color_frequencies_sites.pdf`; `F1_substrate_frequencies.pdf` + `F2_substrate_nature_sites.pdf` |
| Figure S6 | `figures/3.environmental_correlations/F1_correlations_environment.pdf` |
| Figure S7 | `figures/6.gllvm_genus_responses/F4_residuals_env_model.pdf` |
| Figure S8 | `figures/6.gllvm_genus_responses/F6_coefficients_significant_any_variable.pdf` |
| Figure S9 | `figures/7.faprotax/F5_faprotax_main_functions_genera_per_site.pdf` |
| Figure 6 | `figures/6.gllvm_genus_responses/F7_coefficients_robust_taxa.pdf` |
| Table S4, S5 | `outputs/5.morphotypes/T3_permanova_substrate_color` |
| Table S6, S7 | `outputs/4.community/T5_permanova_sites` (pairwise), `T2_core_microbiome_asvs` |
| Table S8, S9 | `outputs/4.community/T3_hill_numbers_sites`, `T4_hill_numbers_env_models` |
| Table S10–S12 | `outputs/5.morphotypes/T2_alpha_substrate` |
| Table S13–S15 | `outputs/6.gllvm_genus_responses/T2_model_comparison`, `T2b_variance_partitioning`, `T4_stability_summary_robust_responses` |
| Table S16–S19 | `outputs/7.faprotax/T1_faprotax_coverage`, `T4_faprotax_all_functions_per_site`, `T5`/`T6` (Kruskal–Wallis, Dunn), `T2_energy_functions_models` |
| Results 3.1 numbers | `outputs/2.reads_filtering/T1_reads_and_asvs`, `T2_taxonomy_summary` |
