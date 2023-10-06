FROM debian

ARG KUBERNETES_VERSION

USER root

ADD flux-tf-state-unlocker /usr/bin 
RUN apt-get update && apt-get -y upgrade && apt install -y apt-transport-https ca-certificates curl gpg jq unzip && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/${KUBERNETES_VERSION}/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${KUBERNETES_VERSION}/deb/ /" > /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && apt-get install -y kubectl && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    chmod 755 /usr/bin/flux-tf-state-unlocker && \
    groupadd -g 1000 runtime && useradd -g 1000 -u 1000 -m runtime

USER 1000

ENTRYPOINT ["/usr/bin/flux-tf-state-unlocker"]
