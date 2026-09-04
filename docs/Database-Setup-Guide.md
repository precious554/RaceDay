# RaceDay Database Setup Guide

## Database Management System

RaceDay uses Microsoft SQL Server as the database management system.

## Database Name

The database is named:

`RaceDay`

## Database Script

The database structure and sample data are provided in:

`RaceDay-Database.sql`

## Database Tables

The RaceDay database contains the following tables:

- User
- Event
- Category
- Route
- Enrolment
- Results

## Database Relationships

- A User can organise multiple Events.
- An Event can have multiple Categories.
- An Event can have multiple Routes.
- A Participant can have multiple Enrolments.
- A Category can have multiple Enrolments.
- An Enrolment can have one Result.

## Running the SQL Script

The SQL script should be executed in Microsoft SQL Server Management Studio (SSMS).

The script creates the required database tables, relationships, constraints and sample data.

## Sample Data

The database includes sample data for:

- Organisers
- Participants
- Events
- Event Categories
- Routes
- Enrolments
- Results

This sample data is included to demonstrate that the database structure supports the planned RaceDay system.
