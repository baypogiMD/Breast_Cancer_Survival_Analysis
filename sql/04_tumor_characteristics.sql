-- Tumor size summary by grade
SELECT
    grade,
    COUNT(*) AS patients,
    ROUND(AVG(tumor_size), 2) AS avg_tumor_size,
    ROUND(MAX(tumor_size), 2) AS max_tumor_size
FROM breast_cancer
GROUP BY grade
ORDER BY grade;

-- Differentiation vs survival
SELECT
    differentiation,
    COUNT(*) AS patients,
    ROUND(AVG(survival_months), 2) AS avg_survival_months
FROM breast_cancer
GROUP BY differentiation
ORDER BY avg_survival_months DESC;

-- Hormone receptor status distribution
SELECT
    estrogen_status,
    progesterone_status,
    COUNT(*) AS patients
FROM breast_cancer
GROUP BY estrogen_status, progesterone_status
ORDER BY patients DESC;
