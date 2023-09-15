ETL Project with SSIS: Health Care DataPlatform

This repository contains my sloution for an Extract, Transform, Load (ETL) project using SQL Server Integration Services (SSIS). The purpose of this project is to load data from four Excel files (Patients, Episodes, Services, Date) into a data warehouse designed based on the star schema methodology. We have used the slowly changing dimension (SCD) technique to save data and achieve historical tracking within the data warehouse. Additionally, we have employed a lookup technique while designing the fact table in SSIS to load and calculate data indicators from the data warehouse and other data sources.

Project Overview Data Sources Patients: This Excel file contains information about patients, including their personal details, such as name, address, and contact information.

Episodes: The Episodes Excel file holds data related to medical episodes, including episode ID, start and end dates, and associated patient IDs.

Services: The Services Excel file contains information about medical services provided during each episode, including service IDs, dates, and descriptions.

Data Warehouse Design We have designed the data warehouse using the star schema methodology, which consists of:

Fact Table: The central fact table where we store the metrics and measures associated with the business process. In this project, we use a lookup technique to populate and calculate data indicators from the data warehouse and other sources into the fact table.

Dimension Tables: Supporting dimension tables that provide context to the data in the fact table. In particular, we have a dimension table called "Date" created based on predefined time periods.

ETL Process Extraction We extract data from the three Excel files (Patients, Episodes, Services) using SSIS data sources. SSIS provides connectors that enable us to read data from Excel files efficiently.

Transformation Data Conversion: We perform data conversion and data cleaning to ensure data consistency and quality. This includes handling missing values, data type conversions, and standardizing data.

Slowly Changing Dimension: We apply SCD techniques to the dimension tables (e.g., Patients, Episodes) to track historical changes in dimension attributes. This allows us to maintain historical data in the data warehouse.

Lookup Transformation: In the fact table design, we use the SSIS Lookup Transformation to retrieve and calculate data indicators from the data warehouse and other data sources. This enhances the analytical capabilities of the data warehouse.

Dimension Loading: We load dimension tables (e.g., Patients, Episodes, Date) with the transformed and cleansed data.

Fact Table Loading: The fact table is populated using the results of the lookup transformation and other calculated metrics.

Load Finally, the transformed data is loaded into the data warehouse, which is typically hosted in a SQL Server database.

This ETL project using SSIS demonstrates how to efficiently extract, transform, and load data from Excel files into a data warehouse designed using star schema methodology. It incorporates slowly changing dimension techniques and lookup transformations to ensure data accuracy and provide valuable historical insights. By following the provided usage instructions, you can adapt and run this ETL process in your own environment to analyze patient data effectively.
