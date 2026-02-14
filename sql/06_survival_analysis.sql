-- Overall survival summary
SELECT
    vital_status,
    COUNT(*) AS patients,
    ROUND(AVG(survival_months), 2) AS avg_survival_months
FROM breast_cancer
GROUP BY vital_status;

-- Survival by hormone receptor status
SELECT
    estrogen_status,
    progesterone_status,
    ROUND(AVG(survival_months), 2) AS avg_survival,
    SUM(CASE WHEN vital_status = 'Dead' THEN 1 ELSE 0 END) AS deaths
FROM breast_cancer
GROUP BY estrogen_status, progesterone_status
ORDER BY avg_survival DESC;

-- High-risk survival profile
SELECT
    ajcc_stage,
    grade,
    ROUND(AVG(survival_months), 2) AS avg_survival
FROM breast_cancer
WHERE nodes_positive >= 4
GROUP BY ajcc_stage, grade
ORDER BY avg_survival;
