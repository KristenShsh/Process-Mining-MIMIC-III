-- Devide activities event log into 5 different ethnicity type that I care about,
-- such as ASIAN - CHINESE, ASIAN, WHITE, BLACK/AFRICAN AMERICAN and HISPANIC/LATINO.

DROP TABLE mimiciii.act_event_log_easian_chinese;
DROP TABLE mimiciii.act_event_log_easian;
DROP TABLE mimiciii.act_event_log_ewhite;
DROP TABLE mimiciii.act_event_log_eblack_african_american;
DROP TABLE mimiciii.act_event_log_ehispanic_latino;

-- ASIAN - CHINESE

CREATE TABLE mimiciii.act_event_log_easian_chinese AS(
SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log,
  mimiciii.admissions
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'ASIAN - CHINESE'

UNION ALL

SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log,
  mimiciii.admissions
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'ASIAN - CHINESE'

UNION ALL

SELECT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log,
  mimiciii.admissions
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'ASIAN - CHINESE'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- ASIAN

CREATE TABLE mimiciii.act_event_log_easian AS(
SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log,
  mimiciii.admissions
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'ASIAN'
UNION ALL
SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log,
  mimiciii.admissions
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'ASIAN'
  
UNION ALL

SELECT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log,
  mimiciii.admissions
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'ASIAN'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- WHITE

CREATE TABLE mimiciii.act_event_log_ewhite AS(
SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log,
  mimiciii.admissions
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'WHITE'

UNION ALL

SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log,
  mimiciii.admissions
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'WHITE'

UNION ALL

SELECT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log,
  mimiciii.admissions
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'WHITE'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- BLACK/AFRICAN AMERICAN

CREATE TABLE mimiciii.act_event_log_eblack_african_american AS(
SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log,
  mimiciii.admissions
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'BLACK/AFRICAN AMERICAN'

UNION ALL

SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log,
  mimiciii.admissions
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'BLACK/AFRICAN AMERICAN'

UNION ALL

SELECT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log,
  mimiciii.admissions
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'BLACK/AFRICAN AMERICAN'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- HISPANIC OR LATINO

CREATE TABLE mimiciii.act_event_log_ehispanic_latino AS(
SELECT DISTINCT
  admissions_event_log.subject_id, 
  admissions_event_log.hadm_id,
  admissions_event_log.icustay_id,
  'admissions' AS tablename,
  admissions_event_log.category,
  admissions_event_log.activity, 
  admissions_event_log.charttime
FROM 
  mimiciii.admissions_event_log,
  mimiciii.admissions
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'HISPANIC OR LATINO'

UNION ALL

SELECT DISTINCT
  icustays_event_log.subject_id, 
  icustays_event_log.hadm_id,
  icustays_event_log.icustay_id,
  'icustays' AS tablename,
  icustays_event_log.category,
  icustays_event_log.activity, 
  icustays_event_log.charttime
FROM 
  mimiciii.icustays_event_log,
  mimiciii.admissions
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'HISPANIC OR LATINO'

UNION ALL

SELECT
  procedureevents_mv_event_log.subject_id, 
  procedureevents_mv_event_log.hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  procedureevents_mv_event_log.category,
  procedureevents_mv_event_log.activity, 
  procedureevents_mv_event_log.starttime
FROM 
  mimiciii.procedureevents_mv_event_log,
  mimiciii.admissions
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  admissions.ethnicity = 'HISPANIC OR LATINO'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);
