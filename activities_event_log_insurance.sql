-- Devide activities event log into different insurance type,
-- such as Private, Medicare and Medicaid.

DROP TABLE mimiciii.act_event_log_iprvt;
DROP TABLE mimiciii.act_event_log_imdcr;
DROP TABLE mimiciii.act_event_log_imdcd;

-- Private Insurance

CREATE TABLE mimiciii.act_event_log_iprvt AS(
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
  admissions.insurance = 'Private'

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
  admissions.insurance = 'Private'

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
  admissions.insurance = 'Private'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- Medicare Insurance

CREATE TABLE mimiciii.act_event_log_imdcr AS(
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
  admissions.insurance = 'Medicare'

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
  admissions.insurance = 'Medicare'

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
  admissions.insurance = 'Medicare'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



-- Medicaid Insurance

CREATE TABLE mimiciii.act_event_log_imdcd AS(
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
  admissions.insurance = 'Medicaid'

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
  admissions.insurance = 'Medicaid'

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
  admissions.insurance = 'Medicaid'
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);
