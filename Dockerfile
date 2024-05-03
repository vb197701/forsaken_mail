FROM node:lts-alpine
LABEL maintainer="root <root@gmail.com>"

RUN apt-get clean all
RUN apt-get update
RUN apt-get -y install git
RUN git clone https://github.com/malaohu/forsaken-mail.git /forsaken-mail

WORKDIR /forsaken-mail

RUN npm install

EXPOSE 25
EXPOSE 3000
CMD npm start
