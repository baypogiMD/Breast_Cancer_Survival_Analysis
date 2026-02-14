-- Row count
SELECT COUNT(*) AS total_records FROM breast_cancer;

-- Missing values per column
SELECT
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN tumor_size IS NULL THEN 1 ELSE 0 END) AS missing_tumor_size,
    SUM(CASE WHEN grade IS NULL THEN 1 ELSE 0 END) AS missing_grade,
    SUM(CASE WHEN survival_months IS NULL THEN 1 ELSE 0 END) AS missing_survival
FROM breast_cancer;

-- Invalid or extreme values
SELECT *
FROM breast_cancer
WHERE age < 18
   OR tumor_size < 0
   OR nodes_positive > nodes_examined
   OR survival_months < 0;

-- Distribution checks
SELECT vital_status, COUNT(*) AS count
FROM breast_cancer
GROUP BY vital_status;
