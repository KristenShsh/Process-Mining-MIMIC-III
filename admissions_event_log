DROP TABLE mimiciii.admissions_event_log;

CREATE TABLE mimiciii.admissions_event_log AS(
SELECT DISTINCT
  subject_id, 
  hadm_id,
  icustay_id,
  category,
  activity, 
  charttime
 FROM mimiciii.admissions_parts_event_log
 ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity
 );
 
