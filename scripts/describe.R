# setup -------------------------------------------------------------------

# library(Hmisc) # describe
# library(skimr) # skim
# library(gmodels) # CrossTable
library(gtsummary)
library(gt)
# library(effectsize)
# library(finalfit) # missing_compare

# setup gtsummary theme

theme_ff_gtsummary()
theme_gtsummary_compact()
# theme_gtsummary_language(language = "pt") # traduzir

# exploratory -------------------------------------------------------------

# overall description
# analytical %>%
#   skimr::skim()

# minimum detectable effect size
# interpret_cohens_d(0.5)
# cohens_d(outcome ~ group, data = analytical) %>% interpret_cohens_d()
# interpret_icc(0.7)

# tables ------------------------------------------------------------------

# tab_desc <- analytical %>%
#   tbl_summary(
#     include = c(sex, age, pain_pre, koos_pre),
#     # by = group,
#     type = list(age ~ "continuous", pain_pre ~ "continuous", koos_pre ~ "continuous")
#   ) %>%
#   # modify_caption(caption = "**Tabela 1** Características demográficas") %>%
#   modify_header(label ~ "**Baseline characteristics**") %>%
#   bold_labels() %>%
#   modify_table_styling(columns = "label", align = "c")
# 
# tab_outcome <- analytical %>%
#   tbl_summary(
#     include = c(outcome, pain_reduc, frequency),
#     type = list(pain_reduc ~ "continuous", frequency = "categorical"),
#     # by = frequency,
#   )
# 
# write_rds(tab_desc, "dataset/tab_desc.rds")
# write_rds(tab_outcome, "dataset/tab_outcome.rds")

tab_desc <- read_rds("dataset/tab_desc.rds")
tab_outcome <- read_rds("dataset/tab_outcome.rds")
