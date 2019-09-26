#write.dir = "~/work/ICES/MGWG/MGWG/state-space/CCGOMyt/WHAM"
write.dir = "./"
user.wd <- "../" #"~/work/ICES/MGWG/SS_vs_SCAA/R/ccgomyt/"
user.od <- write.dir
model.id <- "GBhaddock"
ices.id = "GBHADDOCK_"
Fbar.ages = 5:7

library(TMB)
library(wham)
library(dplyr)
library(tidyr)
source("../../helper_code/convert_ICES_to_ASAP.r")
source("../../helper_code/wham_tab1.r")
source("../../helper_code/wham_tab2.r")
source("../../helper_code/wham_predict_index.r")
source("../../helper_code/wham_write_readme.r")
source("../../helper_code/wham_make_model_input.r")

# convert Lowestoft input files to vanilla ASAP
ICES2ASAP(user.wd, user.od, model.id = model.id, ices.id= ices.id)

asap3 = read_asap3_dat(paste0("ASAP_", model.id,".dat"))
file.remove(paste0("ASAP_", model.id,".dat"))
x = prepare_wham_input(asap3, model_name = model.id)
x$data$Fbar_ages = Fbar.ages
base = x

#SCAA, but with random effects for recruitment and index observation error variances fixed
m1 <- fit_wham(make_m1())
#Like m1, but change age comp likelihoods to logistic normal
m2 <- fit_wham(make_m2())
#full state-space model, abundance is the state vector
m3 <- fit_wham(make_m3())
#Like m3, but change age comp likelihoods to logistic normal
m4 <- fit_wham(make_m4())

res <- compare_wham_models(list(m1=m1, m2=m2, m3=m3, m4=m4), fname="model_compare", sort = FALSE)

#3-year projection for best model
wham_predict_index()

#Describe what we did for model 4
best = "m4"
wham_write_readme()
