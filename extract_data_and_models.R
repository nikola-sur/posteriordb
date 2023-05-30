# see https://github.com/nikola-sur/posteriordb-r
# make sure that your working directory is set to the cloned "posteriordb" directory

rm(list = ls())

library(posteriordb)

# setwd(...)

my_pdb <- pdb_github()
pos <- posterior_names(my_pdb)

for (i in 1:length(pos)) {
  tryCatch({
    # obtain file names/locations
    po <- posterior(pos[i], my_pdb)
    dfp <- data_file_path(po)
    scfp <- stan_code_file_path(po)
  
    # copy to new folder
    new_dir <- paste0("./data/", pos[i], "/")
    dir.create(new_dir)
    file.copy(dfp, new_dir)
    file.copy(scfp, new_dir)
  })
}
