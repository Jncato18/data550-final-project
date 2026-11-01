library(ggplot2)

# Load prepared data
data <- readRDS("output/analysis_data.rds")

# Create Figure 1
figure1 <- ggplot(
  subset(
    data,
    !is.na(target_triage_acuity) &
      !is.na(wait_time_minutes)
  ),
  aes(
    x = factor(target_triage_acuity),
    y = wait_time_minutes
  )
) +
  geom_boxplot(outlier.shape = NA) +
  coord_cartesian(ylim = c(0, 100)) +
  labs(
    title = "Emergency Department Wait Time by Triage Acuity Level",
    subtitle = "Lower acuity levels indicate a higher level of medical urgency",
    x = "Triage Acuity Level",
    y = "Wait Time (minutes)"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5)
  )

# Save figure
saveRDS(figure1, "output/figure1.rds")