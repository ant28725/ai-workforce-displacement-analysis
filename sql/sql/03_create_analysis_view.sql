CREATE OR REPLACE VIEW workforce_ai_analysis AS
SELECT
    f.index_id,

    d.year,
    d.quarter,
    d.year_quarter_label,
    d.period_start_date,
    d.is_pandemic_period,
    d.generative_ai_era,

    c.country_id,
    c.country_code,
    c.country_name,
    c.region,
    c.development_tier,
    c.gdp_per_capita_usd,
    c.digital_infrastructure_score,
    c.ai_policy_maturity,
    c.internet_penetration_pct,
    c.stem_graduates_per_100k,

    i.industry_id,
    i.industry_name,
    i.industry_sector,
    i.automation_susceptibility,
    i.avg_ai_investment_pct_revenue,
    i.ai_adoption_stage,
    i.global_workforce_millions,
    i.primary_ai_use_case,

    s.skill_category_id,
    s.skill_category_name,
    s.skill_category_code,
    s.ai_replaceability_score,
    s.ai_augmentation_potential,
    s.median_reskilling_duration_months,
    s.typical_education_level,
    s.global_worker_share_pct,

    f.ai_adoption_rate,
    f.productivity_impact_score,
    f.displacement_risk_index,
    f.jobs_displaced_count,
    f.jobs_created_count,
    f.reskilling_investment_usd,
    f.avg_wage_change_pct,
    f.ai_tool_usage_hours_per_week,
    f.workforce_size,
    f.data_confidence_score,

    f.jobs_created_count - f.jobs_displaced_count AS net_jobs_change,

    CASE
        WHEN f.jobs_displaced_count = 0 THEN NULL
        ELSE f.jobs_created_count::numeric / f.jobs_displaced_count
    END AS job_creation_displacement_ratio,

    CASE
        WHEN f.jobs_displaced_count = 0 THEN NULL
        ELSE f.reskilling_investment_usd / f.jobs_displaced_count
    END AS reskilling_spend_per_displaced_job

FROM fact_workforce_ai_index f
JOIN dim_country c
    ON f.country_id = c.country_id
JOIN dim_date d
    ON f.date_id = d.date_id
JOIN dim_industry i
    ON f.industry_id = i.industry_id
JOIN dim_skill_category s
    ON f.skill_category_id = s.skill_category_id;