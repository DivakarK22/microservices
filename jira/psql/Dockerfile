FROM postgres:latest

# Environment variables for user, password, and database name
ENV POSTGRES_USER=jira
ENV POSTGRES_PASSWORD=jira
ENV POSTGRES_DB=jira
# Copy SQL scripts to initialize database
COPY init.sql /docker-entrypoint-initdb.d/

# Grant all privileges to the user on the database
RUN echo "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;" > /docker-entrypoint-initdb.d/init.sql