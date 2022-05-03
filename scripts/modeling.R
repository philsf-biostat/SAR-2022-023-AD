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

tab_inf <- tbl_stack(list(
  tbl_regression(m0, include = frequency, show_single_row = frequency, label = list(frequency = "Crude estimate")),
  tbl_regression(m1, include = frequency, show_single_row = frequency, label = list(frequency = "Controlled for VAS reduction")),
  tbl_regression(m2, include = frequency, show_single_row = frequency, label = list(frequency = "Controlled for sex and age")),
  tbl_regression(m3, include = frequency, show_single_row = frequency, label = list(frequency = "Controlled for VAS reduction, sex and age"))
  ),
  )

tab_app <- tbl_merge(list(
  tbl_regression(m0),
  tbl_regression(m1),
  tbl_regression(m2),
  tbl_regression(m3)
),
c(
  "Crude estimate",
  "Controlled for VAS reduction",
  "Controlled for sex and age",
  "Controlled for VAS reduction, sex and age"
  ),
)
