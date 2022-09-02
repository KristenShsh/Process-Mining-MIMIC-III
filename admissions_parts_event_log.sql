-- There are 5 processes from admission to discharge from hospital.
-- 5 parts includes: admission, discharge, death, ED Registration, ED Out.

DROP TABLE mimiciii.admissions_parts_event_log;

CREATE TABLE mimiciii.admissions_parts_event_log AS(
SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'admission' AS category,
      'admission' AS activity,
      admissions.admittime AS charttime
    FROM 
      mimiciii.admissions,
      mimiciii.transfers,
	    mimiciii.diagnoses_icd
    WHERE 
      admissions.admittime IS NOT NULL AND
      transfers.icustay_id IS NOT NULL AND
      admissions.hadm_id = transfers.hadm_id AND
	    admissions.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '429%' -- Change the values for different diseases

 UNION ALL

    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'discharge' AS category,
      'discharge' AS activity,
      admissions.dischtime AS charttime
    FROM 
      mimiciii.admissions,
      mimiciii.transfers,
  	  mimiciii.diagnoses_icd
    WHERE 
      admissions.dischtime IS NOT NULL AND
      transfers.icustay_id IS NOT NULL AND
      admissions.hadm_id = transfers.hadm_id AND
  	  admissions.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '429%' -- Change the values for different diseases

 UNION ALL	

    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'death' AS category,
      'death' AS activity,
      admissions.deathtime AS charttime
     FROM 
      mimiciii.admissions,
      mimiciii.transfers,
  	  mimiciii.diagnoses_icd
    WHERE  
      admissions.deathtime IS NOT NULL AND
      transfers.icustay_id IS NOT NULL AND
      admissions.hadm_id = transfers.hadm_id AND
  	  admissions.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '429%' -- Change the values for different diseases

 UNION ALL	

    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'ED Registration' AS category,
      'ED Registration' AS activity,
      admissions.edregtime AS charttime
   FROM 
      mimiciii.admissions,
      mimiciii.transfers,
  	  mimiciii.diagnoses_icd
    WHERE 
      admissions.edregtime IS NOT NULL AND
      transfers.icustay_id IS NOT NULL AND
      admissions.hadm_id = transfers.hadm_id AND
  	  admissions.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '429%' -- Change the values for different diseases
	
UNION ALL
	
    SELECT DISTINCT
      admissions.subject_id,
      admissions.hadm_id,
      transfers.icustay_id,
      'ED Out' AS category,
      'ED Out' AS activity,
      admissions.edouttime AS charttime
    FROM 
      mimiciii.admissions,
      mimiciii.transfers,
  	  mimiciii.diagnoses_icd
    WHERE  
      admissions.edouttime IS NOT NULL AND
      transfers.icustay_id IS NOT NULL AND
      admissions.hadm_id = transfers.hadm_id AND
  	  admissions.hadm_id = diagnoses_icd.hadm_id AND
      diagnoses_icd.icd9_code BETWEEN '390%' AND '429%' -- Change the values for different diseases
    
    GROUP BY
      subject_id, 
      hadm_id, 
      icustay_id,
      category,
      activity,
      charttime
    ORDER BY subject_id, hadm_id, icustay_id, charttime, category, activity
);
