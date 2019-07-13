FROM alpine

LABEL "com.github.actions.name"="Isopod"
LABEL "com.github.actions.description"="Run Isopod commands"
LABEL "com.github.actions.icon"="play-circle"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/geku/ci-evaluation-demo"
LABEL "maintainer"="Georg Kunz <georg.kunz@ricardo.ch>"

ENV KUBE_VERSION v1.12.2

RUN apk add --no-cache bash curl wget git jq vim openssh-client && \
  echo "downloading kubectl..." && \
  wget --quiet -P /usr/local/bin https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl && \
  chmod u+x /usr/local/bin/kubectl && \
  echo "downloading helm..." && \
  wget --quiet -O /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz && \
  tar -xzvf /tmp/helm.tar.gz -C /tmp/ && \
  mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
  chmod u+x /usr/local/bin/helm && \
  rm -rf /tmp/helm.tar.gz /tmp/linux-amd64 && \
  echo "downloading yq..." && \
  wget --quiet -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/2.2.1/yq_linux_amd64 && \
  chmod u+x /usr/local/bin/yq && \
  echo "downloading skaffold..." && \
  wget --quiet -O /usr/local/bin/skaffold https://github.com/GoogleContainerTools/skaffold/releases/download/v0.30.0/skaffold-linux-amd64 && \
  chmod u+x /usr/local/bin/skaffold && \
  mkdir -p /app

COPY known_hosts /root/.ssh/known_hosts
COPY entrypoint.sh /entrypoint.sh
COPY checkout.sh /usr/local/bin/

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
