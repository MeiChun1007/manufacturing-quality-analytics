# Manufacturing Quality Analytics

## Project Overview

Developed a web-based production and non-conformance (NC) data collection system integrated with a relational database and Power BI reporting.

## Business Problem

Before the implementation of this system, production operators manually recorded production progress and non-conformance (NC) information. An administrator subsequently transferred the handwritten records into Excel on the following day.

This workflow involved repetitive manual data entry, delayed data availability, and additional administrative effort. Although production and quality data were being collected, the process made it more difficult to access, monitor, and visualize the information efficiently.

## Project Objectives

The project aimed to digitize and streamline production data collection by:

- Replacing the manual record-transfer process with a centralized web-based data entry system.
- Reducing repetitive administrative data entry and the risk of transcription errors.
- Centralizing production and non-conformance records for easier retrieval and analysis.
- Enabling more effective monitoring of production performance and quality trends.
- Supporting data-driven decision-making through interactive Power BI dashboards.
- 
## Solution Overview

A production and non-conformance data management system was developed to connect operational data collection with analytics and reporting.

The solution consists of:

1. **Data Collection:** A web-based interface for recording production progress and non-conformance information.
2. **Data Storage:** A centralized database for storing and organizing submitted records.
3. **Data Analysis:** Structured production and quality data prepared for reporting.
4. **Data Visualization:** Power BI dashboards for analyzing production output, NC trends, and operator-level performance.

The project demonstrates how digitizing a manual workflow can establish a more efficient foundation for operational reporting and data analysis.

## Key Features

- Production and NC data collection using Joomla
- Centralized database storage
- Data validation and duplicate submission controls
- Operational monitoring dashboards
- Power BI KPI and trend analysis
- NC analysis by category, type, model, and vendor
- System documentation and refresh troubleshooting procedures

## Technology Stack

- Joomla
- Relational Database / SQL
- Microsoft Power BI
- Power Query
- DAX

## System Workflow

Data Collection → Data Validation → Database → Joomla Reporting and Power BI → Quality Analysis

![System Workflow](docs/screenshots/high-level-system-architecture.png) 

## My Contribution

- Developed the data collection workflow.
- Implemented system-level data validation controls.
- Built operational dashboards and Power BI reports.
- Designed KPI monitoring and quality analysis views.
- Prepared system documentation and maintenance guidance.

## Project Screenshots

### Data Entry and Validation

| Data Entry Form | Validation Message |
|-----------------|--------------------|
| ![Data entry form](screenshots/09-data-entry-form.png) | ![Validation error](docs/screenshots/03-validation-error.png) |
| Production information with multiple NC lines | Rules such as NC quantity ≤ total are enforced on the server |

| Data Entry List | NC Data Entry List |
|-----------------|--------------------|
| ![Data entry list](screenshots/02-data-entry-list.png) | ![NC Data entry list](screenshots/03-nc-data-entry-list-v1.png) |

### Reporting and analytics

#### Joomla Site

![Internal dashboard](screenshots/01-dashboard-1.png)
![Internal dashboard](screenshots/01-dashboard-2.png)

*Joomla internal dashboard: KPI cards, NC trend, top models, vendor analysis and NC breakdown.*

-----------------

| NC Report Monthly | NC Report Weekly |
|-----------------|--------------------|
| ![NC Report Monthly](screenshots/04-nc-report-monthly.png) | ![NC Report Weekly](screenshots/05-nc-report-weekly.png) |
| ![NC Report Monthly](screenshots/04-nc-report-monthly-1.png) | ![NC Report Weekly](screenshots/05-nc-report-weekly-1.png) |


| Model Summary | Daily NC% Summary | Operator Analysis | 
|-----------------|--------------------|-----------------|
| ![Model Summary](screenshots/06-model-summary.png) | ![Daily NC% Summary](screenshots/07-daily-nc-summary.png) | ![Operator Analysis](screenshots/08-operator-analysis.png) | 

-----------------
#### BI Dashboard
![BI dashboard](screenshots/10-bi-dashboard.png)
*Power BI dashboard built on the sample data: quality overview, NC trend and breakdowns by category and type.*

### Documentation

- [System architecture](docs/architecture.md)
- [Data flow](docs/data-flow.md)
- [Technical documentation](docs/technical-documentation.md)

## Data Privacy

- **No real accounts or credentials.** The sample users use `example.com` addresses and non-functional
  placeholder passwords. No API tokens, passwords, connection strings or server details are included.
