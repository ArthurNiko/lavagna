#!/bin/sh
# cd ./target
while ! wget http://MySQL:3306 ; do sleep 1
done
java -Ddatasource.dialect=MYSQL \
-Ddatasource.url=jdbc:mysql://MySQL:3306/lavagna?useSSL=false \
-Ddatasource.username=root \
-Ddatasource.password=pass \
-Dspring.profile.active=prod \
-jar lavagna-jetty-console.war