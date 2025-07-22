# K8s Toolbox

A Kubernetes debugging toolbox container based on Arch Linux, packed with essential debugging tools and development utilities for Kubernetes environments.

## Overview

This container provides a comprehensive set of debugging, troubleshooting, and development tools that are commonly needed when working with Kubernetes clusters. It features a modern shell environment with zsh and oh-my-zsh, along with the ability to install additional packages from the Arch User Repository (AUR).

## Features

- **Base OS**: Arch Linux (rolling release)
- **Shell**: Zsh with oh-my-zsh and agnoster theme
- **Package Management**: Pacman + yay AUR helper
- **Interactive Tools**: fzf for fuzzy finding
- **Development Ready**: Includes build tools and git

## Included Tools

### Network Tools
- `curl` - Command line tool for transferring data
- `wget` - Network downloader
- `openbsd-netcat` - Network utility for reading/writing network connections
- `bind-tools` - DNS lookup utilities (dig, nslookup)
- `iputils` - Ping and other IP utilities
- `traceroute` - Network diagnostic tool
- `tcpdump` - Network packet analyzer
- `net-tools` - Network configuration tools (netstat, ifconfig)
- `iproute2` - Advanced IP routing utilities
- `inetutils` - Network utilities including telnet
- `nmap` - Network discovery and security auditing

### System Tools
- `htop` - Interactive process viewer
- `lsof` - List open files
- `strace` - System call tracer
- `procps-ng` - Process utilities (ps, top, kill)
- `psmisc` - Process utilities (pstree, killall)

### Development & Text Tools
- `vim` - Vi improved text editor
- `git` - Version control system
- `base-devel` - Essential development tools (gcc, make, etc.)
- `yay` - AUR helper for installing additional packages
- `jq` - JSON processor
- `tree` - Directory tree viewer
- `fzf` - Fuzzy finder for command line

### Kubernetes Tools
- `kubectl` - Kubernetes command-line tool for cluster management

## Shell Environment

The container comes pre-configured with a modern shell environment:

- **Zsh** as the default shell with **oh-my-zsh** framework
- **Agnoster theme** for a clean, informative prompt
- **Git plugin** enabled for enhanced git integration
- **fzf integration** for fuzzy finding in command history and files
- **yay AUR helper** for installing additional Arch packages on-the-fly

### Installing Additional Packages

Since this container includes the yay AUR helper, you can install additional packages as needed:

```bash
# Install packages from official repositories
pacman -S package-name

# Install packages from AUR
yay -S aur-package-name
```

## Usage

### Quick Debug Pod

Run an interactive debug pod that will be automatically removed when you exit:

```bash
kubectl run debug \
  --rm -i -t \
  --image=ghcr.io/mickaelca/k8s-toolbox:latest \
  --restart=Never \
  --command -- zsh
```

### Alternative kubectl run

```bash
kubectl run debug-pod --image=ghcr.io/mickaelca/k8s-toolbox:latest --rm -it -- /bin/zsh
```

### Kubernetes Deployment

For a persistent debug pod, you can use this YAML:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug-container
spec:
  containers:
  - name: debug
    image: ghcr.io/mickaelca/k8s-toolbox:latest
    command: ["tail", "-f", "/dev/null"]
```

## Container Registry

The image is available at: `ghcr.io/mickaelca/k8s-toolbox:latest`

- `latest` tag corresponds to the main branch
- The container is automatically built and pushed to GitHub Container Registry when changes are pushed to the main branch
- No versioning is used - latest is always the most recent build from main

## License

This project is open source and available under standard terms.
