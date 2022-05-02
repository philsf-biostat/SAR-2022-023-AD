# setup -------------------------------------------------------------------
# library(moderndive)
library(broom)
# library(lmerTest)
# library(broom.mixed)
# library(simputation)
# library(mice)

# raw estimate ------------------------------------------------------------

m0 <- lm(outcome ~ pain_reduc, analytical)

# adjusted ----------------------------------------------------------------

m1 <- lm(outcome ~ pain_reduc + frequency, analytical)
m1 %>% tidy
m1 %>% glance
m1 %>% augment
