# Airbnb Project — PostgreSQL Database Setup

## Overview

This project provides SQL scripts to create and populate the `airbnb_project` database in PostgreSQL.


## Prerequisites

- PostgreSQL installed and running specifically PostgreSQL 9.1 or later.
- A PostgreSQL user account with permission to create the database and its tables.
- Access to the `psql` command-line client or pgAdmin.

## Project Files

```text
Masoom_Bano_102303641_DLBDSPBDM01_P3_Submission_Code_file/
├── 102303641_DLBDSPBDM01_P3_create.sql
└── 102303641_DLBDSPBDM01_P3_insert.sql
```

The directory above illustrates the expected extracted contents; the actual extraction folder may differ.

| File | Purpose |
| --- | --- |
| `102303641_DLBDSPBDM01_P3_create.sql` | Defines the tables using `CREATE TABLE` statements and adds foreign-key constraints using `ALTER TABLE` statements. |
| `102303641_DLBDSPBDM01_P3_insert.sql` | Inserts data into the schema created by the first script. |

Run the create script before the insert script.

## 1. Check PostgreSQL Installation

Run the following in your operating-system terminal or command prompt:

```bash
psql --version
```

## 2. Create the Database

### Using pgAdmin

1. Open pgAdmin and connect to your PostgreSQL server.
2. Right-click **Databases** and select **Create → Database**.
3. Enter `airbnb_project` as the database name and save.

### Using psql

Connect from your operating-system terminal:

```bash
psql -U postgres
```

Then run the following SQL inside psql:

```sql
CREATE DATABASE airbnb_project;
```

Replace `postgres` with your PostgreSQL username if necessary. Create the database only once; skip this step if it already exists.

## 3. Execute the SQL Scripts

Choose one of the following methods. Replace the example file paths with the actual locations of your extracted SQL files.

### Method A: Operating-System Terminal

Run these commands in your terminal or command prompt, not at an interactive psql prompt:

```bash
psql -U postgres -d airbnb_project -f "/path/to/102303641_DLBDSPBDM01_P3_create.sql"
psql -U postgres -d airbnb_project -f "/path/to/102303641_DLBDSPBDM01_P3_insert.sql"
```

Check the output of the create script before proceeding with the insert script.

### Method B: Interactive psql or pgAdmin PSQL Tool

Connect from your terminal:

```bash
psql -U postgres -d airbnb_project
```

Alternatively, select `airbnb_project` in pgAdmin and open **Tools → PSQL Tool**.

Inside the psql session, run:

```text
\i '/path/to/102303641_DLBDSPBDM01_P3_create.sql'
\i '/path/to/102303641_DLBDSPBDM01_P3_insert.sql'
```

### Method C: pgAdmin Query Tool

1. Open pgAdmin and select `airbnb_project`.
2. Open **Tools → Query Tool**.
3. Use **Open File** to open `102303641_DLBDSPBDM01_P3_create.sql`.
4. Execute the script and review the output for errors.
5. Open `102303641_DLBDSPBDM01_P3_insert.sql`.
6. Execute the insert script and review the output.

## 4. Verify the Setup

Inside psql or the pgAdmin PSQL Tool, list the tables:

```text
\dt
```

Review the script execution output to confirm that both schema creation and data insertion completed without errors. Listing tables alone does not confirm that the data was inserted successfully.

## Commented Statements and Test Cases

According to the installation manual:

- The create script includes a commented-out `CREATE DATABASE airbnb_project` statement.
- The insert script includes three commented-out test cases.

To execute a block-commented statement, remove the surrounding `/*` and `*/` markers from the intended block before running it.

Do not execute the database-creation statement again if you already created `airbnb_project`. Review the test cases before running them; their contents are not included in the installation manual.

## Troubleshooting

| Issue | Suggested checks |
| --- | --- |
| Permission denied | Confirm that your PostgreSQL account has the required database and table permissions. |
| File not found | Check the extracted file location, filename, and path supplied to the command. |
| Foreign-key errors during schema creation | Confirm that referenced tables exist before the foreign-key constraints are added. Review the create script output. |
| Database not found | Create `airbnb_project` and confirm that your connection targets that database. |

## Other Database Systems

The scripts are intended for PostgreSQL. Using MySQL, SQL Server, or another database system may require changes to the SQL syntax and execution commands.

## Documentation

- PostgreSQL documentation: https://www.postgresql.org/docs/current/
