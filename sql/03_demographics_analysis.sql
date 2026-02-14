-- Age distribution
SELECT
    CASE
        WHEN age < 40 THEN '<40'
        WHEN age BETWEEN 40 AND 49 THEN '40–49'
        WHEN age BETWEEN 50 AND 59 THEN '50–59'
        WHEN age BETWEEN 60 AND 69 THEN '60–69'
        ELSE '70+'
    END AS age_group,
    COUNT(*) AS patients
FROM breast_cancer
GROUP BY age_group
ORDER BY age_group;

-- Race distribution
SELECT race, COUNT(*) AS patients
FROM breast_cancer
GROUP BY race
ORDER BY patients DESC;

-- Marital status vs mortality
SELECT
    marital_status,
    COUNT(*) AS total,
    SUM(CASE WHEN vital_status = 'Dead' THEN 1 ELSE 0 END) AS deaths,
    ROUND(
        SUM(CASE WHEN vital_status = 'Dead' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS mortality_rate_pct
FROM breast_cancer
GROUP BY marital_status
ORDER BY mortality_rate_pct DESC;
