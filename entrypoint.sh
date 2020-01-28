#!/bin/sh
# cd ./target
# while ! wget http://post:5432 ; do 
sleep 5
# done
java -Ddatasource.dialect=PGSQL \
-Dspring.profile.active=prod \
-Ddatasource.url=jdbc:postgresql://post:5432/lavagna \
-Ddatasource.username=postgres \
-Ddatasource.password=pass \
-jar lavagna-jetty-console.war