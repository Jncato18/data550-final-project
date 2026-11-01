library(gtsummary)

# Load prepared data
data <- readRDS("output/analysis_data.rds")

# Create Table 1
table1 <- data |>
  subset(!is.na(target_triage_acuity)) |>
  tbl_summary(
    by = target_triage_acuity,
    include = c(
      age,
      sex,
      ems_arrival,
      heart_rate,
      spo2,
      pain_score
    ),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} ({p}%)"
    ),
    digits = all_continuous() ~ 1,
    label = list(
      age ~ "Age (years)",
      sex ~ "Sex",
      ems_arrival ~ "EMS Arrival",
      heart_rate ~ "Heart Rate (bpm)",
      spo2 ~ "Oxygen Saturation (%)",
      pain_score ~ "Pain Score"
    ),
    missing = "no"
  ) |>
  modify_spanning_header(
    c("stat_1", "stat_2", "stat_3", "stat_4", "stat_5") ~
      "**Triage Acuity Level**"
  ) |>
  modify_footnote(
    label ~ "Mean (SD) for continuous variables; n (%) for categorical variables"
  ) |>
  modify_footnote(
    all_stat_cols() ~ NA
  )

# Save table
saveRDS(table1, "output/table1.rds")