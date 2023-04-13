psql -U postgres -c "
    SELECT *, pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid() AND datname = '$1';
    REVOKE CONNECT ON DATABASE $1 FROM PUBLIC, tad;
    ALTER DATABASE $1 RENAME TO $2;
"