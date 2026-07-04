-- ============================================================
-- 1. Pre-GenAI vs GenAI Era Comparison
-- Business Question:
-- How did AI adoption, AI usage, displacement, job creation,
-- and reskilling investment change after generative AI became mainstream?
-- ============================================================

SELECT
    CASE
        WHEN generative_ai_era = TRUE THEN 'GenAI Era'
        ELSE 'Pre-GenAI Era'
    END AS period,
    COUNT(*) AS records,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(ai_tool_usage_hours_per_week), 2) AS avg_ai_usage_hours_per_week,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment
FROM workforce_ai_analysis
GROUP BY generative_ai_era
ORDER BY generative_ai_era;

-- ============================================================
-- 2. Quarter-over-Quarter AI Adoption and Displacement Trend
-- Business Question:
-- How have AI adoption, AI usage, displacement, and job creation
-- changed over time from 2021-Q1 to 2024-Q4?
-- ============================================================

SELECT
    year,
    quarter,
    year_quarter_label,
    generative_ai_era,
    COUNT(*) AS records,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(ai_tool_usage_hours_per_week), 2) AS avg_ai_usage_hours_per_week,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment
FROM workforce_ai_analysis
GROUP BY
    year,
    quarter,
    year_quarter_label,
    generative_ai_era
ORDER BY
    year,
    quarter;

-- ============================================================
-- 3. Industry Risk and Investment Preparedness
-- Business Question:
-- Which industries combine high automation susceptibility,
-- high displacement risk, and low AI investment, suggesting
-- under-preparedness for AI-driven workforce disruption?
-- ============================================================

SELECT
    industry_name,
    industry_sector,
    ai_adoption_stage,
    ROUND(AVG(automation_susceptibility), 2) AS avg_automation_susceptibility,
    ROUND(AVG(avg_ai_investment_pct_revenue), 2) AS avg_ai_investment_pct_revenue,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment,
    ROUND(SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0), 2) AS reskilling_spend_per_displaced_job,
    CASE
        WHEN AVG(automation_susceptibility) >= 70
         AND AVG(avg_ai_investment_pct_revenue) < 3
        THEN 'High Risk / Low Investment'
        WHEN AVG(automation_susceptibility) >= 70
         AND AVG(avg_ai_investment_pct_revenue) >= 3
        THEN 'High Risk / Higher Investment'
        WHEN AVG(automation_susceptibility) < 70
         AND AVG(avg_ai_investment_pct_revenue) < 3
        THEN 'Lower Risk / Low Investment'
        ELSE 'Lower Risk / Higher Investment'
    END AS preparedness_category
FROM workforce_ai_analysis
GROUP BY
    industry_name,
    industry_sector,
    ai_adoption_stage
ORDER BY
    avg_automation_susceptibility DESC,
    avg_ai_investment_pct_revenue ASC;

-- ============================================================
-- 4. Skill Category Displacement Risk
-- Business Question:
-- Which skill categories carry the highest displacement risk,
-- and is reskilling investment proportional to that risk?
-- ============================================================

SELECT
    skill_category_name,
    skill_category_code,
    typical_education_level,
    ROUND(AVG(ai_replaceability_score), 2) AS avg_ai_replaceability_score,
    ROUND(AVG(ai_augmentation_potential), 2) AS avg_ai_augmentation_potential,
    ROUND(AVG(median_reskilling_duration_months), 2) AS avg_reskilling_duration_months,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment,
    ROUND(SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0), 2) AS reskilling_spend_per_displaced_job,
    CASE
        WHEN AVG(ai_replaceability_score) >= 70
         AND AVG(median_reskilling_duration_months) >= 12
        THEN 'High Replaceability / Long Reskilling'
        WHEN AVG(ai_replaceability_score) >= 70
         AND AVG(median_reskilling_duration_months) < 12
        THEN 'High Replaceability / Shorter Reskilling'
        WHEN AVG(ai_replaceability_score) < 70
         AND AVG(median_reskilling_duration_months) >= 12
        THEN 'Lower Replaceability / Long Reskilling'
        ELSE 'Lower Replaceability / Shorter Reskilling'
    END AS skill_risk_category
FROM workforce_ai_analysis
GROUP BY
    skill_category_name,
    skill_category_code,
    typical_education_level
ORDER BY
    avg_displacement_risk DESC,
    total_jobs_displaced DESC;

-- ============================================================
-- 5. Country and Development Tier Patterns
-- Business Question:
-- Are developed and emerging economies adopting AI at different
-- rates, and what does that imply for displacement, job creation,
-- and reskilling needs?
-- ============================================================

SELECT
    development_tier,
    region,
    COUNT(*) AS records,
    COUNT(DISTINCT country_name) AS countries,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(ai_tool_usage_hours_per_week), 2) AS avg_ai_usage_hours_per_week,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    ROUND(AVG(digital_infrastructure_score), 2) AS avg_digital_infrastructure_score,
    ROUND(AVG(stem_graduates_per_100k), 2) AS avg_stem_graduates_per_100k,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(
        SUM(jobs_created_count)::numeric / NULLIF(SUM(jobs_displaced_count), 0),
        2
    ) AS job_creation_displacement_ratio,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment,
    ROUND(
        SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0),
        2
    ) AS reskilling_spend_per_displaced_job
FROM workforce_ai_analysis
GROUP BY
    development_tier,
    region
ORDER BY
    development_tier,
    avg_ai_adoption_rate DESC;

-- ============================================================
-- 5B. Country-Level AI Adoption and Job Outcome Ranking
-- Business Question:
-- Which countries show the highest AI adoption, highest displacement,
-- and weakest job creation-to-displacement ratios?
-- ============================================================

SELECT
    country_name,
    region,
    development_tier,
    ai_policy_maturity,
    ROUND(AVG(digital_infrastructure_score), 2) AS avg_digital_infrastructure_score,
    ROUND(AVG(stem_graduates_per_100k), 2) AS avg_stem_graduates_per_100k,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(
        SUM(jobs_created_count)::numeric / NULLIF(SUM(jobs_displaced_count), 0),
        2
    ) AS job_creation_displacement_ratio,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment,
    ROUND(
        SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0),
        2
    ) AS reskilling_spend_per_displaced_job
FROM workforce_ai_analysis
GROUP BY
    country_name,
    region,
    development_tier,
    ai_policy_maturity
ORDER BY
    net_jobs_change ASC;

-- ============================================================
-- 6. Industry-Level Reskilling Investment Gap
-- Business Question:
-- Is reskilling investment keeping pace with job displacement
-- at an industry level?
-- ============================================================

SELECT
    industry_name,
    industry_sector,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment,
    ROUND(
        SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0),
        2
    ) AS reskilling_spend_per_displaced_job,
    ROUND(
        SUM(jobs_created_count)::numeric / NULLIF(SUM(jobs_displaced_count), 0),
        2
    ) AS job_creation_displacement_ratio,
    CASE
        WHEN ROUND(AVG(displacement_risk_index), 2) >= 4.5
         AND ROUND(SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0), 2) < 100
        THEN 'High Risk / Low Reskilling Spend'
        WHEN ROUND(AVG(displacement_risk_index), 2) >= 4.5
         AND ROUND(SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0), 2) >= 100
        THEN 'High Risk / Higher Reskilling Spend'
        WHEN ROUND(AVG(displacement_risk_index), 2) < 4.5
         AND ROUND(SUM(reskilling_investment_usd) / NULLIF(SUM(jobs_displaced_count), 0), 2) < 100
        THEN 'Lower Risk / Low Reskilling Spend'
        ELSE 'Lower Risk / Higher Reskilling Spend'
    END AS reskilling_gap_category
FROM workforce_ai_analysis
GROUP BY
    industry_name,
    industry_sector
ORDER BY
    avg_displacement_risk DESC,
    reskilling_spend_per_displaced_job ASC;

    -- ============================================================
-- 7. Data Quality and Confidence Check
-- Business Question:
-- How reliable are the records in the dataset, and are any
-- major findings affected by low-confidence data?
-- ============================================================

SELECT
    CASE
        WHEN data_confidence_score >= 0.85 THEN 'High Confidence'
        WHEN data_confidence_score >= 0.70 THEN 'Medium Confidence'
        ELSE 'Low Confidence'
    END AS confidence_level,
    COUNT(*) AS records,
    ROUND(AVG(data_confidence_score), 2) AS avg_data_confidence_score,
    ROUND(AVG(ai_adoption_rate), 2) AS avg_ai_adoption_rate,
    ROUND(AVG(displacement_risk_index), 2) AS avg_displacement_risk,
    SUM(jobs_displaced_count) AS total_jobs_displaced,
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_created_count) - SUM(jobs_displaced_count) AS net_jobs_change,
    ROUND(SUM(reskilling_investment_usd), 2) AS total_reskilling_investment
FROM workforce_ai_analysis
GROUP BY
    confidence_level
ORDER BY
    avg_data_confidence_score DESC;

-- ============================================================
-- 7B. Lowest Confidence Records With High Displacement
-- Business Question:
-- Which records have the lowest confidence scores but high
-- displacement counts?
-- ============================================================

SELECT
    country_name,
    region,
    development_tier,
    industry_name,
    skill_category_name,
    year_quarter_label,
    data_confidence_score,
    ai_adoption_rate,
    displacement_risk_index,
    jobs_displaced_count,
    jobs_created_count,
    jobs_created_count - jobs_displaced_count AS net_jobs_change,
    reskilling_investment_usd
FROM workforce_ai_analysis
WHERE data_confidence_score < 0.70
ORDER BY
    jobs_displaced_count DESC,
    data_confidence_score ASC
LIMIT 20;

-- ============================================================
-- 7C. Missing Value Check
-- Business Question:
-- Are there missing values in key analytical fields?
-- ============================================================

SELECT
    COUNT(*) AS total_records,

    COUNT(*) - COUNT(ai_adoption_rate) AS missing_ai_adoption_rate,
    COUNT(*) - COUNT(displacement_risk_index) AS missing_displacement_risk_index,
    COUNT(*) - COUNT(jobs_displaced_count) AS missing_jobs_displaced_count,
    COUNT(*) - COUNT(jobs_created_count) AS missing_jobs_created_count,
    COUNT(*) - COUNT(reskilling_investment_usd) AS missing_reskilling_investment_usd,
    COUNT(*) - COUNT(data_confidence_score) AS missing_data_confidence_score,

    COUNT(*) - COUNT(country_name) AS missing_country_name,
    COUNT(*) - COUNT(industry_name) AS missing_industry_name,
    COUNT(*) - COUNT(skill_category_name) AS missing_skill_category_name,
    COUNT(*) - COUNT(year_quarter_label) AS missing_year_quarter_label
FROM workforce_ai_analysis;