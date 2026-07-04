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

---

---

## 4. Skill Category Displacement Risk

### Business Question

Which skill categories carry the highest displacement risk, and is reskilling investment proportional to that risk?

### Query Summary

The analysis groups records by skill category and compares AI replaceability, AI augmentation potential, reskilling duration, AI adoption, displacement risk, jobs displaced, jobs created, net job change, total reskilling investment, and reskilling spend per displaced job.

Skill risk categories were classified using the following logic:

- High AI replaceability: AI replaceability score of 70 or higher
- Long reskilling duration: median reskilling duration of 12 months or longer

### Key Results

| Skill Category | Replaceability Score | Reskilling Duration | Avg Displacement Risk | Total Jobs Displaced | Net Jobs Change | Spend per Displaced Job |
|---|---:|---:|---:|---:|---:|---:|
| Manual Skilled Trades | 79.60 | 4.90 | 4.26 | 102,298 | -60,528 | $30.98 |
| Manual & Physical | 36.90 | 14.90 | 4.56 | 91,444 | -42,717 | $61.91 |
| Administrative & Clerical | 48.40 | 8.20 | 4.24 | 84,319 | -38,270 | $88.22 |
| Managerial & Strategic | 29.10 | 7.60 | 3.96 | 74,970 | -38,453 | $113.69 |
| Social & Interpersonal | 42.10 | 7.00 | 4.33 | 66,904 | -35,055 | $188.29 |

### Key Insight

Manual Skilled Trades is the most urgent skill category for intervention. It has the highest AI replaceability score, the largest number of displaced jobs, the worst net job change, and the lowest reskilling spend per displaced job. This suggests that investment is not keeping pace with the scale of disruption in this category.

Manual & Physical roles also show significant concern. This category has the highest average displacement risk and a long reskilling duration of 14.90 months, indicating that affected workers may require longer-term training support.

### Portfolio Narrative

The skill-level analysis shows that AI workforce disruption is not limited to office-based or administrative roles. Manual Skilled Trades and Manual & Physical roles show some of the strongest displacement signals, suggesting that policy responses should include vocational and applied reskilling pathways, not only digital upskilling programs.

---

## 5. Country and Development Tier Patterns

### Business Question

Are developed and emerging economies adopting AI at different rates, and what does that imply for displacement, job creation, and reskilling needs?

### Query Summary

The analysis compares AI adoption, AI usage, displacement risk, job displacement, job creation, net job change, digital infrastructure, STEM graduate concentration, and reskilling investment across development tiers, regions, and countries.

### Regional and Development Tier Results

| Development Tier / Region | Avg AI Adoption Rate | Avg Displacement Risk | Net Jobs Change | Job Creation / Displacement Ratio | Spend per Displaced Job |
|---|---:|---:|---:|---:|---:|
| Developed Europe | 31.85 | 4.31 | -95,614 | 0.49 | $88.73 |
| Developed Asia-Pacific | 31.24 | 4.16 | -25,243 | 0.53 | $110.58 |
| Developed Middle East | 29.83 | 4.12 | -17,748 | 0.61 | $56.76 |
| Developed North America | 28.37 | 3.89 | -11,616 | 0.65 | $285.03 |
| Emerging Africa | 31.96 | 4.11 | -17,824 | 0.51 | $180.14 |
| Emerging Europe | 31.20 | 3.62 | -18,063 | 0.45 | $99.98 |
| Emerging Middle East | 30.61 | 3.74 | -17,502 | 0.63 | $50.68 |
| Emerging Asia-Pacific | 30.14 | 4.70 | -70,443 | 0.39 | $95.88 |
| Emerging Latin America | 26.43 | 5.01 | -16,377 | 0.53 | $106.20 |

### Country-Level Results

| Country | Region | Development Tier | AI Policy Maturity | Avg AI Adoption Rate | Avg Displacement Risk | Net Jobs Change | Job Creation / Displacement Ratio | Spend per Displaced Job |
|---|---|---|---|---:|---:|---:|---:|---:|
| France | Europe | Developed | Established | 32.32 | 4.16 | -26,793 | 0.38 | $47.71 |
| Indonesia | Asia-Pacific | Emerging | Developing | 20.13 | 4.13 | -22,904 | 0.44 | $27.64 |
| Poland | Europe | Emerging | Developing | 31.20 | 3.62 | -18,063 | 0.45 | $99.98 |
| Vietnam | Asia-Pacific | Emerging | Established | 27.30 | 4.93 | -17,399 | 0.35 | $120.38 |
| Germany | Europe | Developed | Developing | 28.42 | 3.98 | -16,616 | 0.55 | $33.50 |
| India | Asia-Pacific | Emerging | Developing | 36.83 | 5.83 | -12,352 | 0.28 | $178.49 |
| China | Asia-Pacific | Emerging | Established | 35.49 | 6.11 | -6,426 | 0.41 | $65.81 |
| Canada | North America | Developed | Developing | 31.98 | 3.95 | -5,535 | 0.58 | $617.34 |

### Key Insight

AI adoption is not limited to developed economies. Several emerging regions show adoption rates near or above developed regions, including Emerging Africa at 31.96% and Emerging Europe at 31.20%. However, job outcomes vary substantially by region.

Emerging Asia-Pacific is a major concern. It has a net jobs change of -70,443 and the weakest regional job creation-to-displacement ratio at 0.39. This indicates that job creation is offsetting less than half of AI-linked displacement in that region.

At the country level, France has the largest net job loss, while India shows the weakest job creation-to-displacement ratio at 0.28. China and India also show some of the highest displacement risk scores, suggesting that large emerging economies may face significant workforce pressure as AI adoption expands.

Developed North America shows the strongest regional job creation-to-displacement ratio at 0.65 and the highest reskilling spend per displaced job. Canada stands out individually with the highest reskilling spend per displaced job at $617.34.

### Portfolio Narrative

The country-level analysis shows that AI adoption alone does not determine workforce outcomes. Some emerging economies are adopting AI at rates comparable to developed regions, but their ability to offset displacement through job creation varies widely. Regions with stronger reskilling investment and labor-market absorption appear better positioned to manage AI-driven disruption, while Emerging Asia-Pacific and selected European countries show larger employment gaps.