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