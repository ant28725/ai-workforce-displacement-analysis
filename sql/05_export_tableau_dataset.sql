-- ============================================================
-- 05_export_tableau_dataset.sql
-- Project: AI Workforce Displacement Analysis
-- Purpose: Export the joined analytical view for Tableau
-- Note: Run this command from the psql terminal.
-- ============================================================

\copy (SELECT * FROM workforce_ai_analysis) TO 'data/processed/workforce_ai_analysis_export.csv' WITH (FORMAT csv, HEADER true);