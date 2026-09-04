# RaceDay

## RaceDay Event Management System

RaceDay is a web-based event management system designed for South African road running, walking, and cycling events. The system allows organisers to manage events, categories, participant enrolments, routes and results, while participants can register for events and track their personal results.

## System Roles

### Organiser
Organisers can:
- Create, edit and delete events
- Manage event categories
- Manage event information
- View participant enrolments
- Capture participant results
- View event results

### Participant
Participants can:
- Create an account
- Browse available events
- View event categories
- Enter an event by selecting a category
- View their own enrolments
- Track their personal results

## Part 1 – System Planning and Database

The `docs` folder contains the planning and database documentation for the RaceDay system:

- **ERD** – Entity Relationship Diagram showing the database entities, attributes, keys and relationships.
- **API Endpoint Plan** – Planned REST API endpoints for authentication, users, events, categories, enrolments, results and routes.
- **SQL Database Script** – SQL Server script containing the RaceDay database structure, constraints and sample data.

## Technologies

- C#
- SQL Server
- RESTful API
- ASP.NET Core
- MVC
- GitHub

## Repository Structure

```text
RaceDay/
├── docs/
│   ├── RaceDay-ERD.png
│   ├── RaceDay-API-Endpoints.docx
│   └── RaceDay-Database.sql
│
├── README.md
│
└── .github/
    └── workflows/
## GitHub Actions Validation

The RaceDay repository uses GitHub Actions to validate the required repository structure and planning documents.

![GitHub Actions Green Build](docs/github-actions-green-build.png)
