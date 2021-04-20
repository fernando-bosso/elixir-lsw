FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive PORT=5000 MIX_ENV=prod

WORKDIR /app

ADD https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb erlang-solutions_2.0_all.deb

RUN apt-get update -qy && apt-get install -qy gnupg2 && \
  dpkg -i erlang-solutions_2.0_all.deb && rm -rf erlang-solutions_2.0_all.deb && \
  apt-get update -qy && apt-get install -qy esl-erlang elixir  && \
  yes | mix archive.install hex phx_new 1.5.8

EXPOSE 5000

CMD ["mix", "phx.server"]
