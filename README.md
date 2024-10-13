# Vintage Story Docker Server

This repository contains a Docker setup for running a Vintage Story game server in an easy and flexible way.

## How to Set Up

To set up your Vintage Story server, you have two options: using Docker Compose for an easy setup or manually building the image.

### Option 1: Easy Setup with Docker Compose

1. Clone the repository to your local machine.
2. Ensure Docker and Docker Compose are installed on your system.
3. Set the environment variable `DATA_PATH` to define where the server should save generated data. You can define this in a `.env` file or directly when running the container.
   
   Example `.env` file:
   ```plaintext
   DATA_PATH=/path/to/your/data
   ```

4. Run the server using the provided `docker-compose.yml` file:

   ```bash
   docker-compose up -d
   ```

   Here’s a snippet of the `docker-compose.yml`:

   ```yaml
   services:
     vintagestory_server:
       image: tbh:latest
       environment:
         - DATA_PATH=${DATA_PATH:-./data}
       volumes:
         - ${DATA_PATH}:/var/vintagestory/data
       ports:
         - "42420:42420"
   ```

### Option 2: Manual Setup (Building the Image)

If you prefer to build the image manually, follow these steps:

1. Clone the repository to your local machine.
2. Navigate to the repository folder.
3. Build the Docker image:

   ```bash
   docker build -t tbh .
   ```

4. Run the server using the `docker run` command, setting the `DATA_PATH` environment variable:

   ```bash
   docker run -d -e DATA_PATH=/path/to/your/data -v /path/to/your/data:/var/vintagestory/data -p 42420:42420 tbh
   ```

## Features

- **Simple Setup**: Easily run a Vintage Story server using Docker Compose or Docker commands.
- **Data Persistence**: Server data is saved to a configurable location on your host system.
- **Future Plans**:
  - Remote console access
  - Improved configuration management
  - Automatic backups and more!

## Disclaimer

This is an independent project, and we do not claim ownership of any assets or intellectual property provided by the Vintage Story game developers, Anego Studios SIA. This repository is solely intended to facilitate server hosting for the game.

