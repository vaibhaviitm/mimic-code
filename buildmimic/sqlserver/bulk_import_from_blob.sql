

/********************************************************************************
*								1. SETUP											*
********************************************************************************/


/********************************************************************************
*				1.1. OPTIONAL CREDENTIAL SETUP									*
*				(if data source is not public)									*
********************************************************************************/
-- 1.1.1. (optional) Create master key that will encrypt credentials
--
-- Required only if you need to setup CREDENTIAL in 1.1.2.
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<password>';

-- 1.1.2. (optional) Create credential with Azure Blob SAS
--
CREATE DATABASE SCOPED CREDENTIAL MyAzureBlobStorageCredential2 
 WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
 SECRET = '<sastoken>';
-- NOTE: DO NOT PUT FIRST CHARACTER '?'' IN SECRET!!!



/********************************************************************************
*				1.2. REQUIRE DATA SOURCE SETUP									*
*				(optionally add credential)										*
********************************************************************************/

-- Create external data source with the URL of the Blob storage Account and associated credential (if it is not public).
CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage2
WITH (	TYPE = BLOB_STORAGE, 
		LOCATION = 'https://insightpubdatasa.blob.core.windows.net/mimic3', 
		CREDENTIAL= MyAzureBlobStorageCredential2	--> CREDENTIAL is not required if a blob storage is public!
);



/********************************************************************************
*								2. LOAD											*
*********************************************************************************/


BULK INSERT PATIENTS
FROM 'PATIENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT ADMISSIONS
FROM 'ADMISSIONS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT CALLOUT
FROM 'CALLOUT.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT CAREGIVERS
FROM 'CAREGIVERS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 



BULK INSERT CHARTEVENTS
FROM 'CHARTEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 




BULK INSERT CPTEVENTS
FROM 'CPTEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT DATETIMEEVENTS
FROM 'DATETIMEEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT DIAGNOSES_ICD
FROM 'DIAGNOSES_ICD.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT DRGCODES
FROM 'DRGCODES.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT D_CPT
FROM 'D_CPT.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT D_ICD_DIAGNOSES
FROM 'D_ICD_DIAGNOSES.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT D_ICD_PROCEDURES
FROM 'D_ICD_PROCEDURES.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT D_ITEMS
FROM 'D_ITEMS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT D_LABITEMS
FROM 'D_LABITEMS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT ICUSTAYS
FROM 'ICUSTAYS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT INPUTEVENTS_CV
FROM 'INPUTEVENTS_CV.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT INPUTEVENTS_MV
FROM 'INPUTEVENTS_MV.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT LABEVENTS
FROM 'LABEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT MICROBIOLOGYEVENTS
FROM 'MICROBIOLOGYEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT NOTEEVENTS
FROM 'NOTEEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT OUTPUTEVENTS
FROM 'OUTPUTEVENTS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 

BULK INSERT PRESCRIPTIONS
FROM 'PRESCRIPTIONS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT PROCEDUREEVENTS_MV
FROM 'PROCEDUREEVENTS_MV.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT PROCEDURES_ICD
FROM 'PROCEDURES_ICD.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 


BULK INSERT SERVICES
FROM 'SERVICES.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 



BULK INSERT TRANSFERS
FROM 'TRANSFERS.csv'
WITH (	DATA_SOURCE = 'MyAzureBlobStorage2',
		FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
		FIRSTROW=2,
                ROWTERMINATOR = '0x0a',
		TABLOCK); 
