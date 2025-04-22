CREATE TABLE FactCrash (
    Crash_Detail_ID INT PRIMARY KEY IDENTITY,
    Damage_Amount DECIMAL(18, 2),
    num_units INT,
    Incident_Severity VARCHAR(50),
    Participant_Count INT,
    Weather_ID INT FOREIGN KEY REFERENCES DimWeather(Weather_ID),
    Vehicle_ID INT FOREIGN KEY REFERENCES DimVehicle(Vehicle_ID),
    Date_ID INT FOREIGN KEY REFERENCES DimDate(Date_ID),
    Person_ID NVARCHAR(20) FOREIGN KEY REFERENCES DimPerson(Person_ID),
    Geography_ID INT FOREIGN KEY REFERENCES DimGeography(Geography_ID),
    Cause_ID INT FOREIGN KEY REFERENCES DimCause(Cause_ID),
    Crash_ID INT FOREIGN KEY REFERENCES DimCrash(Crash_ID) 
);


CREATE TABLE DimDate (
    Date_ID INT PRIMARY KEY IDENTITY,  -- Primary key with auto-increment
    Date DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    Time_of_Day TIME
);

CREATE TABLE DimVehicle (
    Vehicle_ID INT PRIMARY KEY IDENTITY,  -- Primary key with auto-increment
    Make VARCHAR(100),
    Model VARCHAR(100),
    Year INT,
    Defects VARCHAR(255),
    Vehicle_Type VARCHAR(50)
);


CREATE TABLE DimGeography (
    Geography_ID INT PRIMARY KEY IDENTITY,  -- Primary key with auto-increment
    Police_Beat VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(50),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);

CREATE TABLE DimCrash (
    Crash_ID INT PRIMARY KEY IDENTITY,  -- Primary key with auto-increment
    Crash_Type VARCHAR(100),
    Traffic_Control_Device VARCHAR(100),
    Lighting_Condition VARCHAR(100)
);

CREATE TABLE DimPerson (
    Person_ID NVARCHAR(20) PRIMARY KEY,  -- Alphanumeric ID managed manually
    Age INT,
    Age_Group VARCHAR(20),
    Role VARCHAR(50),  -- Driver, Passenger, etc.
    Injury_Classification VARCHAR(100)  -- No injury, minor, severe, fatal
);


CREATE TABLE DimWeather (
    Weather_ID INT PRIMARY KEY IDENTITY,  -- Primary key with auto-increment
    Weather_Condition VARCHAR(100),
    Visibility_Condition VARCHAR(50)  -- Good, Moderate, Poor
);

CREATE TABLE DimCause (
    Cause_ID INT PRIMARY KEY IDENTITY,  -- Primary key with auto-increment
    Cause_Description VARCHAR(255)
);





