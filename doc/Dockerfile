FROM maven AS stampoBuild
WORKDIR /app
COPY . .
RUN mvn -v
RUN mvn clean stampo:build

FROM python
WORKDIR /app
RUN apt update
RUN apt install python3-pip -y
RUN pip install flask
COPY /home/bynet13/Desktop/lavagna/project/doc/launch.py .
COPY --from=stampoBuild /app/target/lavagna/help .
ENTRYPOINT [ "python","launch.py" ]