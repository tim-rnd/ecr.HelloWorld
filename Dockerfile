FROM ubuntu:latest
LABEL version.angular="14-lts" \
      version.ubuntu="22.04-lts" \
      version.firebase="9.1.0" \
      version.nvm="8" \
      version.npm="16" \
      version.hahlabs-angular="alpha-00.02.02" \
      version.description="Timezone setup"

RUN apt update \
 && apt -y upgrade \
 && apt install -y nginx curl sudo

EXPOSE 80
CMD "/bin/sh -c \"nginx -g  'daemon off;'\"" 