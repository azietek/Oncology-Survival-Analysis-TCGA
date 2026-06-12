library(TCGAbiolinks)

message("--- Downloading TCGA-BRCA data ---")

# Downloading clinical data only, which contains survival and receptor data
query <- GDCquery(
  project = "TCGA-BRCA",
  data.category = "Clinical",
  data.type = "Clinical Supplement",
  data.format = "BCR Biotab"
)

GDCdownload(query)

clinical_data_tables <- GDCprepare(query)

# clinical_patient_brca (main pacient and survival data)
df_patient <- clinical_data_tables$clinical_patient_brca

df_patient <- df_patient[df_patient$bcr_patient_uuid != "bcr_patient_uuid", ]
df_patient <- df_patient[df_patient$bcr_patient_uuid != "CDE_ID:", ]

if (!dir.exists("data")) dir.create("data")
saveRDS(df_patient, file = "data/raw_clinical_brca.rds")

message("--- Data saved in data/raw_clinical_brca.rds ---")
