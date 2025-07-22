# K8s Toolbox

A Kubernetes debugging toolbox container based on Ubuntu latest, packed with essential debugging tools for Kubernetes environments.

## Overview

This container provides a comprehensive set of debugging and troubleshooting tools that are commonly needed when working with Kubernetes clusters. It's designed to be lightweight yet feature-complete for most debugging scenarios.

## Included Tools

### Network Tools
- `curl` - Command line tool for transferring data
- `wget` - Network downloader
- `netcat-openbsd` - Network utility for reading/writing network connections
- `dnsutils` - DNS lookup utilities (dig, nslookup)
- `iputils-ping` - Ping utility
- `traceroute` - Network diagnostic tool
- `tcpdump` - Network packet analyzer
- `net-tools` - Network configuration tools (netstat, ifconfig)
- `iproute2` - Advanced IP routing utilities
- `telnet` - Telnet client
- `nmap` - Network discovery and security auditing

### System Tools
- `htop` - Interactive process viewer
- `lsof` - List open files
- `strace` - System call tracer
- `procps` - Process utilities (ps, top, kill)
- `psmisc` - Process utilities (pstree, killall)

### Text Editors & Utilities
- `vim` - Vi improved text editor
- `nano` - Simple text editor
- `jq` - JSON processor
- `tree` - Directory tree viewer

## Usage

### Quick Debug Pod

Run an interactive debug pod that will be automatically removed when you exit:

```bash
kubectl run debug \
  --rm -i -t \
  --image=ghcr.io/mickaelca/k8s-toolbox:latest \
  --restart=Never \
  --command -- bash
```

### Alternative kubectl run

```bash
kubectl run debug-pod --image=ghcr.io/mickaelca/k8s-toolbox:latest --rm -it -- /bin/bash
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
