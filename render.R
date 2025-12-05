if (!requireNamespace("here", quietly = TRUE)) {
  install.packages("here")
}
library(here)

rmarkdown::render(
  input = here("Analysis/Quantification/Freq.Rmd"),
  output_file = "Freq.html",
  output_dir = here("Results/Quantification/"),
  knit_root_dir = here("Results/Quantification/")
)

rmarkdown::render(
  input = here(
    "Analysis/One time use/20240922_Transfer_PopV_ImmuneLabels_ColPairs.Rmd"
  ),
  output_file = "20240922_Transfer_PopV_ImmuneLabels_ColPairs.html",
  output_dir = here("Results/One time use/"),
  knit_root_dir = here("Results/One time use/")
)

rmarkdown::render(
  input = here(
    "Analysis/Neighbourhood/Neighbourhood_analysis.Rmd"
  ),
  output_file = "Neighbourhood_analysis.html",
  output_dir = here("Results/Neighbourhood/"),
  knit_root_dir = here("Results/Neighbourhood/")
)

rmarkdown::render(
  input = here(
    "Analysis/One time use/20241023_Freq_CN.Rmd"
  ),
  output_file = "20241023_Freq_CN_Fibroblast_CN.html",
  output_dir = here("Results/One time use/"),
  knit_root_dir = here("Results/One time use/")
)

rmarkdown::render(
  input = here(
    "Analysis/One time use/20241029_Neighbourhood_analysis_excludeIL13Fib_redospatialgraphs.Rmd"
  ),
  output_file = "20241029_Neighbourhood_analysis_excludeIL13Fib_redospatialgraphs.html",
  output_dir = here("Results/One time use/"),
  knit_root_dir = here("Results/One time use/")
)

rmarkdown::render(
  input = here(
    "Analysis/Annotation/BANKSY_clustering.Rmd"
  ),
  output_file = "Clustering_BANKSY_heart_lv1_test.html",
  output_dir = here("Results/Annotation/"),
  knit_root_dir = here("Results/Annotation/")
)


library(here)

rmarkdown::render(
  input = here("Analysis/Annotation/Annotation_plots.Rmd"),
  output_file = "Plots_annotation_BANKSY_heart_lv1_test2.html",
  output_dir = here("Results/Annotation/"),
  knit_root_dir = here("Results/Annotation/")
)

rmarkdown::render(
  input = here(
    "Analysis/Annotation/Annotation_labels.Rmd"
  ),
  output_file = "Labels_annotation_BANKSY_heart_lv1_test.html",
  output_dir = here("Results/Annotation/"),
  knit_root_dir = here("Results/Annotation/")
)

Rscript -e "rmarkdown::render('/mnt/data/home/alexmatei/CosMx_fistrun_Analysis_AEM/Analysis/Annotation/BANKSY_clustering.Rmd', output_file = 'Clustering_BANKSY_heart_lv1_test.html', output_dir = '/mnt/data/home/alexmatei/CosMx_fistrun_Analysis_AEM/Results/Annotation/')" > /mnt/data/home/alexmatei/CosMx_fistrun_Analysis_AEM/Logs/log_$(date +"%Y%m%d_%H%M%S").log 2>&1
