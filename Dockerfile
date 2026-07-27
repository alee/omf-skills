FROM node:lts-slim

RUN apt update && \
    apt install -y jq make python3 python3-jsonschema && \
    npm install -g prettier markdownlint-cli2

ENTRYPOINT ["bash", "-lc"]
