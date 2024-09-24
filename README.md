<div align="center">
<img 
  src="dockerfy.webp"
  alt="Dockerfy" 
  width="400"/>
</div>
<div align="center"><h2>DOCKERFY</h2></div>
<br>

# FIRST STEP
### Create a .env file with environment variables
```bash
  cp .env.example .env
```

# SECOND STEP
### Run the command below to create and startup the container(s)
```bash
  docker compose up -d
```

# CONGRATULATIONS 🎉

<hr>
<br>

# TRICKS & TIPES 🎩
### To run a command inside the container, use the command below
```bash
  docker compose exec <container_name> <command>
```

### To access the container's shell, use the command below
```bash
  docker compose exec <container_name> sh
```

### To stop the container(s), use the command below
```bash
  docker compose down
```

# Docker Control Script 🐳

## Overview

This script allows you to manage Docker containers easily. You can start containers with specified options or stop them with a simple command.

## Usage

### Running the Script

You can run the script with the following commands:

```bash
./script.sh [on|off] [-c=<comma-separated values>]

```

### Arguments

  - `on`: Starts the specified Docker containers.
  - `off`: Stops all running Docker containers.
  - `-c=<comma-separated values>`: Specifies which containers to start. If this flag is not provided, default containers will be used.
  

### Default Containers

If you run the script with on without the -c flag, the following containers will be started by default:

  - `nginx`
  - `mysql`
  - `php-fpm`
  - `php-worker`
  - `portainer`
  - `proxy`
  - `workspace`

### Example Commands

<ol>
  <li><strong>Start default containers:</strong></li>

  ```bash
    ./script.sh on
  ```
  
  <li><strong>Start specified containers:</strong></li>
  
  ```bash
    ./script.sh on -c=nginx,php
  ```

  <li><strong>Stop all containers:</strong></li>

  ```bash
    ./script.sh off -c=nginx,php
  ```
</ol>


### Requirements

  - Docker
  - Docker Compose

### Notes

- Ensure that your `docker-compose.yml` file is properly configured to support the containers you want to start.
  
- The script uses `eval` to execute the generated Docker command, so please be cautious with the input values.
    
- Try using an alias to make it easier to run the script in any directory. 😉
