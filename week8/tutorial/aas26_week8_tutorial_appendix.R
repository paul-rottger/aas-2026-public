# Week 8 tutorial, AAS 2025/26: Appendix
# This script re-codes variables from the ACS dataset. 
# You do not need to run this code to complete the tutorial. 

# You can access the full ACS dataset at https://data.census.gov/.. 

# Load the dataset from the website to your system
# panel_merged <- read.csv("route to your file")

# Note that the tutorial sample also includes GDP levels loaded from the FRED database via fredr that are not part of the ACS dataset. 

panel_merged <- panel_merged %>%
  rename(
    geo = geography,
    
    # ---- Poverty ----
    pct_poverty_married = percent_percentage_of_families_and_people_whose_income_in_the_past_12_months_is_below_the_poverty_level_married_couple_families,
    pct_poverty_all = percent_percentage_of_families_and_people_whose_income_in_the_past_12_months_is_below_the_poverty_level_all_families,
    pct_poverty_female_head = percent_percentage_of_families_and_people_whose_income_in_the_past_12_months_is_below_the_poverty_level_families_with_female_householder_no_husband_present,
    pct_poverty_18_64 = percent_percentage_of_families_and_people_whose_income_in_the_past_12_months_is_below_the_poverty_level_18_to_64_years,
    
    # ---- Labor Market ----
    pct_labor_force = percent_employment_status_population_16_years_and_over_in_labor_force,
    pct_unemployed = percent_employment_status_population_16_years_and_over_in_labor_force_civilian_labor_force_unemployed,
    pct_not_in_labor_force = percent_employment_status_population_16_years_and_over_not_in_labor_force,
    pct_female_labor_force = percent_employment_status_females_16_years_and_over_in_labor_force_civilian_labor_force,
    
    pct_parents_lf_under6 = percent_employment_status_own_children_under_6_years_all_parents_in_family_in_labor_force,
    pct_parents_lf_6_17 = percent_employment_status_own_children_6_to_17_years_all_parents_in_family_in_labor_force,
    
    # ---- Commuting ----
    pct_work_from_home = percent_commuting_to_work_workers_16_years_and_over_worked_at_home,
    est_commute_time_min = estimate_commuting_to_work_mean_travel_time_to_work_minutes,
    
    # ---- Occupation ----
    pct_mgmt_occ = percent_occupation_civilian_employed_population_16_years_and_over_management_business_science_and_arts_occupations,
    pct_service_occ = percent_occupation_civilian_employed_population_16_years_and_over_service_occupations,
    
    # ---- Industry ----
    pct_manufacturing = percent_industry_civilian_employed_population_16_years_and_over_manufacturing,
    pct_health_edu = percent_industry_civilian_employed_population_16_years_and_over_educational_services_and_health_care_and_social_assistance,
    
    # ---- Class of Worker ----
    pct_private_workers = percent_class_of_worker_civilian_employed_population_16_years_and_over_private_wage_and_salary_workers,
    pct_gov_workers = percent_class_of_worker_civilian_employed_population_16_years_and_over_government_workers,
    pct_self_employed = percent_class_of_worker_civilian_employed_population_16_years_and_over_self_employed_in_own_not_incorporated_business_workers,
    
    # ---- Income ----
    est_median_hh_income = estimate_income_and_benefits_in_2014_inflation_adjusted_dollars_total_households_median_household_income_dollars,
    est_mean_hh_income = estimate_income_and_benefits_in_2014_inflation_adjusted_dollars_total_households_mean_household_income_dollars,
    est_per_capita_income = estimate_income_and_benefits_in_2014_inflation_adjusted_dollars_per_capita_income_dollars,
    est_median_nonfamily_income = estimate_income_and_benefits_in_2014_inflation_adjusted_dollars_nonfamily_households_median_nonfamily_income_dollars,
    est_male_earnings = estimate_income_and_benefits_in_2014_inflation_adjusted_dollars_median_earnings_for_male_full_time_year_round_workers_dollars,
    est_female_earnings = estimate_income_and_benefits_in_2014_inflation_adjusted_dollars_median_earnings_for_female_full_time_year_round_workers_dollars,
    
    # ---- Transfers ----
    pct_ssi = percent_income_and_benefits_in_2014_inflation_adjusted_dollars_with_supplemental_security_income,
    pct_public_assistance = percent_income_and_benefits_in_2014_inflation_adjusted_dollars_with_cash_public_assistance_income,
    pct_snap = percent_income_and_benefits_in_2014_inflation_adjusted_dollars_with_food_stamp_snap_benefits_in_the_past_12_months,
    
    # ---- Insurance ----
    pct_private_insurance = percent_health_insurance_coverage_civilian_noninstitutionalized_population_with_health_insurance_coverage_with_private_health_insurance,
    pct_uninsured = percent_health_insurance_coverage_civilian_noninstitutionalized_population_no_health_insurance_coverage
  )

write_csv(panel_merged, "week8_tutorial_sample.csv")