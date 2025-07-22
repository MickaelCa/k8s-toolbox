FROM archlinux:latest

# Update package list and install basic debug tools
RUN pacman -Sy --noconfirm \
    base-devel \
    bind-tools \
    curl \
    fzf \
    git \
    htop \
    inetutils \
    iproute2 \
    iputils \
    jq \
    lsof \
    net-tools \
    nmap \
    openbsd-netcat \
    procps-ng \
    psmisc \
    strace \
    tcpdump \
    traceroute \
    tree \
    vim \
    wget \
    zsh

# Create a non-root user for building AUR packages
RUN useradd -m -G wheel -s /bin/bash builduser && \
    echo 'builduser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Install yay AUR helper
USER builduser
WORKDIR /home/builduser
RUN git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay

# Install oh-my-zsh from AUR
RUN yay -S --noconfirm oh-my-zsh-git

# Switch back to root user
USER root
WORKDIR /root

# Change default shell to zsh for root user
RUN chsh -s /bin/zsh root

# Copy configuration files
COPY container-files/ /

# Set working directory
WORKDIR /root

# Keep container running
CMD ["tail", "-f", "/dev/null"]
