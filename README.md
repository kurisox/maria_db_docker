# Start-UP
1. Create .env file
2. Paste the envs from the template into the .env file
3. Fill the envs with values
4. docker-compose -f MariaDB.yaml up to start the container
5. docker exec -it db_name from the .env file mariadb -u db_user from the .env file -p 
6. enter password specified in the .env file
7. show databases to check if the db exists
