FROM node:lts-slim

RUN apt update && \
    apt install -y jq make && \
    npm install -g prettier markdownlint-cli2

ENTRYPOINT ["bash", "-lc"]
