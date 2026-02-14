-- T stage vs N stage matrix
SELECT
    t_stage,
    n_stage,
    COUNT(*) AS patients
FROM breast_cancer
GROUP BY t_stage, n_stage
ORDER BY t_stage, n_stage;

-- AJCC stage survival summary
SELECT
    ajcc_stage,
    COUNT(*) AS patients,
    ROUND(AVG(survival_months), 2) AS avg_survival_months
FROM breast_cancer
GROUP BY ajcc_stage
ORDER BY avg_survival_months DESC;

-- Lymph node burden analysis
SELECT
    CASE
        WHEN nodes_positive = 0 THEN '0'
        WHEN nodes_positive BETWEEN 1 AND 3 THEN '1–3'
        WHEN nodes_positive BETWEEN 4 AND 9 THEN '4–9'
        ELSE '10+'
    END AS node_positive_group,
    COUNT(*) AS patients,
    ROUND(AVG(survival_months), 2) AS avg_survival
FROM breast_cancer
GROUP BY node_positive_group
ORDER BY avg_survival DESC;
