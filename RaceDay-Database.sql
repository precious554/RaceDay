/* ============================================================
   RACEDAY EVENT MANAGEMENT SYSTEM
   PART 1 - DATABASE SCRIPT
   ============================================================ */

---------------------------------------------------------------
-- 1. CREATE DATABASE
---------------------------------------------------------------

IF DB_ID('RaceDay') IS NULL
BEGIN
    CREATE DATABASE RaceDay;
END
GO

USE RaceDay;
GO


---------------------------------------------------------------
-- 2. CREATE USER TABLE
---------------------------------------------------------------

CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL DEFAULT 'Participant',

    CONSTRAINT CK_User_Role
        CHECK (Role IN ('Organiser', 'Participant'))
);
GO


---------------------------------------------------------------
-- 3. CREATE EVENT TABLE
---------------------------------------------------------------

CREATE TABLE [Event] (
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserID INT NOT NULL,
    EventName VARCHAR(150) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Description VARCHAR(500),

    CONSTRAINT FK_Event_Organiser
        FOREIGN KEY (OrganiserID)
        REFERENCES [User](UserID)
);
GO


---------------------------------------------------------------
-- 4. CREATE CATEGORY TABLE
---------------------------------------------------------------

CREATE TABLE [Category] (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Category_Event
        FOREIGN KEY (EventID)
        REFERENCES [Event](EventID),

    CONSTRAINT CK_Category_Distance
        CHECK (Distance > 0),

    CONSTRAINT CK_Category_EntryFee
        CHECK (EntryFee >= 0),

    CONSTRAINT UQ_Category_Event_Name
        UNIQUE (EventID, CategoryName)
);
GO


---------------------------------------------------------------
-- 5. CREATE ROUTE TABLE
---------------------------------------------------------------

CREATE TABLE [Route] (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    RouteName VARCHAR(100) NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    Description VARCHAR(500),
    RouteMapURL VARCHAR(500),

    CONSTRAINT FK_Route_Event
        FOREIGN KEY (EventID)
        REFERENCES [Event](EventID),

    CONSTRAINT CK_Route_Distance
        CHECK (Distance > 0)
);
GO


---------------------------------------------------------------
-- 6. CREATE ENROLMENT TABLE
---------------------------------------------------------------

CREATE TABLE [Enrolment] (
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrolmentDate DATE NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT FK_Enrolment_Participant
        FOREIGN KEY (ParticipantID)
        REFERENCES [User](UserID),

    CONSTRAINT FK_Enrolment_Category
        FOREIGN KEY (CategoryID)
        REFERENCES [Category](CategoryID),

    CONSTRAINT CK_Enrolment_Status
        CHECK (Status IN ('Active', 'Cancelled')),

    CONSTRAINT UQ_Enrolment_Participant_Category
        UNIQUE (ParticipantID, CategoryID)
);
GO


---------------------------------------------------------------
-- 7. CREATE RESULTS TABLE
---------------------------------------------------------------

CREATE TABLE [Results] (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL,
    FinishTime TIME NULL,
    Position INT NULL,
    ResultStatus VARCHAR(30) NOT NULL DEFAULT 'Completed',

    CONSTRAINT FK_Results_Enrolment
        FOREIGN KEY (EnrolmentID)
        REFERENCES [Enrolment](EnrolmentID),

    CONSTRAINT CK_Results_Position
        CHECK (Position IS NULL OR Position > 0),

    CONSTRAINT CK_Results_Status
        CHECK (ResultStatus IN
            ('Completed', 'Did Not Finish', 'Disqualified')),

    CONSTRAINT UQ_Results_Enrolment
        UNIQUE (EnrolmentID)
);
GO


---------------------------------------------------------------
-- 8. INSERT SAMPLE USERS
-- 2 Organisers + 2 Participants
---------------------------------------------------------------

INSERT INTO [User]
    (FirstName, LastName, Email, Password, Role)
VALUES
    ('Thabo', 'Mokoena',
     'thabo@raceday.co.za',
     'P@ssword123!',
     'Organiser'),

    ('Lerato', 'Molefe',
     'lerato@raceday.co.za',
     'P@ssword123!',
     'Organiser'),

    ('Tshegofatso', 'Mokotedi',
     'tshegofatso@email.com',
     'P@ssword123!',
     'Participant'),

    ('Katlego', 'Lekala',
     'katlego@email.com',
     'P@ssword123!',
     'Participant');
GO


---------------------------------------------------------------
-- 9. INSERT SAMPLE EVENTS
---------------------------------------------------------------

INSERT INTO [Event]
    (OrganiserID, EventName, EventDate, Location, Description)
VALUES
    (1,
     'Pretoria City Run',
     '2026-10-10',
     'Pretoria',
     'Annual road running event in Pretoria.'),

    (1,
     'Johannesburg Spring Race',
     '2026-10-24',
     'Johannesburg',
     'Road running event for different age groups.'),

    (2,
     'Hartbeespoort Cycle Challenge',
     '2026-11-07',
     'Hartbeespoort',
     'Cycling challenge around Hartbeespoort Dam.');
GO


---------------------------------------------------------------
-- 10. INSERT SAMPLE CATEGORIES
---------------------------------------------------------------

INSERT INTO [Category]
    (EventID, CategoryName, Distance, EntryFee)
VALUES
    (1, '5KM Fun Run', 5.00, 100.00),
    (1, '10KM Run', 10.00, 150.00),
    (1, '21KM Half Marathon', 21.10, 250.00),

    (2, '5KM Run', 5.00, 100.00),
    (2, '10KM Run', 10.00, 160.00),

    (3, '30KM Cycle', 30.00, 300.00),
    (3, '60KM Cycle', 60.00, 450.00);
GO


---------------------------------------------------------------
-- 11. INSERT SAMPLE ROUTES
---------------------------------------------------------------

INSERT INTO [Route]
    (EventID, RouteName, Distance, Description, RouteMapURL)
VALUES
    (1,
     'Pretoria City Route',
     10.00,
     'Route through central Pretoria and surrounding areas.',
     'https://example.com/routes/pretoria-city'),

    (2,
     'Johannesburg Spring Route',
     10.00,
     'Road route through selected Johannesburg streets.',
     'https://example.com/routes/johannesburg-spring'),

    (3,
     'Hartbeespoort Dam Route',
     60.00,
     'Scenic cycling route around Hartbeespoort Dam.',
     'https://example.com/routes/hartbeespoort-cycle');
GO


---------------------------------------------------------------
-- 12. INSERT SAMPLE ENROLMENTS
---------------------------------------------------------------

INSERT INTO [Enrolment]
    (ParticipantID, CategoryID, EnrolmentDate, Status)
VALUES
    (3, 1, '2026-09-01', 'Active'),
    (3, 5, '2026-09-02', 'Active'),
    (4, 2, '2026-09-03', 'Active'),
    (4, 7, '2026-09-04', 'Active');
GO


---------------------------------------------------------------
-- 13. INSERT SAMPLE RESULTS
---------------------------------------------------------------

INSERT INTO [Results]
    (EnrolmentID, FinishTime, Position, ResultStatus)
VALUES
    (1, '00:32:15', 12, 'Completed'),
    (2, '00:58:40', 8, 'Completed'),
    (3, '00:51:25', 15, 'Completed');
GO


---------------------------------------------------------------
-- 14. VERIFICATION QUERIES
---------------------------------------------------------------

SELECT * FROM [User];
SELECT * FROM [Event];
SELECT * FROM [Category];
SELECT * FROM [Route];
SELECT * FROM [Enrolment];
SELECT * FROM [Results];
GO

/* ============================================================
   END OF RACEDAY DATABASE SCRIPT
   ============================================================ */