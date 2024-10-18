# How to Load a `.sql` File into PostgreSQL Inside Docker

This document explains step-by-step how to load a `.sql` file into a PostgreSQL database running inside a Docker container. This is very useful for quick tests and to avoid modifying the backend with each change. Initial tests can be performed on SQLite, and if everything works, migrations can be done using Alembic.

## Step-by-Step

### Step 1: Load the 'db' Container

First, make sure to load only the database (`db`) container. To do this, use the following command:

```bash
# Load only the 'db' container
docker-compose up db
```

### Step 2: Copy the `.sql` File to the Container

Once you have the `.sql` file ready (e.g., `mydatabase.sql`), copy it to the Docker container. Make sure you know the container ID or name.

Run the following command:

```bash
docker cp postgreSQL/mydatabase.sql <container_id>:/tmp/mydatabase.sql
```

Replace `<container_id>` with the ID of the PostgreSQL container. You can obtain the container ID by running `docker ps`.

### Step 3: Enter the Docker Container

Enter the Docker container to interact with the database.

```bash
docker exec -it <container_id> /bin/bash
```

### Step 4: Connect to PostgreSQL with `psql`

Once inside the container, connect to the PostgreSQL database using the `psql` client.

```bash
psql -U postgres -d app
```

- `-U postgres` indicates the user (in this case, `postgres`).
- `-d app` indicates the database you want to connect to (in this case, `app`).

### Step 5: Load the `.sql` File in `psql`

From the `psql` session, load the `.sql` file you copied to the container.

```sql
\i /tmp/mydatabase.sql
```

This command executes all the instructions contained in the `.sql` file and applies them to the database.

### Step 6: Verify the Tables and Data

Once the file has been executed, you can verify that the tables and data have been added correctly.

- To list the created tables:

  ```sql
  \d
  ```

- To review the content of a specific table, for example, `template`:

  ```sql
  SELECT * FROM template;
  ```

## Instructions to Launch PostgreSQL with Exposed Port

To expose the PostgreSQL port and connect from outside the container, follow these steps:

1. **Modify the `docker-compose.override.yml` or `docker-compose.local.yml` File**:

   Make sure that the `db` service has the configuration to expose port `5432`. It should look like this:

   ```yaml
   services:
     db:
       restart: "no"
       ports:
         - "5432:5432"
   ```

2. **Launch the Container with Additional Configuration**:

   Use the following command to launch the containers, making sure to include the necessary configuration files:

   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.local.yml up db adminer
   ```

   This will ensure that the PostgreSQL container is running and that port `5432` is exposed for access from outside the container.

3. **Verify the Container Status**:

   Run the following command to verify that the container is running and that the port is properly exposed:

   ```bash
   docker ps
   ```

   In the **PORTS** column, you should see `0.0.0.0:5432->5432/tcp`, indicating that the port is available.

4. **Connect to PostgreSQL**:

   Now you can use any PostgreSQL client to connect to the database using:

   - **Host**: `localhost`
   - **Port**: `5432`
   - **User**: The value of `POSTGRES_USER` in your `.env` file
   - **Password**: The value of `POSTGRES_PASSWORD` in your `.env` file
   - **Database**: The value of `POSTGRES_DB` in your `.env` file

## Final Notes

- **Quick Tests with SQLite**: You can test first in SQLite and then port the `.sql` to PostgreSQL for further testing.
- **Migrations with Alembic**: If everything works correctly, you can convert these changes into a formal migration using Alembic to integrate them stably into your project without the need to hardcode them in the backend.

* After changing a model (for example, adding a column), inside the container, create a revision, e.g.:

```bash
$ alembic revision --autogenerate -m "Add column last_name to User model"
```

With these steps, you can easily load `.sql` files into your PostgreSQL database within Docker to perform tests and verifications without additional complications.
