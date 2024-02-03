CREATE TABLE busroute.DisabilityInformation (
disability_code VARCHAR(4) PRIMARY KEY,
type VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, 
severity VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE busroute.PassengerDisabilityCode (
disabilityID BIGINT,
disability_code VARCHAR(4),
primary key (disabilityID, disability_code),
foreign key (disabilityID) references busroute.Passenger(disabilityID),
foreign key (disability_code) references busroute.DisabilityInformation(disability_code)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

create table passenger (
disabilityID BIGINT Primary key, 
name VARCHAR(3) character set utf8mb4 collate utf8mb4_unicode_ci,
DOB Date, 
sex CHAR(1)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

CREATE TABLE busroute.ridinghistory (
Riding_Number INT AUTO_INCREMENT PRIMARY KEY,
disabilityID BIGINT,
disability_code VARCHAR(4),
Passenger_Location_Latitude DOUBLE,
Passenger_Location_Longitude DOUBLE,
foreign key (disabilityID) references busroute.Passenger(disabilityID),
foreign key (disability_code) references busroute.DisabilityInformation(disability_code)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

create table destinationinformation (
destination_code VARCHAR(50) Primary key,
destination_name VARCHAR(50) character set utf8mb4 collate utf8mb4_unicode_ci,
address VARCHAR(200) character set utf8mb4 collate utf8mb4_unicode_ci
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table destinationType (
destination_code VARCHAR(50),
destination_type VARCHAR(30) character set utf8mb4 collate utf8mb4_unicode_ci,
primary key (destination_code),
foreign key (disability_code) references busroute.DestinationInformation(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table destinationLocation (
destination_code VARCHAR(50),
destination_Latitude DOUBLE,
destination_Longitude DOUBLE,
primary key (destination_code),
foreign key (disability_code) references busroute.DestinationInformation(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table welfare (
destination_code VARCHAR(50),
facility_type VARCHAR(30) character set utf8mb4 collate utf8mb4_unicode_ci,
phone_number VARCHAR(20),
postal_number VARCHAR(10),
primary key (destination_code),
foreign key (disability_code) references busroute.DestinationInformation(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table Transportation (
destination_code VARCHAR(50),
Subway_line VARCHAR(30) character set utf8mb4 collate utf8mb4_unicode_ci,
primary key (destination_code),
foreign key (disability_code) references busroute.DestinationInformation(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table Education (
destination_code VARCHAR(50),
school_type VARCHAR(10) character set utf8mb4 collate utf8mb4_unicode_ci,
establishment_type VARCHAR(10) character set utf8mb4 collate utf8mb4_unicode_ci,
gender_classification VARCHAR(10) character set utf8mb4 collate utf8mb4_unicode_ci,
phone_number VARCHAR(20),
postal_number VARCHAR(10),
website VARCHAR(255),
primary key (destination_code),
foreign key (disability_code) references busroute.DestinationInformation(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table hospital (
destination_code VARCHAR(50),
hospital_type VARCHAR(30) character set utf8mb4 collate utf8mb4_unicode_ci,
phone_number VARCHAR(20),
primary key (destination_code),
foreign key (disability_code) references busroute.DestinationInformation(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table hospitalhours (
destination_code VARCHAR(50),
day_of_week VARCHAR(20) character set utf8mb4 collate utf8mb4_unicode_ci,
start__time TIME NULL,
end_time TIME NULL,
operation_staus VARCHAR(10),
primary key (destination_code,day_of_week),
foreign key (disability_code) references busroute.hospital(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

create table MedicalDepartment (
destination_code VARCHAR(50),
department VARCHAR(30) character set utf8mb4 collate utf8mb4_unicode_ci,
primary key (destination_code,department),
foreign key (disability_code) references busroute.hospital(destination_code)
) default charset = utf8mb4 collate = utf8mb4_unicode_ci;

-- ======-- txt file 넣기 ======- 

LOAD DATA INFILE 'C:\\temp\\DisabilityInformation.txt'
INTO TABLE disabilityinformation
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(disability_type, severity,disability_code);

LOAD DATA INFILE 'C:\\temp\\PassengerDisabilityCode.txt'
INTO TABLE PassengerDisabilityCode
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@ignore,disabilityID, disability_code);

LOAD DATA INFILE 'C:\\temp\\passenger.txt'
INTO TABLE passenger
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@ignore,disabilityID, name,DOB,sex);

LOAD DATA INFILE 'C:\\temp\\Shuttlebus.txt'
INTO TABLE Ridinghistory
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@ignore,disabilityID, Passenger_location_latitude,Passenger_location_longitude, destination_code);


LOAD DATA INFILE 'C:\\temp\\DestinationInformation.txt'
INTO TABLE DestinationInformation
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,destination_name,address);

LOAD DATA INFILE 'C:\\temp\\DestinationType.txt'
INTO TABLE DestinationType
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,destination_type);

LOAD DATA INFILE 'C:\\temp\\DestinationLocation.txt'
INTO TABLE DestinationLocation
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,Destination_Latitude,Destination_Longitude);

LOAD DATA INFILE 'C:\\temp\\welfare.txt'
INTO TABLE welfare
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,facility_type,phone_number,postal_number);

LOAD DATA INFILE 'C:\\temp\\transportation.txt'
INTO TABLE transportation
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,subway_line);

LOAD DATA INFILE 'C:\\temp\\religion.txt'
INTO TABLE religion
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,religion_type);

LOAD DATA INFILE 'C:\\temp\\education.txt'
INTO TABLE education
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,school_type,establishment_type,gender_classification,postal_number,phone_number,website);

LOAD DATA INFILE 'C:\\temp\\hospital.txt'
INTO TABLE hospital
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,hospital_type,phone_number);

LOAD DATA INFILE 'C:\\temp\\hospitalhours.txt'
INTO TABLE hospitalhours
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,day_of_week,start_time,end_time);

LOAD DATA INFILE 'C:\\temp\\medicaldepartment.txt'
INTO TABLE medicaldepartment
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(destination_code,department);


-- =====쿼리 문 작성 =====


SELECT di.destination_code, di.destination_name, COUNT(*) as passenger_count
FROM busroute.ridinghistory rh
JOIN busroute.DestinationInformation di ON rh.destination_code = di.destination_code
GROUP BY di.destination_code, di.destination_name;


SELECT 
    di.destination_code, 
    di.destination_name, 
    di.address, 
    md.department,
    hh.day_of_week,
    hh.start_time,
    hh.end_time,
    h.phone_number
FROM 
    busroute.DestinationInformation di
JOIN 
    busroute.Hospital h ON di.destination_code = h.destination_code
JOIN 
    busroute.MedicalDepartment md ON h.destination_code = md.destination_code
LEFT JOIN 
    busroute.HospitalHours hh ON h.destination_code = hh.destination_code
WHERE 
    md.department = '외과'
    AND hh.day_of_week = '토요일';
    
    
    SELECT rh.*, pi.name, pi.DOB
FROM RidingHistory rh
JOIN Passenger pi ON rh.disabilityID = pi.disabilityID
WHERE rh.disabilityID IN(
Select disabilityID FROM busroute.PassengerDisabilityCode
WHERE disability_code IN('AR01', 'LA01')
);

SELECT
pi.name,
pi.DOB,
pdc.disability_code
FROM
busroute.ridinghistory rh
INNER JOIN
busroute.passenger pi
ON rh.disabilityID = pi.disabilityID
INNER JOIN
busroute.passengerdisabiltycode pdc
ON pi.disabilityID = pdc.disabilityID
WHERE
rh.destination_code = 'E018'

-- ====엔DB 1조=== 

