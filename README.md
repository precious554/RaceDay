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
- **GitHub Actions Evidence** – Screenshot showing successful repository validation.

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
│   ├── RaceDay_API Endpoint Plan.pdf
│   ├── RaceDay-Database.sql
│   └── Screenshot 2026-09-04 135832.png
│
├── README.md
│
└── .github/
    └── workflows/
        └── validate.yml
# RaceDay

[Your existing README content stays here]

## RaceDay System

RaceDay is a web-based event management system designed for the South African road running, walking and cycling community. The system allows organisers to create and manage events, categories, participant enrolments and race results, while participants can browse events, enter events and track their personal performance history.

## User Roles

### Organiser
Organisers can create, edit and delete events, manage event categories, capture participant results and view event enrolments.

### Participant
Participants can create an account, browse upcoming events, enter events by selecting a category, view their enrolments and track their personal results.

## Database Design
The RaceDay database is designed using six main entities: User, Event, Category, Enrolment, Result and Route. Primary keys uniquely identify records, while foreign keys are used to connect related entities. The database design supports event management, participant enrolments and the recording of race results.

## API
The RaceDay API is planned to support authentication, user profiles, events, categories, event enrolments and participant results. The API uses RESTful endpoints with appropriate HTTP methods such as GET, POST, PUT and DELETE. Access to protected functionality is controlled according to the Organiser and Participant roles.
## Part 1 Requirements

Part 1 of the RaceDay project focuses on system planning and database development. The deliverables include an Entity Relationship Diagram (ERD), a complete API endpoint plan and a SQL database script. The planning documents are stored in the docs folder of the repository.

