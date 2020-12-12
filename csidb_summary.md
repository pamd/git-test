"csidb" Database Summary:
=========================

### 1. `Demographics` --> **demographics**: 617 rows, 13 columns

Field               | Type         | Null | Key | Default | Extra
------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID        | varchar(30)  | NO   | PRI |         |
date                | date         | YES  |     | NULL    |
sex                 | varchar(10)  | YES  |     | NULL    |
race                | varchar(40)  | YES  |     | NULL    |
Cause_of_Death      | varchar(80)  | YES  |     | NULL    |
age                 | float        | YES  |     | NULL    |
Gestational_Age     | float        | YES  |     | NULL    |
Height              | float        | YES  |     | NULL    |
Whole_Body_Weight   | float        | YES  |     | NULL    |
BMI                 | float        | YES  |     | NULL    |
ABO_group           | varchar(10)  | YES  |     | NULL    |
Donor_Type          | varchar(50)  | YES  |     | NULL    |
Donor_Type_Comments | varchar(400) | YES  |     | NULL    |

### 2. `Pancreas Weights` --> **pancreas_weights**: 618 rows, 8 columns

Field           | Type         | Null | Key | Default | Extra
----------------| ------------ | ---- | --- | ------- | -----
N_PODCase_ID    | varchar(30)  | NO   | PRI |         |
Donor_Type      | varchar(50)  | YES  |     | NULL    |
Pancreas_Intact | tinyint(1)   | YES  |     | NULL    |
Whole_Pancreas  | float        | YES  |     | NULL    |
Panhead         | float        | YES  |     | NULL    |
Panbody         | float        | YES  |     | NULL    |
Pantail         | float        | YES  |     | NULL    |
Comments        | varchar(400) | YES  |     | NULL    |

### 3. `Duration of Donor Hospitalization` --> **duration_of_donor_hosp**:
620 rows, 4 columns

Field                        | Type        | Null | Key | Default | Extra
---------------------------- | ----------- | ---- | --- | ------- | ------
N_PODCase_ID                 | varchar(30) | NO   | PRI |         |
Donor_Type                   | varchar(50) | YES  |     | NULL    |
Hospitalization_Stay_Minutes | int         | YES  |     | NULL    |
Hospitalization_Stay_Days    | float       | YES  |     | NULL    |

4. `Organ Transportation Time` --> **organ_transportation_time**:
620 rows, 4 columns

Field                      | Type        | Null | Key | Default | Extra
-------------------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID               | varchar(30) | NO   | PRI |         |
Donor_Type                 | varchar(50) | YES  |     | NULL    |
Transport_Duration_Minutes | int         | YES  |     | NULL    |
Transport_Duration_Hours   | float       | YES  |     | NULL    |

5. `Hi Res HLA Post Receipt of Organ` --> **hires_receipt_of_organ**:
619 rows, 27 columns
- "Hi Res" stands for "high resolution"
- dhu Q: What is `HLA`?

Field           | Type        | Null | Key | Default | Extra
--------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID    | varchar(30) | NO   | PRI |         |
date            | date        | YES  |     | NULL    |
Donor_Type      | varchar(50) | YES  |     | NULL    |
A_1             | varchar(20) | YES  |     | NULL    |
A_2             | varchar(20) | YES  |     | NULL    |
B_1             | varchar(20) | YES  |     | NULL    |
B_2             | varchar(20) | YES  |     | NULL    |
C_1             | varchar(20) | YES  |     | NULL    |
C_2             | varchar(20) | YES  |     | NULL    |
DRB1_1          | varchar(20) | YES  |     | NULL    |
DRB1_2          | varchar(20) | YES  |     | NULL    |
DQA1_1          | varchar(20) | YES  |     | NULL    |
DQA1_2          | varchar(20) | YES  |     | NULL    |
DQB1_1          | varchar(20) | YES  |     | NULL    |
DQB1_2          | varchar(20) | YES  |     | NULL    |
DPA1_1          | varchar(20) | YES  |     | NULL    |
DPA1_2          | varchar(20) | YES  |     | NULL    |
DPB1_1          | varchar(20) | YES  |     | NULL    |
DPB1_2          | varchar(20) | YES  |     | NULL    |
Transplant_A_1  | varchar(20) | YES  |     | NULL    |
Transplant_A_2  | varchar(20) | YES  |     | NULL    |
Transplant_B_1  | varchar(20) | YES  |     | NULL    |
Transplant_B_2  | varchar(20) | YES  |     | NULL    |
Transplant_DR_1 | varchar(20) | YES  |     | NULL    |
Transplant_DR_2 | varchar(20) | YES  |     | NULL    |
Transplant_DQ_1 | varchar(20) | YES  |     | NULL    |
Transplant_DQ_2 | varchar(20) | YES  |     | NULL    |

6. **pancreas_medical_info** --> `Pancreas Weight and Limited Medical Info`:
618 rows, 9 columns

Field           | Type        | Null | Key | Default | Extra
--------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID    | varchar(30) | NO   | PRI |         |
Donor_Type      | varchar(50) | YES  |     | NULL    |
Pancreas_Intact | tinyint(1)  | YES  |     | NULL    |
Whole_Pancreas  | float       | YES  |     | NULL    |
PanUncinate     | float       | YES  |     | NULL    |
Panhead         | float       | YES  |     | NULL    |
Panbody         | float       | YES  |     | NULL    |
Pantail         | float       | YES  |     | NULL    |
Comments        | varchar(400)| YES  |     | NULL    |

7. **recovery_ria_aab_titer** --> `Recovery_RIA_Aab_Titers`:
616 rows, 11 columns:
- dhu Q1: What do `RIA` and `Aab` stand for?

Field                     | Type         | Null | Key | Default | Extra
------------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID              | varchar(30)  | NO   | PRI |         |
date                      | date         | YES  |     | NULL    |
GADA                      | double       | YES  |     | NULL    |
IA2A                      | double       | YES  |     | NULL    |
mIAA                      | double       | YES  |     | NULL    |
ZnT8A                     | double       | YES  |     | NULL    |
Date_Rcvd                 | date         | YES  |     | NULL    |
Date_Rptd                 | date         | YES  |     | NULL    |
Sample                    | varchar(20)  | YES  |     | NULL    |
OPPC_Only_Notes           | varchar(400) | YES  |     | NULL    |
Comments_To_Investigators | varchar(800) | YES  |     | NULL    |

8. **donor_admin** --> `Donor Admin and Sample Processing Notes`:
617 rows, 11 columns

Field                  | Type          | Null | Key | Default | Extra
---------------------- | ------------- | ---- | --- | ------- | -----
N_PODCase_ID           | varchar(30)   | NO   | PRI |         |
date                   | date          | YES  |     | NULL    |
Accepted_As            | varchar(50)   | YES  |     | NULL    |
Donor_Type             | varchar(50)   | YES  |     | NULL    |
Aperio_ID              | int           | YES  |     | NULL    |
Consent_Restriction    | tinyint(1)    | YES  |     | NULL    |
Other_Information      | varchar(1500) | YES  |     | NULL    |
Source                 | varchar(20)   | YES  |     | NULL    |
OPO_ID                 | varchar(400)  | YES  |     | NULL    |
Spectrum               | tinyint(1)    | YES  |     | NULL    |
Notes_from_Cases_Table | varchar(600)  | YES  |     | NULL    |

9. **raw_c_peptide_values** --> `Raw_C_Peptide_Values`: 622 rows, 4 columns
- dhu Q1: What does `C` stand for?

Field                          | Type        | Null | Key | Default | Extra
------------------------------ | ----------- | ---- | --- | ------- | -----
N_PODCase_ID                   | varchar(30) | NO   | PRI |         |
date                           | date        | YES  |     | NULL    |
Below_Lower_Limit_Of_Detection | varchar(50) | YES  |     | NULL    |
Numeric_Value                  | double      | YES  |     | NULL    |

10. **case_flag** --> `Case Flag`: 618 rows, 3 columns

Field        | Type         | Null | Key | Default | Extra
------------ | ------------ | ---- | --- | ------- | -----
N_PODCase_ID | varchar(30)  | NO   | PRI |         |
date         | date         | YES  |     | NULL    |
Flag_Notes   | varchar(200) | YES  |     | NULL    |

11. **donor_timelines** --> `Donor Timelines (Raw Data)`: 620 rows, 8 columns
- dhu: many `Organ_Received_Datetime`, `Organ_Frozen_Datetime`, `Admit_Datetime`,
`Braindeath_Datetime` and `Xclamp_Datetime` values are "0000-00-00 00:00:00".

Field                   | Type        | Null | Key | Default | Extra
----------------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID            | varchar(30) | NO   | PRI |         |
date                    | date        | YES  |     | NULL    |
Donor_Type              | varchar(50) | YES  |     | NULL    |
Organ_Received_Datetime | datetime    | YES  |     | NULL    |
Organ_Frozen_Datetime   | datetime    | YES  |     | NULL    |
Admit_Datetime          | datetime    | YES  |     | NULL    |
Braindeath_Datetime     | datetime    | YES  |     | NULL    |
Xclamp_Datetime         | datetime    | YES  |     | NULL    |

12. `Organ_Transport_Times`: View has errors ??? for processing only?

13. `Terminal_Hospital_Duration`: View has errors ??? for processing only?

14. **rna_quality_rin_values** --> `RNA_quality_RIN_values`: 489 rows, 8 columns

Field             | Type        | Null | Key | Default | Extra
----------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID      | varchar(30) | YES  |     | NULL    |
Donor_Type        | varchar(50) | YES  |     | NULL    |
date              | date        | YES  |     | NULL    |
date_string       | varchar(20) | YES  |     | NULL    |
Sample_Type       | varchar(20) | YES  |     | NULL    |
Aliquot_Type      | varchar(20) | YES  |     | NULL    |
Block_Vial_Number | varchar(10) | YES  |     | NULL    |
RIN_Value         | float       | YES  |     | NULL    |

15. **ria_autoab_results** --> `RIA_AutoAb_Results`: 616 rows, 18 columns

Field                        | Type         | Null | Key | Default | Extra
---------------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID                 | varchar(30)  | NO   | PRI |         |
date                         | date         | YES  |     | NULL    |
Donor_Type                   | varchar(50)  | YES  |     | NULL    |
GADA_Result                  | varchar(20)  | YES  |     | NULL    |
IA2A_Result                  | varchar(20)  | YES  |     | NULL    |
mIAA_Result                  | varchar(20)  | YES  |     | NULL    |
ZnT8A_Result                 | varchar(20)  | YES  |     | NULL    |
Total_Positive_Auto_Ab_Count | int          | YES  |     | NULL    |
Sample                       | varchar(30)  | YES  |     | NULL    |
Comments_To_Investigators    | varchar(800) | YES  |     | NULL    |

16. `Endocrine Cell Function`: No data to show

17. `HiRes HLA Post Receipt of Organ`:
now called **hires_receipt_of_organ** (see `#5`)

18. **age_at_onset** --> `Age_At_Onset Dataset`: 622 rows, 5 columns

Field             | Type        | Null | Key | Default | Extra
----------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID      | varchar(30) | NO   | PRI |         |
date              | date        | YES  |     | NULL    |
Age               | float       | YES  |     | NULL    |
Diabetes_Duration | float       | YES  |     | NULL    |
Age_At_Onset      | float       | YES  |     | NULL    |


19. **hires_hla_clean_tcr_paper** --> `HiRes_HLA_clean_TCR_paper`:
619 rows, 27 columns

Field           | Type        | Null | Key | Default | Extra
--------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID    | varchar(30) | NO   | PRI |         |
date            | date        | YES  |     | NULL    |
A_1             | varchar(20) | YES  |     | NULL    |
A_2             | varchar(20) | YES  |     | NULL    |
B_1             | varchar(20) | YES  |     | NULL    |
B_2             | varchar(20) | YES  |     | NULL    |
C_1             | varchar(20) | YES  |     | NULL    |
C_2             | varchar(20) | YES  |     | NULL    |
DRB1_1          | varchar(20) | YES  |     | NULL    |
DRB1_2          | varchar(20) | YES  |     | NULL    |
DQA1_1          | varchar(20) | YES  |     | NULL    |
DQA1_2          | varchar(20) | YES  |     | NULL    |
DQB1_1          | varchar(20) | YES  |     | NULL    |
DQB1_2          | varchar(20) | YES  |     | NULL    |
DPA1_1          | varchar(20) | YES  |     | NULL    |
DPA1_2          | varchar(20) | YES  |     | NULL    |
DPB1_1          | varchar(20) | YES  |     | NULL    |
DPB1_2          | varchar(20) | YES  |     | NULL    |
Transplant_A_1  | varchar(20) | YES  |     | NULL    |
Transplant_A_2  | varchar(20) | YES  |     | NULL    |
Transplant_B_1  | varchar(20) | YES  |     | NULL    |
Transplant_B_2  | varchar(20) | YES  |     | NULL    |
Transplant_DR_1 | varchar(20) | YES  |     | NULL    |
Transplant_DR_2 | varchar(20) | YES  |     | NULL    |
Transplant_DQ_1 | varchar(20) | YES  |     | NULL    |
Transplant_DQ_2 | varchar(20) | YES  |     | NULL    |
Folder          | varchar(20) | YES  |     | NULL    |


20. `Raw_C-Peptide_Values_Query Snapshot`:
- duplicate of **raw_c_peptide_values** (see `#9`), with 1 fewer field:
`Below_Lower_Limit_Of_Detection`


21. **diabetes_variant_seq** --> `Diabetes Variant Sequencing Data`:
33 rows, 10 columns
- multiple N_PODCase_ID entries, no primary key!!

Field               | Type         | Null | Key | Default | Extra
------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID        | varchar(30)  | YES  |     | NULL    |
Variant             | varchar(30)  | YES  |     | NULL    |
Gene                | varchar(30)  | YES  |     | NULL    |
Transcript_RefSeqID | varchar(30)  | YES  |     | NULL    |
Genome_Position     | varchar(30)  | YES  |     | NULL    |
Zygosity            | varchar(30)  | YES  |     | NULL    |
AAChange            | varchar(30)  | YES  |     | NULL    |
ESP                 | varchar(30)  | YES  |     | NULL    |
Db_SNP              | varchar(30)  | YES  |     | NULL    |
PubMED              | varchar(200) | YES  |     | NULL    |


22. **medical_history** --> `Lifestyle and Medical History`:
617 rows, 16 columns

Field                    | Type          | Null | Key | Default | Extra
------------------------ | ------------- | ---- | --- | ------- | -----
N_PODCase_ID             | varchar(30)   | NO   | PRI |         |
Donor_Type               | varchar(50)   | YES  |     | NULL    |
Heavy_Alcohol_Use        | varchar(4000) | YES  |     | NULL    |
Alcohol_Use_Notes        | varchar(4000) | YES  |     | NULL    |
History_of_Cigarette_Use | varchar(4000) | YES  |     | NULL    |
Smoking_Notes            | varchar(4000) | YES  |     | NULL    |
History_of_Cocaine_Use   | varchar(4000) | YES  |     | NULL    |
History_of_Other_Drugs   | varchar(4000) | YES  |     | NULL    |
Tattoos                  | varchar(4000) | YES  |     | NULL    |
CDC_Risk_HIV             | varchar(4000) | YES  |     | NULL    |
history_of_Hypertension  | varchar(4000) | YES  |     | NULL    |
Allergy_Notes            | varchar(4000) | YES  |     | NULL    |
Clinical_History         | varchar(4000) | YES  |     | NULL    |
Admission_Course         | varchar(4000) | YES  |     | NULL    |
Other_Medications        | varchar(4000) | YES  |     | NULL    |
Hospital_Medications     | varchar(4000) | YES  |     | NULL    |


23. **histopathology** --> `Histopathology`: 616 rows, 4 columns

Field           | Type          | Null | Key | Default | Extra
--------------- | ------------- | ---- | --- | ------- | -----
N_PODCase_ID    | varchar(30)   | NO   | PRI |         |
Donor_Type      | varchar(50)   | YES  |     | NULL    |
date            | date          | YES  |     | NULL    |
Histopath_Notes | varchar(1000) | YES  |     | NULL    |


24. **unos_ids** --> `UNOS IDs`: 621 rows, 3 columns
- dhu Q1: What does "UNOS" stand for?

Field        | Type        | Null | Key | Default | Extra
------------ | ----------- | ---- | --- | ------- | -----
N_PODCase_ID | varchar(30) | NO   | PRI |         |
date         | date        | YES  |     | NULL    |
UNOS_ID      | varchar(50) | YES  |     | NULL    |


25. **class1_npodv** --> `Class1_nPODV`: 434 rows, 21 columns

Field                         | Type        | Null | Key | Default | Extra
----------------------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID                  | varchar(30) | YES  |     | NULL    |
date                          | date        | YES  |     | NULL    |
date_string                   | varchar(20) | YES  |     | NULL    |
Lab                           | varchar(40) | YES  |     | NULL    |
Sample_Type                   | varchar(40) | YES  |     | NULL    |
Aliquot_Type                  | varchar(40) | YES  |     | NULL    |
Block_Vial_Number             | varchar(40) | YES  |     | NULL    |
Islet_Class_I_MHC             | varchar(40) | YES  |     | NULL    |
Exocrine_Class_1_MHC          | varchar(40) | YES  |     | NULL    |
Vasculature_Class_1_MHC       | varchar(40) | YES  |     | NULL    |
Insulin_Positive_Cells        | varchar(40) | YES  |     | NULL    |
Insulin_Containing_Islets     | varchar(40) | YES  |     | NULL    |
Insulin_Deficient_Islets_ONLY | varchar(40) | YES  |     | NULL    |
Islet_VP1_EXETER              | varchar(40) | YES  |     | NULL    |
Islet_VP1_TAMPERE             | varchar(40) | YES  |     | NULL    |
Exocrine_IHC_VP1              | varchar(40) | YES  |     | NULL    |
AT_Virus_Isolation            | varchar(40) | YES  |     | NULL    |
pct_Area_MHC_I                | varchar(40) | YES  |     | NULL    |
Notes_or_Comments             | varchar(40) | YES  |     | NULL    |
Vial_ID                       | varchar(40) | YES  |     | NULL    |
Data_Entry_QC_Notes           | varchar(40) | YES  |     | NULL    |


26. **aggregated_pancreatitis** --> `Aggregated Pancreatitis Case Information`:
59 rows, 4 columns

Field            | Type         | Null | Key | Default | Extra
---------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID     | varchar(30)  | NO   | PRI |         |
date             | date         | YES  |     | NULL    |
Clinical_History | varchar(400) | YES  |     | NULL    |
Histopathology   | varchar(400) | YES  |     | NULL    |

27. **labs_closest_to_recovery** --> `Labs Taken Closest to Organ Recovery`:
331 rows, 13 columns

Field               | Type        | Null | Key | Default | Extra
------------------- | ----------- | ---- | --- | ------- | -----
N_PODCase_ID        | varchar(30) | NO   | PRI |         |
Donor_Type          | varchar(50) | YES  |     | NULL    |
Protein_Urine       | varchar(20) | YES  |     | NULL    |
Creatinine          | float       | YES  |     | NULL    |
Blood_Urea_Nitrogen | float       | YES  |     | NULL    |
Total_Bilirubin     | float       | YES  |     | NULL    |
SGOT                | float       | YES  |     | NULL    |
SGPT                | float       | YES  |     | NULL    |
Lipase              | float       | YES  |     | NULL    |
Amylase             | float       | YES  |     | NULL    |
INR                 | float       | YES  |     | NULL    |
pH                  | float       | YES  |     | NULL    |
Hematocrit          | float       | YES  |     | NULL    |


28. **meds_prior_to_recovery** --> `Meds Given w/in 24hrs Prior to Organ Recovery Start`:
369 rows, 16 columns

Field        | Type         | Null | Key | Default | Extra
------------ | ------------ | ---- | --- | ------- | -----
N_PODCase_ID | varchar(30)  | NO   | PRI |         |
Donor_Type   | varchar(50)  | YES  |     | NULL    |
Steroids     | varchar(5)   | YES  |     | NULL    |
Diuretics    | varchar(5)   | YES  |     | NULL    |
T3           | varchar(5)   | YES  |     | NULL    |
T4           | varchar(5)   | YES  |     | NULL    |
Anticonv     | varchar(5)   | YES  |     | NULL    |
Antihype     | varchar(5)   | YES  |     | NULL    |
Vasodil      | varchar(5)   | YES  |     | NULL    |
Ddavp        | varchar(5)   | YES  |     | NULL    |
Heparin      | varchar(5)   | YES  |     | NULL    |
Arginine     | varchar(5)   | YES  |     | NULL    |
Insulin      | varchar(5)   | YES  |     | NULL    |
Other_Meds1  | varchar(200) | YES  |     | NULL    |
Other_Meds2  | varchar(200) | YES  |     | NULL    |
Other_Meds3  | varchar(200) | YES  |     | NULL    |

29. **serologies** --> `Serologies`: 619 rows, 9 columns

Field          | Type         | Null | Key | Default | Extra
-------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID   | varchar(30)  | NO   | PRI |         |
Donor_Type     | varchar(50)  | YES  |     | NULL    |
Hiv            | varchar(10)  | YES  |     | NULL    |
Htlv           | varchar(10)  | YES  |     | NULL    |
Vdrl           | varchar(10)  | YES  |     | NULL    |
Cmv            | varchar(10)  | YES  |     | NULL    |
Hbsag          | varchar(10)  | YES  |     | NULL    |
Anti_Hcv       | varchar(10)  | YES  |     | NULL    |
Serology_Notes | varchar(200) | YES  |     | NULL    |


30. **transfusions_infections** --> ` Transfusions and Infections`:
619 rows, 13 columns

Field                     | Type         | Null | Key | Default | Extra
------------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID              | varchar(30)  | NO   | PRI |         |
Donor_Type                | varchar(50)  | YES  |     | NULL    |
Inotrop_Agents_Received   | varchar(5)   | YES  |     | NULL    |
Clin_Infect               | varchar(5)   | YES  |     | NULL    |
Infection_Notes           | varchar(600) | YES  |     | NULL    |
Blood_Inf                 | varchar(5)   | YES  |     | NULL    |
Blood_Infection_Confirmed | varchar(5)   | YES  |     | NULL    |
Pulm_Inf                  | varchar(5)   | YES  |     | NULL    |
Pulm_Infection_Confirmed  | varchar(5)   | YES  |     | NULL    |
Urine_Inf                 | varchar(5)   | YES  |     | NULL    |
Urine_Infection_Confirmed | varchar(5)   | YES  |     | NULL    |
Other_Inf                 | varchar(5)   | YES  |     | NULL    |
Other_Infection_Notes     | varchar(600) | YES  |     | NULL    |


31. **diabetes_information** --> `Diabetes Information`:
622 rows, 11 columns

Field                  | Type         | Null | Key | Default | Extra
---------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID           | varchar(30)  | NO   | PRI |         |
Donor_Type             | varchar(50)  | YES  |     | NULL    |
Diabetes_Duration      | float        | YES  |     | NULL    |
Age_At_Onset           | float        | YES  |     | NULL    |
C_Peptide              | float        | YES  |     | NULL    |
HbA1c                  | float        | YES  |     | NULL    |
Peak_Glucose_Hosp_Stay | float        | YES  |     | NULL    |
History_of_Diabetes    | varchar(50)  | YES  |     | NULL    |
Insulin_Dependent      | varchar(50)  | YES  |     | NULL    |
Diabetes_Meds_Taken    | varchar(200) | YES  |     | NULL    |
Pancreas_Disease_Notes | varchar(200) | YES  |     | NULL    |


32. **lowres_hla_at_donation** --> `Low Resolution HLA at Organ Donation`:
621 rows, 4 columns

Field                  | Type         | Null | Key | Default | Extra
---------------------- | ------------ | ---- | --- | ------- | -----
N_PODCase_ID           | varchar(30)  | NO   | PRI |         |
date                   | date         | YES  |     | NULL    |
Donor_Type             | varchar(50)  | YES  |     | NULL    |
HLA_Transplant_Summary | varchar(100) | YES  |     | NULL    |