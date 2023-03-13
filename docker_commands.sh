''' 
This file has the .sh-environment. In that point I used to explaine
connection to PostgreSQL on localhost using comman Docker-commands, bash-scripts and SQL.
''' 

''' At first you need to start your Docker Desktop
You can run it from the terminal 
'''
# for MacOS 
% open -a Docker.app 

# create the network where we can connect our future containers

docker network create app_net 

# create the volume for DB
## we make postgres_vol_1 but you actually can make the hole_postgres_vol_1 or other stuff
### name volume whatever you want

docker volume create postgres_vol_1

# run postgres daemon container 
