psql -U postgres -c "
    CREATE USER $1 SUPERUSER password '$2';
    ALTER USER $1 SET default_transaction_read_only = ON;
";