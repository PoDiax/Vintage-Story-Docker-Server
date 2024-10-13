FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y wget jq pcregrep screen dotnet-runtime-7.0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd vintagestory -s /sbin/nologin

RUN mkdir -p /home/vintagestory/server && \
    mkdir -p /var/vintagestory/data && \
    chown -R vintagestory:vintagestory /home/vintagestory /var/vintagestory

WORKDIR /home/vintagestory/server

COPY config.json ./

RUN url=$(jq -r '.download_url' config.json) && \
    wget "$url" -O vs_server.tar.gz && \
    tar -xzf vs_server.tar.gz && \
    rm vs_server.tar.gz

COPY start_server.sh /usr/local/bin/start_server.sh
RUN chmod +x /usr/local/bin/start_server.sh

USER vintagestory

EXPOSE 42420

CMD ["bash", "/usr/local/bin/start_server.sh"]

