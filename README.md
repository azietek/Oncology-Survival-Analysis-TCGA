# Oncology Survival Analysis: Molecular Subtypes and Clinical Predictors in Breast Invasive Carcinoma (TCGA-BRCA)

## 📌 Project Overview

This repository contains a comprehensive biostatistical analysis of the **TCGA-BRCA (Breast Invasive Carcinoma)** dataset. The primary objective is to evaluate how molecular subtypes—specifically **Triple-Negative Breast Cancer (TNBC)**—and classical clinical predictors impact patient **Overall Survival (OS)**.

This analysis emphasizes **survival analysis, causal confounding adjustment, and statistical diagnostics** rather than purely predictive machine learning.

## 🩺 Clinical Background & Objective

Breast cancer is not a single disease but a collection of molecular subtypes defined by the expression of key receptors: Estrogen Receptor (ER), Progesterone Receptor (PR), and Human Epidermal Growth Factor Receptor 2 (HER2).

-   **Triple-Negative Breast Cancer (TNBC):** Defined as ER-, PR-, and HER2-. It is clinically aggressive and lacks targeted therapies.
-   **Primary Endpoint:** Overall Survival (OS), defined as the time from initial diagnosis to death or last follow-up (censoring).
-   **Key Question:** Does the TNBC phenotype significantly increase the hazard ratio of death when adjusting for age and pathologic stage?

## 📊 Data Source

Clinical data was programmatically fetched from the **GDC Portal** using the `TCGAbiolinks` R package. - **Cohort:** TCGA-BRCA - *Note: Raw data is excluded via `.gitignore`. Run `data_fetching.R` to local `/data` directory to replicate.*

## 🛠️ Tech Stack & Methodology

-   **Language:** R (v4.5)
-   **Key Packages:** `dplyr`, `survival`, `survminer`, `rmarkdown`
-   **Statistical Framework:**
    -   **Data Wrangling:** Time-to-event variable construction combining death and censoring days.
    -   **Kaplan-Meier Estimator:** Stratified by Breast Cancer Subtypes (TNBC vs. Non-TNBC).
    -   **Log-Rank Test:** To test the statistical significance of survival differences.
    -   **Cox Proportional Hazards Model:** Multivariate regression to estimate Adjusted Hazard Ratios (aHR).
    -   **Diagnostics:** Assessment of the Proportional Hazards assumption using Schoenfeld residuals.
    -   **Parametric Remediation (Weibull AFT Model):** To resolve the PH violation, a fully parametric **Weibull Accelerated Failure Time (AFT)** model was implemented. This allows for rigorous covariate adjustment (Age, Stage) and enables the interpretation of results via **Acceleration Factors (AF)**, evaluating how molecular and clinical factors accelerate or decelerate the "time-to-death" clock.

## 🚀 Quick Start

1.  Clone this repo.
2.  Run `data_fetching.R` to download data into `/data`.
3.  Open `analysis.Rmd` and click **Knit** in RStudio to generate the report.
