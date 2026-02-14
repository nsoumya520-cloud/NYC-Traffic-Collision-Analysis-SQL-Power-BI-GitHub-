create database nyc_collisions
use nyc_collisions
ALTER DATABASE nyc_collisions
SET RECOVERY SIMPLE;
DBCC SHRINKFILE (nyc_collisions_log, 1024);
SELECT name 
FROM sys.database_files;



CREATE TABLE motor_vehicle_collisions (
collision_id BIGINT NOT NULL PRIMARY KEY,
crash_date DATE,
    crash_time TIME,

    borough VARCHAR(50),
    zip_code VARCHAR(10),

    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),

    location VARCHAR(100),

    on_street_name VARCHAR(100),
    cross_street_name VARCHAR(100),
    off_street_name VARCHAR(100),

    number_of_persons_injured INT,
    number_of_persons_killed INT,

    number_of_pedestrians_injured INT,
    number_of_pedestrians_killed INT,

    number_of_cyclist_injured INT,
    number_of_cyclist_killed INT,

    number_of_motorist_injured INT,
    number_of_motorist_killed INT,

    contributing_factor_vehicle_1 VARCHAR(100),
    contributing_factor_vehicle_2 VARCHAR(100),
    contributing_factor_vehicle_3 VARCHAR(100),
    contributing_factor_vehicle_4 VARCHAR(100),
    contributing_factor_vehicle_5 VARCHAR(100),

    vehicle_type_code_1 VARCHAR(50),
    vehicle_type_code_2 VARCHAR(50),
    vehicle_type_code_3 VARCHAR(50),
    vehicle_type_code_4 VARCHAR(50),
    vehicle_type_code_5 VARCHAR(50)
);

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN CONTRIBUTING_FACTOR_VEHICLE_5 NVARCHAR(100) NULL;
ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN CONTRIBUTING_FACTOR_VEHICLE_2 NVARCHAR(100) NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN CONTRIBUTING_FACTOR_VEHICLE_3 NVARCHAR(100) NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN CONTRIBUTING_FACTOR_VEHICLE_4 NVARCHAR(100) NULL;


ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN ZIP_CODE NVARCHAR(10) NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN NUMBER_OF_PERSONS_KILLED TINYINT;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN NUMBER_OF_PEDESTRIANS_KILLED TINYINT;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN NUMBER_OF_CYCLIST_KILLED TINYINT;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN NUMBER_OF_PERSONS_INJURED TINYINT NULL;

TRUNCATE TABLE dbo.Motor_Vehicle_Collisions

ALTER TABLE dbo.MOTOR_Vehicle_Collisions
Alter column NUMBER_OF_CYCLIST_INJURED TINYINT NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN VEHICLE_TYPE_CODE_5 NVARCHAR(100) NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN VEHICLE_TYPE_CODE_1 NVARCHAR(100) NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN VEHICLE_TYPE_CODE_2 NVARCHAR(100) NULL;


ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN VEHICLE_TYPE_CODE_3 NVARCHAR(100) NULL;

ALTER TABLE dbo.Motor_Vehicle_Collisions
ALTER COLUMN VEHICLE_TYPE_CODE_4 NVARCHAR(100) NULL;

SELECT TOP 10 *
FROM dbo.[Motor_Vehicle_Collisions_-_Crashes];


select * from [Motor_Vehicle_Collisions_-_Crashes]

select count(*) as total_rows
from [Motor_Vehicle_Collisions_-_Crashes]


SELECT
  SUM(CASE WHEN BOROUGH IS NULL THEN 1 ELSE 0 END) AS null_borough,
  SUM(CASE WHEN CRASH_DATE IS NULL THEN 1 ELSE 0 END) AS null_date,
  SUM(CASE WHEN LATITUDE IS NULL THEN 1 ELSE 0 END) AS null_lat,
  SUM(CASE WHEN LONGITUDE IS NULL THEN 1 ELSE 0 END) AS null_long
FROM  [Motor_Vehicle_Collisions_-_Crashes];

SELECT DISTINCT VEHICLE_TYPE_CODE_1
FROM[Motor_Vehicle_Collisions_-_Crashes]
ORDER BY 1;


SELECT DISTINCT VEHICLE_TYPE_CODE_1
FROM motor_vehicle_collisions
ORDER BY 1;

ALTER TABLE [Motor_Vehicle_Collisions_-_Crashes]
ADD vehicle_category VARCHAR(50);


UPDATE  [Motor_Vehicle_Collisions_-_Crashes]
SET vehicle_category = 'PASSENGER VEHICLE'
WHERE VEHICLE_TYPE_CODE_1 IN (
  'Sedan', 'PASSENGER VEHICLE', 'PASSENGER',
  '2 dr sedan', '4 dr sedan', 'Convertible',
  'Coupe', 'CAR/SUV'
);


SELECT COUNT(*) FROM collision_vehicles;

ALTER TABLE collision_vehicles
ADD vehicle_category VARCHAR(50);
UPDATE collision_vehicles
SET vehicle_type = LTRIM(RTRIM(vehicle_type));

UPDATE collision_vehicles
SET vehicle_category = 'EMERGENCY VEHICLE'
WHERE vehicle_type LIKE '%AMB%'
   OR vehicle_type LIKE '%EMS%'
   OR vehicle_type LIKE '%FDNY%'
   OR vehicle_type LIKE '%FIRE%';
   UPDATE collision_vehicles
SET vehicle_category = 'TAXI'
WHERE vehicle_type LIKE '%TAXI%'
   OR vehicle_type LIKE '%YELLOW%';

   UPDATE collision_vehicles
SET vehicle_category = 'BUS'
WHERE vehicle_type LIKE '%BUS%'
   OR vehicle_type LIKE '%OMNI%';

   UPDATE collision_vehicles
SET vehicle_category = 'BICYCLE'
WHERE vehicle_type LIKE '%BIKE%'
   OR vehicle_type LIKE '%BICYCLE%'
   OR vehicle_type LIKE '%E-BIKE%'
   OR vehicle_type LIKE '%PEDAL%';

   UPDATE collision_vehicles
SET vehicle_category = 'MOTORCYCLE / MOPED'
WHERE vehicle_type LIKE '%MOTOR%'
   OR vehicle_type LIKE '%MOPED%'
   OR vehicle_type LIKE '%SCOOT%';

   UPDATE collision_vehicles
SET vehicle_category = 'SUV'
WHERE vehicle_type LIKE '%SUV%'
   OR vehicle_type LIKE '%SUBUR%'
   OR vehicle_type LIKE '%SPORT UTILITY%';

   UPDATE collision_vehicles
SET vehicle_category = 'VAN'
WHERE vehicle_type LIKE '%VAN%'
   OR vehicle_type LIKE '%SPRINTER%'
   OR vehicle_type LIKE '%MINIVAN%';

   UPDATE collision_vehicles
SET vehicle_category = 'TRUCK'
WHERE vehicle_type LIKE '%TRUCK%'
   OR vehicle_type LIKE '%DUMP%'
   OR vehicle_type LIKE '%TRACTOR%'
   OR vehicle_type LIKE '%BOX%'
   OR vehicle_type LIKE '%FREIGHT%';

   UPDATE collision_vehicles
SET vehicle_category = 'PASSENGER VEHICLE'
WHERE vehicle_type LIKE '%SEDAN%'
   OR vehicle_type LIKE '%COUPE%'
   OR vehicle_type LIKE '%CAR%'
   OR vehicle_type LIKE '%WAGON%';

   UPDATE collision_vehicles
SET vehicle_category = 'OTHER / UNKNOWN'
WHERE vehicle_category IS NULL
   OR vehicle_type IN ('UNK', 'UNKNOWN', 'UNKN', 'N/A', 'NA', 'NONE');

   SELECT vehicle_category, COUNT(*) AS vehicle_count
FROM collision_vehicles
GROUP BY vehicle_category
ORDER BY vehicle_count DESC;

SELECT
    BOROUGH,
    CRASH_DATE,
    NUMBER_OF_PERSONS_INJURED,
    NUMBER_OF_PERSONS_KILLED,
    NUMBER_OF_PEDESTRIANS_INJURED,
    NUMBER_OF_PEDESTRIANS_KILLED,
    NUMBER_OF_CYCLIST_INJURED,
    NUMBER_OF_CYCLIST_KILLED,
    NUMBER_OF_MOTORIST_INJURED,
    NUMBER_OF_MOTORIST_KILLED
FROM [Motor_Vehicle_Collisions_-_Crashes]
WHERE BOROUGH IS NOT NULL;


SELECT BOROUGH,
SUM(NUMBER_OF_PERSONS_INJURED) AS total_injured,
SUM(NUMBER_OF_PERSONS_KILLED) AS total_killed
FROM  [Motor_Vehicle_Collisions_-_Crashes]
GROUP BY BOROUGH
ORDER BY total_killed DESC;

Which borough is most dangerous
Which has high crashes but lower deaths (important nuance)

SELECT
'Pedestrian' AS road_user,
SUM(NUMBER_OF_PEDESTRIANS_INJURED) AS injured,
SUM(NUMBER_OF_PEDESTRIANS_KILLED) AS killed
FROM  [Motor_Vehicle_Collisions_-_Crashes]

UNION ALL

SELECT 'Cyclist',
SUM(NUMBER_OF_CYCLIST_INJURED),
SUM(NUMBER_OF_CYCLIST_KILLED)
FROM [Motor_Vehicle_Collisions_-_Crashes]

UNION ALL

SELECT 'Motorist',
SUM(NUMBER_OF_MOTORIST_INJURED),
SUM(NUMBER_OF_MOTORIST_KILLED)
FROM  [Motor_Vehicle_Collisions_-_Crashes]


SELECT
YEAR(CRASH_DATE) AS crash_year,
COUNT(*) AS total_crashes,
SUM(NUMBER_OF_PERSONS_INJURED) AS total_injured,
SUM(NUMBER_OF_PERSONS_KILLED) AS total_killed
FROM  [Motor_Vehicle_Collisions_-_Crashes]
GROUP BY YEAR(CRASH_DATE)
ORDER BY crash_year;

SELECT
    cv.vehicle_category,
    COUNT(*) AS crashes,
    SUM(mvc.NUMBER_OF_PERSONS_INJURED) AS injured,
    SUM(mvc.NUMBER_OF_PERSONS_KILLED) AS killed
FROM collision_vehicles cv
JOIN [Motor_Vehicle_Collisions_-_Crashes] mvc
    ON cv.COLLISION_ID = mvc.COLLISION_ID
GROUP BY cv.vehicle_category
ORDER BY killed DESC;

SELECT
    vehicle_category,
    CAST(SUM(NUMBER_OF_PERSONS_KILLED) * 1.0 / COUNT(*) AS DECIMAL(5,4)) AS fatality_rate
FROM collision_vehicles cv
JOIN [Motor_Vehicle_Collisions_-_Crashes] mvc
    ON cv.COLLISION_ID = mvc.COLLISION_ID
GROUP BY vehicle_category
ORDER BY fatality_rate DESC;
















