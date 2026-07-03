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