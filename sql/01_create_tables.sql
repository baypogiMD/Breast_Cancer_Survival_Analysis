DROP TABLE IF EXISTS breast_cancer;

CREATE TABLE breast_cancer (
    patient_id INTEGER PRIMARY KEY,
    age INTEGER NOT NULL,
    race TEXT,
    marital_status TEXT,
    tumor_size REAL,
    grade INTEGER,
    differentiation TEXT,
    t_stage TEXT,
    n_stage TEXT,
    ajcc_stage TEXT,
    nodes_examined INTEGER,
    nodes_positive INTEGER,
    estrogen_status TEXT,
    progesterone_status TEXT,
    survival_months INTEGER,
    vital_status TEXT
);
