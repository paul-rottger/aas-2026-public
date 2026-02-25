
# Week 6 tutorial, AAS 2025/26: Appendix
# This script re-codes variables from the ESS10 dataset. 
# You do not need to run this code to complete the tutorial. 

# You can access the full ESS10 dataset at https://ess.sikt.no/en/datafile/f37d014a-6958-42d4-b03b-17c29e481d3d. 

# Load the dataset
survey_df <- read.csv('ESS10e03_3.csv')

library(dplyr)

# Select variables and re-code where needed. 
survey_df_selected <- 
  survey_df %>%
  select(cntry, marsts, eduyrs, hinctnta, gndr, agegroup, happy, 
         rlgblg, feethngr, trstplt, polintr, pbldmna, 
         netusoft, lrscale, acchome) %>%
  
  # -------------------------
# Partner status
# -------------------------
mutate(
  
  # Recode ESS missing values
  marsts = ifelse(marsts %in% c(66,77,88,99), NA, marsts),
  
  # Create binary indicator (1 = partnered, 0 = not partnered)
  partnered = case_when(
    marsts %in% c(1,2) ~ 1,
    marsts %in% c(3,4,5,6) ~ 0,
    TRUE ~ NA_real_
  ),
  
  # Convert to factor for modelling
  partnered = factor(partnered,
                     levels = c(0,1),
                     labels = c("not_partnered", "partnered"))
) %>%
  select(-marsts) %>%
  
  # -------------------------
# Education
# -------------------------
mutate(
  
  # Recode ESS missing values
  eduyrs = ifelse(eduyrs %in% c(77, 88, 99), NA, eduyrs),
  
  # Rename variable
  education_years = eduyrs
) %>%
  
  # -------------------------
# Household income
# -------------------------
mutate(
  
  # Recode ESS missing values
  hinctnta = ifelse(hinctnta %in% c(77, 88, 99), NA, hinctnta),
  
  # Rename variable (1 = lowest decile, 10 = highest)
  income_decile = hinctnta
) %>%
  
  # -------------------------
# Gender
# -------------------------
mutate(
  
  # Recode ESS missing values
  gndr = ifelse(gndr == 9, NA, gndr),
  
  # Create binary indicator (1 = female, 0 = male)
  female = case_when(
    gndr == 1 ~ 0,
    gndr == 2 ~ 1,
    TRUE ~ NA_real_
  )
) %>%
  
  # -------------------------
# Age group
# -------------------------
mutate(
  
  # Recode ESS missing values
  agegroup = ifelse(agegroup == 99, NA, agegroup),
  
  # Rename variable (1 = 15–24 ... 7 = 75+)
  age_group = agegroup
) %>%
  
  # -------------------------
# Happiness
# -------------------------
mutate(
  
  # Recode ESS missing values
  happy = ifelse(happy %in% c(77, 88, 99), NA, happy),
  
  # Rename variable
  happiness = happy
) %>% 
  
  # -------------------------
# Religious affiliation
# -------------------------
mutate(
  
  # Recode ESS missing values
  rlgblg = ifelse(rlgblg %in% c(7, 8, 9), NA, rlgblg),
  
  # Create binary indicator (1 = religious, 0 = not religious)
  religious = case_when(
    rlgblg == 1 ~ 1,
    rlgblg == 2 ~ 0,
    TRUE ~ NA_real_
  )
) %>%
  
  # -------------------------
# Ethnic majority identification
# -------------------------
mutate(
  
  # Recode ESS missing values
  feethngr = ifelse(feethngr %in% c(7, 8, 9), NA, feethngr),
  
  # Create binary indicator (1 = majority group, 0 = not majority)
  ethnic_majority = case_when(
    feethngr == 1 ~ 1,
    feethngr == 2 ~ 0,
    TRUE ~ NA_real_
  )
) %>%
  
  # -------------------------
# Trust in politicians
# -------------------------
mutate(
  
  # Recode ESS missing values
  trstplt = ifelse(trstplt %in% c(77, 88, 99), NA, trstplt),
  
  # Rename variable
  trust_politicians = trstplt
) %>%
  
  # -------------------------
# Political interest
# -------------------------
mutate(
  
  # Recode ESS missing values
  polintr = ifelse(polintr %in% c(7, 8, 9), NA, polintr),
  
  # Reverse scale (higher = more interest)
  political_interest = case_when(
    polintr == 1 ~ 4,
    polintr == 2 ~ 3,
    polintr == 3 ~ 2,
    polintr == 4 ~ 1,
    TRUE ~ NA_real_
  )
) %>%
  
  # -------------------------
# Protest participation (outcome)
# -------------------------
mutate(
  
  # Recode ESS missing values
  pbldmna = ifelse(pbldmna %in% c(7, 8, 9), NA, pbldmna),
  
  # Create binary outcome (1 = participated, 0 = did not)
  protest_last12m = case_when(
    pbldmna == 1 ~ 1,
    pbldmna == 2 ~ 0,
    TRUE ~ NA_real_
  )
) %>%
  
  # -------------------------
# Internet use frequency
# -------------------------
mutate(
  
  # Recode ESS missing values
  netusoft = ifelse(netusoft %in% c(7, 8, 9), NA, netusoft),
  
  # Rename variable (1 = never, 5 = every day)
  internet_use = netusoft
) %>%
  
  # -------------------------
# Left–right ideological scale
# -------------------------
mutate(
  
  # Recode ESS missing values
  lrscale = ifelse(lrscale %in% c(77, 88, 99), NA, lrscale),
  
  # Rename variable
  left_right = lrscale
) %>%
  
  # -------------------------
# Internet access at home
# -------------------------
mutate(
  
  # Rename variable
  internet_access = acchome
) %>%
  
  # -------------------------
# Final variable selection
# -------------------------
select(
  protest_last12m,
  internet_use,
  cntry,
  female,
  age_group,
  partnered,
  education_years,
  income_decile,
  happiness,
  religious,
  ethnic_majority,
  trust_politicians,
  political_interest,
  left_right, 
  internet_access
)  
  
# Saving the dataset 
write.csv(survey_df_selected, "week6_tutorial_sample_2.csv")
  