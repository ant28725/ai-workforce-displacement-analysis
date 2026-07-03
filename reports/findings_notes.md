# Findings Notes

## 1. Pre-GenAI vs GenAI Era Comparison

### Business Question

How did AI adoption, AI usage, displacement, job creation, and reskilling investment change after generative AI became mainstream?

### Query Summary

The analysis compares workforce AI metrics before and after the start of the generative AI era using the `generative_ai_era` flag from the date dimension.

### Results

| Period | Records | Avg AI Adoption Rate | Avg AI Usage Hours / Week | Avg Displacement Risk | Total Jobs Displaced | Total Jobs Created | Net Jobs Change | Total Reskilling Investment |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Pre-GenAI Era | 131 | 20.37 | 2.75 | 4.19 | 204,546 | 108,869 | -95,677 | $22,914,221.53 |
| GenAI Era | 169 | 38.61 | 6.42 | 4.32 | 382,239 | 187,486 | -194,753 | $38,737,263.67 |

### Key Insight

AI adoption accelerated substantially after generative AI tools became mainstream. Average AI adoption increased from 20.37% in the pre-GenAI period to 38.61% during the GenAI era, while weekly AI tool usage rose from 2.75 to 6.42 hours.

Although job creation increased during the GenAI era, it did not keep pace with displacement. Net job losses widened from 95,677 before the GenAI era to 194,753 during the GenAI era.

### Portfolio Narrative

AI adoption is scaling faster than labor markets are absorbing the disruption. This creates a policy challenge: reskilling investment is increasing, but job displacement continues to outpace job creation.

---

## 2. Quarter-over-Quarter AI Adoption and Displacement Trend

### Business Question

How have AI adoption, AI usage, displacement, and job creation changed over time from 2021-Q1 to 2024-Q4?

### Query Summary

The analysis groups the workforce AI records by year and quarter to identify changes in AI adoption, AI tool usage, displacement risk, jobs displaced, jobs created, net job change, and reskilling investment over time.

### Results Summary

AI adoption was relatively stable before the GenAI era, generally ranging from the high teens to low twenties. The largest shift occurred in 2022-Q4, when average AI adoption increased from 22.48% in 2022-Q3 to 40.23% in 2022-Q4.

Weekly AI usage also rose sharply during the same period, increasing from 2.65 hours per week in 2022-Q3 to 6.10 hours per week in 2022-Q4.

### Key Insight

The start of the GenAI era marked a clear inflection point in workforce AI adoption. Before 2022-Q4, average adoption remained relatively moderate. After 2022-Q4, adoption stayed elevated, reaching a peak of 45.70% in 2024-Q1.

Job displacement did not increase in a perfectly linear pattern, but several GenAI-era quarters showed severe negative job outcomes. The largest net job loss occurred in 2023-Q2, when jobs displaced exceeded jobs created by 53,068.

### Portfolio Narrative

Generative AI appears to have accelerated workplace AI adoption almost immediately. However, labor market impacts were uneven across quarters, suggesting that displacement pressure may depend not only on adoption levels, but also on industry mix, country characteristics, skill exposure, and investment readiness.

---

## 3. Industry Risk and Investment Preparedness

### Business Question

Which industries combine high automation susceptibility, high displacement risk, and low AI investment, suggesting under-preparedness for AI-driven workforce disruption?

### Query Summary

The analysis groups records by industry and compares automation susceptibility, AI investment as a percentage of revenue, AI adoption, displacement risk, jobs displaced, jobs created, net job change, and reskilling spend per displaced job.

Industries were classified using the following preparedness logic:

- High automation susceptibility: automation susceptibility of 70 or higher
- Low AI investment: average AI investment below 3% of revenue

### Key Results

| Industry | Sector | Automation Susceptibility | AI Investment % Revenue | Avg AI Adoption Rate | Avg Displacement Risk | Net Jobs Change | Preparedness Category |
|---|---|---:|---:|---:|---:|---:|---|
| Manufacturing | Industrial | 95.00 | 1.80 | 25.14 | 3.96 | -15,182 | High Risk / Low Investment |
| Public Health | Healthcare | 95.00 | 2.09 | 26.33 | 3.89 | -13,996 | High Risk / Low Investment |
| Construction | Industrial | 89.50 | 2.48 | 31.20 | 4.44 | -5,362 | High Risk / Low Investment |
| Real Estate | Finance | 73.30 | 1.40 | 23.46 | 3.38 | -8,220 | High Risk / Low Investment |
| Retail & E-commerce | Consumer | 73.60 | 3.30 | 33.22 | 4.78 | -25,250 | High Risk / Higher Investment |

### Key Insight

Manufacturing, Public Health, Construction, and Real Estate appear to be the most underprepared industries. Each has high automation susceptibility but relatively low AI investment as a share of revenue. This suggests these industries may face elevated workforce disruption without proportional investment in AI readiness, worker transition planning, or reskilling.

Retail & E-commerce also has high automation susceptibility and the largest net job loss among the high-susceptibility industries, but its AI investment is slightly above the low-investment threshold. This suggests Retail & E-commerce is highly exposed, but may already be investing more actively in AI transformation.

### Portfolio Narrative

The industry-level analysis shows that AI workforce risk is not only about automation exposure. Preparedness matters. Industries such as Manufacturing and Public Health show high susceptibility but limited AI investment, making them priority candidates for targeted reskilling support and policy intervention.