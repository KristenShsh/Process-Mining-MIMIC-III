-- Devide activities event log into female and male.

DROP TABLE mimiciii.act_event_log_gfemale;
DROP TABLE mimiciii.act_event_log_gmale;

-- Female

CREATE TABLE mimiciii.act_event_log_gfemale AS(
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
  mimiciii.patients
WHERE
  admissions_event_log.subject_id = patients.subject_id AND
  patients.gender = 'F'

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
  mimiciii.patients
WHERE
  icustays_event_log.subject_id = patients.subject_id AND
  patients.gender = 'F'

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
  mimiciii.patients
WHERE
  procedureevents_mv_event_log.subject_id = patients.subject_id AND
  patients.gender = 'F'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- Male

CREATE TABLE mimiciii.act_event_log_gmale AS(
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
  mimiciii.patients
WHERE
  admissions_event_log.subject_id = patients.subject_id AND
  patients.gender = 'M'
  
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
  mimiciii.patients
WHERE
  icustays_event_log.subject_id = patients.subject_id AND
  patients.gender = 'M'

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
  mimiciii.patients
WHERE
  procedureevents_mv_event_log.subject_id = patients.subject_id AND
  patients.gender = 'M'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);
