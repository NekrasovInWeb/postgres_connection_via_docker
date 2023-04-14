 
# This file has the .sh-environment. In that point I used to explaine
# connection to PostgreSQL on localhost using comman Docker-commands, bash-scripts and SQL.
 

# At first you need to start your Docker Desktop
# you can run it from the terminal 

# for MacOS 

% open -a Docker.app 

# To optimize the process of enabling docker, for example in the data pipe, it is necessary to start an entrypoint-script

# create the network where we can connect our future containers

docker network create app_net 

# create the volume for DB
# we make postgres_vol_1 but you actually can make the hole_postgres_vol_1 or other stuff
# name volume whatever you want

docker volume create postgres_vol_1

# run postgres daemon container 
# if you havent postgres on your docker image list 
# Docker will install it immediately

docker run -d -p 5432:5432 \ # 1-st we run daemon (-d) to port (-p then port)
  --name postgres_1 \ # said the name (--name) to our image
  -e POSTGRES_USER=postgres_admin \ # then we set some environment setting (-e)
  -e POSTGRES_PASSWORD=yourpass \
  -e POSTGRES_DB=test_app \
  -v postgres_vol_1:/var/lib/postgresql/data \ # push the volume (-v)
  --net=app_net \ # set the net (--net)
  postgres

# these settings are probably even a lot for the local operation of your pet-project
# But they are also just as important and useful for future use 

# get inside the container

docker exec -it postgres_1 bash 

# get inside postgres

psql -U postgres # use it for the first time its actually start the Postgres connection 

# After you run this command you should use 
# psql -h localhost -p 5432 -U postgres -W 
# because your postgres already in port 5432 on your localhost 


