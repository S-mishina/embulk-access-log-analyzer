FROM openjdk:11-jre-slim

WORKDIR /
COPY embulk_run.sh /embulk_run.sh

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN curl --create-dirs -o /usr/local/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk

ENTRYPOINT ["bash"]

CMD [ "./embulk_run.sh" ]

