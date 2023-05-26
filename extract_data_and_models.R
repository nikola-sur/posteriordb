# see https://github.com/nikola-sur/posteriordb-r
# make sure that your working directory is set to the cloned "posteriordb" directory

rm(list = ls())

library(posteriordb)

my_pdb <- pdb_github()

pos <- posterior_names(my_pdb)
pos

po <- posterior(pos[1], my_pdb) # you can loop through the posterior names

dfp <- data_file_path(po)
scfp <- stan_code_file_path(po)
dfp
scfp

# rpd <- reference_posterior_draws(po) # doesn't always work
