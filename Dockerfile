FROM ubuntu:latest

# Update package list and install basic debug tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    netcat-openbsd \
    dnsutils \
    iputils-ping \
    traceroute \
    tcpdump \
    net-tools \
    iproute2 \
    telnet \
    nmap \
    htop \
    vim \
    jq \
    tree \
    lsof \
    strace \
    procps \
    psmisc \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /root

# Keep container running
CMD ["tail", "-f", "/dev/null"]
