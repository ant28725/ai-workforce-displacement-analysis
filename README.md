# AI Workforce Displacement Analysis

## Project Overview

This project analyzes how artificial intelligence adoption is reshaping employment across countries, industries, and skill categories between 2021 and 2024. The analysis focuses especially on the shift after generative AI tools became mainstream in late 2022.

The goal is to identify which countries, industries, and skill groups are most exposed to AI-driven workforce displacement, where job creation is failing to offset job losses, and where reskilling investment may not be keeping pace with disruption.

## Business Problem

Governments and employers need to understand how AI adoption is affecting labor markets so they can prioritize reskilling investments, support vulnerable worker segments, and prepare for future workforce disruption.

This analysis investigates:

- How AI adoption changed before and after the generative AI era
- Which industries and skill categories face the highest displacement risk
- Whether job creation is offsetting job displacement
- Whether reskilling investment is proportional to workforce disruption
- How country-level factors such as digital infrastructure and AI policy maturity relate to employment outcomes

## Dataset

The dataset is a synthetic workforce AI index containing 300 fact records across:

- 30 countries
- 25 industries
- 8 skill categories
- 16 quarters from 2021-Q1 to 2024-Q4

The data follows a star schema with one fact table and four dimension tables.

## Tools Used

- PostgreSQL
- SQL
- Tableau
- GitHub
- VS Code

## Repository Structure

ai-workforce-displacement-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql
│   ├── 03_create_analysis_view.sql
│   └── 04_analysis_queries.sql
│
├── reports/
│   └── findings_notes.md
│
├── tableau/
│
└── README.md

## Key Metrics

- AI adoption rate
- AI tool usage hours per week
- Displacement risk index
- Jobs displaced
- Jobs created
- Net jobs change
- Reskilling investment
- Reskilling spend per displaced job
- Job creation-to-displacement ratio

## Initial Findings

### AI Adoption Accelerated in the GenAI Era

Average AI adoption increased from 20.37% before the GenAI era to 38.61% during the GenAI era. Weekly AI tool usage also increased from 2.75 hours to 6.42 hours.

### Job Creation Did Not Keep Pace With Displacement

Although job creation increased during the GenAI era, displacement increased more sharply. Net job losses widened from -95,677 before the GenAI era to -194,753 during the GenAI era.

### AI Adoption Jumped Sharply in 2022-Q4

The largest quarter-over-quarter increase in AI adoption occurred between 2022-Q3 and 2022-Q4, when average adoption rose from 22.48% to 40.23%. Weekly AI usage also rose from 2.65 to 6.10 hours during the same period, marking a clear GenAI-era inflection point.

### Manufacturing, Public Health, Construction, and Real Estate Appear Underprepared

Four industries combined high automation susceptibility with low AI investment: Manufacturing, Public Health, Construction, and Real Estate. These industries may require targeted reskilling support because their exposure to automation appears higher than their current investment readiness.

### Manual Skilled Trades Shows the Largest Skill-Level Reskilling Gap

Manual Skilled Trades had the highest AI replaceability score, the largest number of displaced jobs, the worst net job change, and the lowest reskilling spend per displaced job. This suggests a major mismatch between disruption and reskilling support.

### Emerging Asia-Pacific Shows the Weakest Job Offset

Emerging Asia-Pacific recorded one of the largest regional net job losses and the weakest job creation-to-displacement ratio. At the country level, India had the weakest job creation-to-displacement ratio, while China and India showed some of the highest displacement risk scores.

### Food & Beverage, Automotive, and Retail Show Major Reskilling Gaps

Food & Beverage, Automotive, and Retail & E-commerce combined high displacement risk with low reskilling spend per displaced job. These industries appear to be priority areas for targeted reskilling investment.

At the country-industry level, France's Media & Entertainment sector showed the largest reskilling shortfall, with high displacement risk, large net job losses, and very low reskilling spend per displaced worker.

### Data Quality Check Supports the Overall Findings

The dataset contained no missing values in key analytical fields. Although 20% of records were classified as low confidence, negative net job change appeared across high-, medium-, and low-confidence records, suggesting the overall displacement trend is not driven only by low-confidence data.

## Next Steps

- Analyze quarter-over-quarter AI adoption trends
- Identify industries with high automation risk and low AI investment
- Compare displacement risk across skill categories
- Evaluate country-level differences by development tier and region
- Build Tableau dashboards for executive and policy audiences