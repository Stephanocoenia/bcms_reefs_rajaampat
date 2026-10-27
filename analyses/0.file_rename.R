# 0. Rename the raw sequence files ------------------------------------------------
#
# The file names from the sequencing laboratory are long. This script keeps the first
# parts of each name (e.g. "e1100058918_Cyano114_R1") and adds ".filt.fastq.gz", the
# pattern used in 1.Illumina_pipeline.Rmd.
#
# Run it once, from the project folder, BEFORE 1.Illumina_pipeline.Rmd.
# Use EITHER option A OR option B below, not both: after renaming, the old names no
# longer exist.

old_dir <- "data/sequences"            # raw files from the laboratory
new_dir <- "data/sequences_renamed"    # renamed files (input of 1.Illumina_pipeline.Rmd)
keep    <- c(1, 2, 3)                  # parts of the name (split at "_") that are kept

dir.create(new_dir, showWarnings = FALSE)
old_names  <- list.files(old_dir, pattern = "filt\\.fastq\\.gz$")
name_parts <- strsplit(old_names, "_")

# Check the first file before renaming everything
name_parts[[1]]
paste(name_parts[[1]][keep], collapse = "_")


# Option A: keep the selected parts ------------------------------------------------
new_names <- vapply(name_parts, function(p) paste(p[keep], collapse = "_"), character(1))
new_names <- paste0(new_names, ".filt.fastq.gz")


# Option B: as A, but also remove one underscore -----------------------------------
# Use this instead of A if a sample ID itself contains an underscore.
# remove_nth_underscore <- function(string, n) {
#   parts <- strsplit(string, "_")[[1]]
#   if (n > length(parts) - 1) stop("n is greater than the number of underscores in the string")
#   parts[n] <- paste0(parts[n], parts[n + 1])
#   paste(parts[-(n + 1)], collapse = "_")
# }
# new_names <- vapply(new_names, remove_nth_underscore, character(1), n = 2)   # n = underscore in the file name to remove
# (the earlier version used n = 3 because it counted the "_" in "sequences_renamed" of the path)


# Check and rename -----------------------------------------------------------------
sanity_check <- data.frame(old = old_names, new = new_names)
head(sanity_check)
stopifnot(!anyDuplicated(new_names))   # two files may not get the same name

file.rename(from = file.path(old_dir, old_names),
            to   = file.path(new_dir, new_names))
