-- Distinguishing heart patients by age.

-- Ages is roughly divided int 7 stages:
-- neonate, baby, child, youth, middle-aged, elderly and longevity.

-- Since the number of cardiac patients belonging to the 'baby' age group does not exist in the 'first_admissions_age_group_hnum' table, so there is no need to create baby event log table.



DROP TABLE mimiciii.act_event_log_agneonate;
DROP TABLE mimiciii.act_event_log_agchild;
DROP TABLE mimiciii.act_event_log_agyouth;
DROP TABLE mimiciii.act_event_log_agmiddle;
DROP TABLE mimiciii.act_event_log_agelderly;
DROP TABLE mimiciii.act_event_log_aglongevity;



CREATE TABLE mimiciii.act_event_log_agneonate AS(
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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'neonate'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  icustays_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'neonate'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  procedureevents_mv_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'neonate'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



CREATE TABLE mimiciii.act_event_log_agchild AS(
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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'child'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  icustays_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'child'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  procedureevents_mv_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'child'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



CREATE TABLE mimiciii.act_event_log_agyouth AS(
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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'youth'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  icustays_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'youth'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  procedureevents_mv_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'youth'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



CREATE TABLE mimiciii.act_event_log_agmiddle AS(
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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'middle'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  icustays_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'middle'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  procedureevents_mv_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'middle'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



CREATE TABLE mimiciii.act_event_log_agelderly AS(
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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'elderly'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  icustays_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'elderly'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  procedureevents_mv_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'elderly'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);



CREATE TABLE mimiciii.act_event_log_aglongevity AS(
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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  admissions_event_log.subject_id = admissions.subject_id AND
  admissions_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'longevity'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  icustays_event_log.subject_id = admissions.subject_id AND
  icustays_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'longevity'

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
  mimiciii.admissions,
  mimiciii.first_admissions_age_group
WHERE
  procedureevents_mv_event_log.subject_id = admissions.subject_id AND
  procedureevents_mv_event_log.subject_id = first_admissions_age_group.subject_id AND
  first_admissions_age_group.age_group = 'longevity'
ORDER BY subject_id, hadm_id, charttime, tablename, category, activity
);
