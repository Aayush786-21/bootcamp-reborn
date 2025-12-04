# Principles of Linux

## Core Ideas
### Everything Is a File
Most components of the system (devices, settings, processes) are represented as files, which makes interaction consistent and script-friendly.

### Small Tools, Big Results
Linux programs generally focus on one job. These tools can be linked together to handle more complicated tasks.

### Chaining Commands
Using pipes and redirection, simple utilities combine to form powerful workflows.

### Minimal UI Assumptions
Most tools are meant to work from the terminal instead of relying on bloated graphical interfaces.

### Text-Based Configuration
Nearly all configuration lives in plain text. Example: `/etc/passwd` stores account details.

---

## Main Components of a Linux System

### Bootloader
Runs first and kicks off the OS startup sequence.

### Kernel
The central component that controls CPU, memory, devices and mediates every process.

### Daemons
Background services that start automatically or run when needed.

### Shell
A command-line interface that lets users talk to the OS. Common shells include Bash, Zsh, Tcsh and similar variants.

### Graphics Server
Provides the graphical layer (X or X-Server), enabling GUI applications locally or remotely.

### Window Manager / Desktop Environment
Controls how windows look and behave. Popular choices: GNOME, KDE, MATE, Cinnamon and Unity.

### Utilities
Programs that perform dedicated tasks, from managing files to handling networks.

---

## Linux Architecture

### Hardware
Includes CPU, RAM, storage devices and peripherals.

### Kernel Layer
The kernel abstracts raw hardware, isolates processes and assigns resources virtually to keep systems stable.

### Shell Layer
A text interface where commands trigger kernel functions.

### System Utilities Layer
Tools and applications that allow users to access system features.

---

## Filesystem Hierarchy (FHS)

| Path | Purpose | Examples |
|------|---------|----------|
| `/` | Root of the entire system | Everything starts here |
| `/bin` | Essential user commands | ls, cp, mv |
| `/boot` | Kernel and bootloader data | vmlinuz, initrd |
| `/dev` | Device files | /dev/sda1, /dev/null |
| `/etc` | Systemwide configuration | /etc/passwd, /etc/ssh/sshd_config |
| `/home` | Home folders for each user | /home/aayush |
| `/lib` | Core shared libraries | libc.so |
| `/media` | Auto-mounted external devices | USB drives |
| `/mnt` | Temporary mount points | Custom mounts |
| `/opt` | Third-party packages | Optional tools |
| `/root` | Root user’s home directory | /root |
| `/sbin` | System admin binaries | iptables, reboot |
| `/tmp` | Temporary files | Deleted on reboot |
| `/usr` | User utilities, docs, icons | /usr/bin/vim |
| `/var` | Logs, mail, application data | /var/log |

---

## Bash Prompt Basics

The prompt shows user info, hostname and current directory. It’s fully configurable.

`PS1` defines how the prompt appears. You can add colors, timestamps, system details or IP information.

Tools like `script` and review of `.bash_history` help track previous commands.

### Prompt Escape Sequences
| Code | Meaning |
|------|---------|
| `\u` | Username |
| `\h` | Hostname |
| `\H` | Full hostname |
| `\w` | Current working directory |
| `\d` | Date |
| `\D{}` | Custom date format |
| `\t` | Time (24hr) |
| `\T` | Time (12hr) |
| `\@` | Time with AM/PM |
| `\j` | Number of background jobs |
| `\n` | New line |

---

## Getting Help

### man pages
man <command>


### Built-in help


<command> --help
<command> -h


### Search by keyword


apropos <keyword>


---

## System Information Commands

| Command | What it shows |
|---------|----------------|
| `whoami` | Current user |
| `id` | UID, GID and groups |
| `hostname` | System hostname |
| `uname` | Kernel/system details |
| `pwd` | Current directory |
| `ifconfig` | Network interface info |
| `ip` | Routes, interfaces, and tunnels |
| `netstat` | Network connections |
| `ss` | Socket inspection |
| `ps` | Process list |
| `who` | Logged-in users |
| `env` | Environment variables |
| `lsblk` | Block devices |
| `lsusb` | USB devices |
| `lsof` | Open files |
| `lspci` | PCI devices |

