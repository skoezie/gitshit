#Dockeroefening

FROM ubuntu:20.04

#Eerst een enviroment var voorzien zodat apache2 niet blijft vragen achter tijdszone enzo
ENV DEBIAN_FRONTEND=noninteractive

#Eerst apt updaten
RUN apt update

#Dan Apache2 installeren
RUN apt install apache2 -y

#build datum bewaren
RUN date >/var/www/html/buildtime.txt


#kopiëren de website-files over
COPY html /var/www/html

#hoeft niet, maar kan handig zijn bij sommige zaken om in een map te starten
WORKDIR /var/www/html

EXPOSE 80/tcp

#Dit forward de poort 80 van docker naar poort 81 bij de docker host
#docker run –d –t –p 81:80

CMD service apache2 start && bash
# De “&& bash” is belangrijk omdat de container anders zou stoppen



#REMINDER
#RUN is bij het builden
#CMD is bij het opstarten 

