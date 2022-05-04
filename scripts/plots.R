# setup -------------------------------------------------------------------
# library(survminer)

ff.col <- "steelblue" # good for single groups scale fill/color brewer
ff.pal <- "Paired"    # good for binary groups scale fill/color brewer

scale_color_discrete <- function(...) scale_color_brewer(palette = ff.pal, ...)
scale_fill_discrete <- function(...) scale_fill_brewer(palette = ff.pal, ...)

gg <- analytical %>%
  ggplot() +
  theme_ff()

# plots -------------------------------------------------------------------

gg.outcome <- gg +
  geom_histogram(aes(outcome, ..density..), binwidth = .1, fill = ff.col, col = "gray20") +
  geom_density(aes(outcome), lwd = 1) +
  xlab(attr(analytical$outcome, "label")) +
  ylab("N")

# gg.age <- gg +
#   geom_histogram(aes(age),
#                  binwidth = 10,
#                  fill = ff.col)

gg.age <- gg +
  geom_density(aes(age, fill = sex),
                 # fill = ff.col,
                 alpha = .9,) +
  labs(fill = "Sex") +
  xlab(attr(analytical$age, "label")) +
  ylab("N")

gg.sex <- gg +
  geom_bar(aes(sex), fill = ff.col, col = "gray20") +
  xlab(attr(analytical$sex, "label")) +
  ylab("N")

# cool facet trick from https://stackoverflow.com/questions/3695497 by JWilliman
# gg +
#   geom_histogram(bins = 5, aes(outcome, y = ..count../tapply(..count.., ..PANEL.., sum)[..PANEL..]), fill = ff.col) +
#   scale_y_continuous(labels = scales::label_percent(accuracy = 1)) +
#   xlab(attr(analytical$outcome, "label")) +
#   ylab("") +
#   facet_wrap(~ group, ncol = 2)
