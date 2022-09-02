DROP TABLE mimiciii.cptevents_event_log;

CREATE TABLE mimiciii.cptevents_event_log AS(
SELECT
  cptevents.subject_id, 
  cptevents.hadm_id,
  transfers.icustay_id,
  cptevents.sectionheader AS category, 
  cptevents.subsectionheader AS activity, 
  cptevents.chartdate AS chartdate
FROM 
  mimiciii.cptevents,
  mimiciii.transfers,
  mimiciii.diagnoses_icd
WHERE 
  cptevents.chartdate IS NOT NULL AND
  cptevents.hadm_id = transfers.hadm_id AND
  cptevents.hadm_id = diagnoses_icd.hadm_id AND
  cptevents.subsectionheader IS NOT NULL AND
  diagnoses_icd.icd9_code BETWEEN '390%' AND '429%' -- Change the values for different diseases
ORDER BY cptevents.subject_id, cptevents.hadm_id, transfers.icustay_id, chartdate, category, activity
);
