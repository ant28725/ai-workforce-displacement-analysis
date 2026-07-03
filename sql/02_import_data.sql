-- ============================================================
-- 02_import_data.sql
-- Project: AI Workforce Displacement Analysis
-- Purpose: Import raw CSV files into PostgreSQL tables
-- Note: These commands should be run from the psql terminal.
-- ============================================================

\copy dim_country FROM 'data/raw/dim_country.csv' WITH (FORMAT csv, HEADER true);

\copy dim_date FROM 'data/raw/dim_date.csv' WITH (FORMAT csv, HEADER true);

\copy dim_industry FROM 'data/raw/dim_industry.csv' WITH (FORMAT csv, HEADER true);

\copy dim_skill_category FROM 'data/raw/dim_skill_category.csv' WITH (FORMAT csv, HEADER true);

\copy fact_workforce_ai_index FROM 'data/raw/fact_workforce_ai_index.csv' WITH (FORMAT csv, HEADER true);