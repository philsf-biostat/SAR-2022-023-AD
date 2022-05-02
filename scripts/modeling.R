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
