FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

ENV B3_PARSER "iourt43"
ENV B3_DATABASE "sqlite://@conf/database.sqlite"
ENV B3_BOTNAME "b3"
ENV B3_BOTPREFIX "^0(^2b3^0)^7:"
ENV B3_RCONPASSWORD ""
ENV B3_GAMEPORT 27960
ENV B3_GAMEIP "127.0.0.1"

RUN apt-get update && apt-get dist-upgrade -yq && \
    apt-get install -yq libsqlite3-dev sqlite3 tar git curl nano wget dialog net-tools build-essential python-mysqldb python python-dev python-distribute python-pip postgresql-common libpq-dev gettext-base

WORKDIR /opt

RUN git clone https://github.com/BigBrotherBot/big-brother-bot.git /opt/b3 && \
    mv /opt/b3/b3/conf /opt/b3/b3/.conf && \
    mv /opt/b3/b3/extplugins /opt/b3/b3/.extplugins && \
    mv /opt/b3/b3/parsers /opt/b3/b3/.parsers && \
    pip install -r /opt/b3/requirements.txt

ADD b3.xml /opt/b3/b3-docker.xml
ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]
CMD ["--help"]
