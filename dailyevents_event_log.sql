DROP TABLE mimiciii.dailyevents_event_log;

CREATE TABLE mimiciii.dailyevents_event_log AS(
SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'chartevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.chartevents_event_log

UNION ALL

SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'cptevents' AS tablename,
  category,
  activity, 
  chartdate
FROM 
  mimiciii.cptevents_event_log

UNION ALL

SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'datetimeevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.datetimeevents_event_log

UNION ALL

SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'noteevents' AS tablename,
  category,
  activity, 
  charttime
FROM 
  mimiciii.noteevents_event_log

UNION ALL

SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'prescriptions' AS tablename,
  category,
  activity, 
  startdate
FROM 
  mimiciii.prescriptions_event_log

UNION ALL

SELECT
  subject_id, 
  hadm_id,
  icustay_id,
  'procedureevents_mv' AS tablename,
  category,
  activity, 
  starttime
FROM 
  mimiciii.procedureevents_mv_event_log
  ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);
