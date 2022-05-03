# setup -------------------------------------------------------------------
# library(moderndive)
library(broom)
# library(lmerTest)
# library(broom.mixed)
# library(simputation)
# library(mice)

# raw estimate ------------------------------------------------------------

m0 <- lm(outcome ~ frequency, analytical)

# adjusted ----------------------------------------------------------------

m1 <- lm(outcome ~ frequency + pain_reduc, analytical)

m1 %>% tidy
m1 %>% glance
m1 %>% augment

m2 <- lm(outcome ~ frequency + sex + age, analytical)

m3 <- lm(outcome ~ frequency + pain_reduc + age + sex, analytical)

m1_lab <- "Crude estimate"
m2_lab <- "Controlled for VAS reduction"
m3_lab <- "Controlled for sex and age"
m4_lab <- "Controlled for VAS reduction, sex and age"

# create & save table objects ---------------------------------------------

# tab_inf <- tbl_stack(list(
#   tbl_regression(m0, include = frequency, show_single_row = frequency, label = list(frequency = m1_lab)),
#   tbl_regression(m1, include = frequency, show_single_row = frequency, label = list(frequency = m2_lab)),
#   tbl_regression(m2, include = frequency, show_single_row = frequency, label = list(frequency = m3_lab)),
#   tbl_regression(m3, include = frequency, show_single_row = frequency, label = list(frequency = m4_lab))
#   ),
#   )
# 
# tab_app <- tbl_merge(list(
#   tbl_regression(m0),
#   tbl_regression(m1),
#   tbl_regression(m2),
#   tbl_regression(m3)
#   ),
#   c(
#     m1_lab,
#     m2_lab,
#     m3_lab,
#     m4_lab
#   ))
# 
# write_rds(tab_inf, file = "dataset/tab_mod.rds")
# write_rds(tab_app, file = "dataset/tab_app.rds")

# load table objects ------------------------------------------------------

tab_inf <- read_rds(file = "dataset/tab_mod.rds")
tab_app <- read_rds(file = "dataset/tab_app.rds")
