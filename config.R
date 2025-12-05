# Functions --------------------------------------------------------------------
source(here::here("utils.R"))

options(timeout = 1000)

  ## List all objects in the global environment
all_objects <- ls(envir = .GlobalEnv)

  ## Filter only the functions
functions_loaded <- all_objects[sapply(all_objects, function(x) is.function(get(x)))]

# Packages ---------------------------------------------------------------------

  ## Initialize renv if it was not done before --------------------------------

    ### Check if renv is already initialized -----------------------------------
# if (!file.exists(here::here("renv.lock"))) {
#     ### Initialize renv if it hasn't been done before
#   renv::init()
# } else {
#     ### Restore the environment if renv is already initialized
#   renv::restore()
# }

# Uncomment and set custom paths if needed
# options(renv.config.library = "C:/R_Libraries")
# Sys.setenv(RENV_PATHS_CACHE = "C:/R_renv_cache")
# Sys.setenv(TMPDIR = "C:/R_Temp")

  ## Define required packages --------------------------------------------------
required_packages_cran <- c(
  "renv",
  "here",
  "tidyverse",
  "knitr",
  "rmarkdown",
  "readr",
  "remotes",
  "gridExtra",
  "grid",
  "pals",
  "cowplot",
  "RColorBrewer",
  "viridis",
  "rlang",
  "data.table",
  "chameleon",
  "circlize",
  "fmsb",
  "ggstatsplot",
  "ggpubr",
  "rstatix",
  "ggrepel",
  "stringr",
  "spdep",
  "ggraph",
  "tidygraph",
  "igraph",
  "Rtsne",
  "caret",
  "future",
  "future.apply",
  "progressr",
  "parallelly",
  "memuse",
  "ggsci",
  "shiny"
)

required_packages_github <- c(
  "Seurat",
  "SeuratData",
  "SeuratWrappers",
  "Banksy",
  "ggradar",
  "patchwork",
  "Rphenograph",
  "presto"
)

required_packages_bioconductor <- unique(c(
  "SpatialExperiment",
  "SingleCellExperiment",
  "dittoSeq",
  "SpatialFeatureExperiment",
  "scran",
  "SFEData",
  "Voyager",
  "scuttle",
  "scater",
  "ComplexHeatmap",
  "imcRtools",
  "CATALYST",
  "bluster",
  "BiocParallel",
  "BiocSingular",
  "SingleR",
  "GenomeInfoDbData"
))

    ### Initialize a flag to track if any packages were installed
packages_installed <- FALSE

  ## Install missing CRAN packages --------------------------------------------
missing_cran <- required_packages_cran[!sapply(required_packages_cran, requireNamespace, quietly = TRUE)]
if (length(missing_cran) > 0) {
  install.packages(missing_cran, checkBuilt = TRUE)
  packages_installed <- TRUE  # Update the flag
}

  ## Install missing GitHub packages ------------------------------------------
for (pkg in required_packages_github) {
  if (pkg == "Seurat") {
    installed <- install_missing_github_fx("Seurat", "satijalab/seurat@seurat5", use_remotes = TRUE)  # Install with remotes
  } else if (pkg == "SeuratData") {
    installed <- install_missing_github_fx("SeuratData", "satijalab/seurat-data")  # Install with devtools
  } else if (pkg == "SeuratWrappers") {
    installed <- install_missing_github_fx("SeuratWrappers",
                                           "satijalab/seurat-wrappers",
                                           use_remotes = TRUE)  # Install with remotes
  } else if (pkg == "Banksy") {
    installed <- install_missing_github_fx("Banksy", "prabhakarlab/Banksy", use_remotes = TRUE)  # Install with remotes
  } else if (pkg == "ggradar") {
    installed <- install_missing_github_fx("ggradar", "ricardo-bion/ggradar", use_remotes = FALSE)  # Install with devtools
  } else if (pkg == "patchwork") {
    installed <- install_missing_github_fx("patchwork", "thomasp85/patchwork", use_remotes = FALSE)  # Install with devtools
  } else if (pkg == "Rphenograph") {
    installed <- install_missing_github_fx("RPhenograph", "JinmiaoChenLab/Rphenograph", use_remotes = FALSE)  # Install with devtools
  } else if (pkg == "presto") {
    installed <- install_missing_github_fx("presto", "immunogenomics/presto", use_remotes = FALSE)  # Install with devtools
  } else {
    stop("Unknown package: ", pkg)
  }
  
  ### Update the flag if any package was installed
  if (installed) {
    packages_installed <- TRUE
  }
}

  ## Install missing Bioconductor packages ------------------------------------
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
  packages_installed <- TRUE  # Update the flag
}

missing_bioconductor <- required_packages_bioconductor[!sapply(required_packages_bioconductor, requireNamespace, quietly = TRUE)]
if (length(missing_bioconductor) > 0) {
  BiocManager::install(missing_bioconductor, ask = FALSE, update = TRUE)
  packages_installed <- TRUE  # Update the flag
}

  ## Load all required packages ---------------------------------------------------
all_packages <- c(required_packages_cran, required_packages_github, required_packages_bioconductor)
lapply(all_packages, library, character.only = TRUE)

  ## Conditionally run renv::snapshot() -----------------------------------------
# if (packages_installed) {
#   message("Packages were installed. Running renv::snapshot() to update the lockfile.")
#  # renv::snapshot()
# } else {
#   message("No new packages were installed. renv::snapshot() is not required.")
# }

# Directories ------------------------------------------------------------------

# Global variables -------------------------------------------------------------