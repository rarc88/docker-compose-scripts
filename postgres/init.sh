psql -U postgres -c "CREATE USER tad WITH SUPERUSER PASSWORD 'tad';"
sed -i -e"s/^datestyle = 'iso, mdy'.*$/datestyle = 'iso, dmy'/" /var/lib/postgresql/data/postgresql.conf
