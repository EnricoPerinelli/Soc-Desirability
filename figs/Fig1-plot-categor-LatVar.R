
# Two plots illustrating the link between observed frequencies,
# category proportions, thresholds, and the underlying latent variable.
#
# Plot 1 shows the observed distribution of binary item 1,
# including frequencies and proportions.
#
# Plot 2 represents the assumed latent continuous variable (y*),
# normally distributed, with a threshold (tau) that splits the continuum:
# values below tau correspond to y = 0 (no social desirability), and values above tau to y = 1 (social desirability).
#
# The threshold is computed as tau = qnorm(p1), so that the area under
# the normal curve to the left of tau matches the observed proportion
# of category 0. This illustrates how observed categorical responses
# can be interpreted as discretizations of a latent continuous variable.

# Finally, the 2 plots were merged with the probit latent variable representation created in LaTeX


rm(list = ls())

library(ggplot2)
library(dplyr)
library(patchwork)
library(jpeg)
library(grid)


# Observed frequencies
n1 <- 521
n2 <- 2127
N <- n1 + n2

# Observed probabilities
p1 <- n1 / N
p2 <- n2 / N

# Threshold
tau <- qnorm(p1)

# -------------------------
# Plot 1: observed ordinal variable
# -------------------------
df_bar <- data.frame(
  y1 = factor(c(0, 1)),
  Frequency = c(n1, n2),
  Proportion = c(p1, p2)
)

g1 <- ggplot(df_bar, aes(x = y1, y = Frequency)) +
  geom_col(fill = "darkgrey", color = "black", linewidth = 0.8, width = 1) +
  geom_text(
    aes(label = paste0(Frequency, "\n(", round(Proportion * 100, 1), "%)")),
    vjust = 1.2,
    size = 4
  ) +
  labs(x = "y", y = "Frequency") +
  theme_gray(base_size = 12)

# -------------------------
# Plot 2: latent variable with threshold
# -------------------------
x <- seq(-3, 3, length.out = 1000)

df_curve <- data.frame(
  x = x,
  y = dnorm(x)
)

df_area <- df_curve %>%
  filter(x <= tau)

g2 <- ggplot(df_curve, aes(x = x, y = y)) +
  geom_line(linewidth = 1.4, color = "black") +
  geom_area(data = df_area, fill = "grey70") +
  geom_segment(
    x = tau, xend = tau,
    y = 0, yend = dnorm(tau),
    linewidth = 1.2,
    color = "black"
  ) +
  annotate(
    "text",
    x = tau - 0.25,
    y = dnorm(tau) + 0.02,
    label = paste0("tau[1] == ", round(tau, 2)),
    parse = TRUE,
    hjust = 1,
    size = 5
  ) +
  annotate(
    "text",
    x = tau - 1,
    y = 0.1,
    label = paste0(round(p1 * 100, 1), "%"),
    size = 5
  ) +
  annotate(
    "text",
    x = tau + 1,
    y = 0.1,
    label = paste0(round(p2 * 100, 1), "%"),
    size = 5
  ) +
  scale_x_continuous(breaks = -3:3) +
  labs(x = expression(y^"*"), y = NULL) +
  theme_gray(base_size = 12)

# Print
g1
g2


# Merge on the left and create a blank part in the right
placeholder <- ggplot() + theme_void()
placeholder | (g2 / g1)


# -------------------------
# Merge the jpg
# -------------------------


img <- readJPEG("Fig1a-Latent-categor.jpg")

left_plot <- wrap_elements(
  full = rasterGrob(img, interpolate = TRUE)
)

final_plot <- left_plot | (g2 / g1) +
  plot_layout(widths = c(0.9, 1.4))

final_plot

ggsave(
  "Fig1.jpg",
  final_plot,
  width = 12,
  height = 8,
  dpi = 600,
  quality = 100
)


rm(list = ls())
