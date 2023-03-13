# This file has the .sh-environment. In that point I used to explaine
# connection to PostgreSQL on localhost using common bash-scripts and SQL.
 

# At first you need to start your Docker Desktop
# You can run it from the terminal 

# for MacOS 

% open -a Docker.app 

# create the network where we can connect our future containers

docker network create app_net 

# create the volume for DB
## we make postgres_vol_1 but you actually can make the hole_postgres_vol_1 or other stuff
### name volume whatever you want

docker volume create postgres_vol_1

# run postgres daemon container 

docker run -d -p 5432:5432 \ 
    --name postgres_1 \
    -e POSTGRES_USER=postgres_admin \ 
    -e POSTGRES_PASSWORD=yourpass \
    -e POSTGRES_DB=test_app \ 
    -v postgres_vol_1:/var/lib/postgresql/data \
    --net=app_net \
    postgres

# Lets explain commands 
# run is for running container 
# -d is for daemon 
# -p is for port then 
# --name us for name and other stuff like that 
# Bash-scripts is obvious in some things

# lets check our docker container/image status 

docker ps -a
docker images 


# Okay lets roll the next steps 
# Now we need to go through docker to application-terminal

# use the notion exec to go through 

docker exec -it postgres_1 bash

## exec -it - Enter the shell in the container

# the go to the postgres 

psql -U postgres # this bash-scripts we used to making the database 

## for second and others we should use this one 

psql -h localhost -p 5432 -U postgres -W 
