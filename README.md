# Launch School - LS180 Database Foundations Course

## Connect to Postgres

### PSQL

Usually, one interacts with a database server remotely using a client. PSQL is one of those clients. Ensure *postgresql-client* has been installed when accessing the database that's running in a separate container.

`psql -h db -p 5432 -U app_dev` (change `-U [username]` if you set a different username in your `.env`)

- Automatic login using the `POSTGRES_USER` and `POSTGRES_PASSWORD` values specified in your `.env` file is configured during dev environment creation with the creation of a `~/.pgpass` password file.
  - More information [here](https://www.postgresql.org/docs/current/libpq-pgpass.html).

[Documentation](https://www.postgresql.org/docs/current/app-psql.html)
