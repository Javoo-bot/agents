# PostgreSQL Documentation

To connect to the database, set the PostgreSQL credentials in the `.env` file.

Then, Docker Compose takes these values from `.env`.

The app uses SQLAlchemy as an ORM to connect to PostgreSQL. This means there are no direct SQL queries.

Database connections are opened and closed with each query because we use `NullPool`.

If there is an automatic disconnection, there is no mechanism to restart the app.

The database models are located in `models.py`.

We use Alembic for migrations. If you want to add or modify models, you need to edit the Alembic folder.

You can add new models or modify the existing ones by editing this file and then generating the necessary migrations using Alembic.

It remains to be checked which slow queries exist in PostgreSQL. This can be addressed using techniques like indexing or pagination.

## General Project Structure

- [x] Database Connection Configuration (`config`)
- [x] Database Handling (`core/db.py`)
- [x] Data and Table Structure (`models`)
- [x] Data Migration (`alembic`)
- [x] Basic CRUD Operations (`crud.py`)
- [x] Initial Data Setup (`initial_data`)

- **Config**
  - Creation of a local server for development.
  - Configuration of backend connection to PostgreSQL.
  - Interaction with PostgreSQL using an ORM (SQLAlchemy) in Python.
  - Secure storage of keys and credentials using environment variables.

- **Core**
  - Database is managed using Alembic.
  - Everything is managed in Alembic.
  - If Alembic does not work (it can happen), you should:
    - Define models.
    - Database connection (URI): `postgresql+psycopg://admin:secret@localhost:5432/mydatabase`.
    - Verify the existence of tables.
    - If they do not exist, create tables.
    - Add data.
    - Create a backup.

- **Models**
  - There are 8 subsections, all with the same structure.
  - We analyze the structure of `Team`, which is used for team management.
    - Define basic attributes.
    - Class to create and then update teams.
    - `Team` class where one-to-many, many-to-many relationships, and constraints are defined (a fundamental part).
    - **Configuring relationships is very important**.
    - Set up the output model when making an API request.

- **Alembic**
  - Migrations are configured in `env`, stored in `version`, and automatically updated in Docker.
  - Maiko: Migration schema that all `versions` follow.
  - Starting with `.env`:
    - Two modes of operation: **offline** and **online**.
    - We connect to the database with `get_url()`.
    - If there are metadata changes, Alembic makes migrations automatically.
    - Use environment variables for connection.
      - **Offline mode**: Generates SQL scripts without connecting to the database. Useful when the database is not available.
      - **Online mode**: Performs migrations in real time. Requires SQLAlchemy engine.

- **Crud**
  - Defines create, read, update, and delete operations that interact with the database.

- **Initial Data**
  - Initializes the database and inserts data when the application starts.
