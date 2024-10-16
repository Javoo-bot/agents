# PostgreSQL Documentation

To connect to the database, place your PostgreSQL credentials in the `.env` file.

Docker Compose will then use the data from `.env`.

The application uses SQLAlchemy as an ORM to connect to PostgreSQL, meaning there are no direct SQL queries.

Database connections are opened and closed with each query because we use `NullPool`.

If there's an automatic disconnection, there's no mechanism to restart the app.

Database models are located in `models.py`.

We use Alembic for database migrations. To add or modify models, edit the Alembic folder and generate the necessary migrations.

We need to address slow queries in PostgreSQL, which can be optimized using indexing or pagination techniques.

## General Project Structure

- **Database Connection Configuration (`config`)**
- **Database Management (`core/db.py`)**
- **Data Structures and Tables (`models`)**
- **Data Migration (`alembic`)**
- **Basic Database Operations: CRUD (`crud.py`)**
- **Initial Data Setup (`initial_data`)**

### **Config**

- Set up a local server for development.
- Configure the backend connection to PostgreSQL.
- Interact with PostgreSQL using SQLAlchemy in Python.
- Securely store keys and credentials using environment variables.

### **Core**

- The database is managed using Alembic.
- Alembic handles all migrations.
- If Alembic doesn't work (it can happen), you would need to:
  - Define models.
  - Set up the database connection URI:

    ```python
    postgresql+psycopg://admin:secret@localhost:5432/mydatabase
    ```

  - Verify if tables exist.
  - If not, create the tables.
  - Add data.
  - Create a backup.

### **Models**

- Contains 8 subsections with the same structure.
- Example: Analyzing the `Team` structure used for team management.
  - Define basic attributes.
  - Create classes for creating and updating teams.
  - Define the `Team` class with one-to-many and many-to-many relationships and constraints.
    - **Configuring relationships is crucial.**
  - Set up the output model for API requests.

### **Alembic**

- In `env.py`, configure migrations stored in the `versions` folder, which are automatically updated in Docker.
- Migrations follow a consistent schema across all `versions`.
- Starting with `.env`:
  - Two operation modes: **offline** and **online**.
  - Connect to the database using `get_url()`.
  - Alembic automatically creates migrations if there are metadata changes.
  - Use environment variables for the connection.
    - **Offline mode**: Generates SQL scripts without connecting to the database. Useful when the DB isn't available.
    - **Online mode**: Performs real-time migrations. Requires the SQLAlchemy engine.

### **CRUD**

- Defines create, read, update, and delete operations interacting with the database.

### **Initial Data**

- Initializes the database and inserts data when the application starts.

## Steps to Create a New Table (Extending LLM Memory, Specific Knowledge, Context)

1. **Create a New Model in `models.py`**: Define new attributes, relationships, and constraints.
2. **Generate a New Migration with Alembic**.
3. **Review the Generated Migration File**.
4. **Apply the Migration to the Database**: Done via Docker.
5. **Verify the Creation of the New Table in PostgreSQL**.
