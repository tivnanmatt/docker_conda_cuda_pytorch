# Miniconda3 Docker Environment with CUDA and PyTorch

This repository contains a Dockerfile for setting up a containerized environment with Miniconda3, including CUDA Toolkit and PyTorch installed in the base environment. This setup is ideal for running Python applications that leverage PyTorch for deep learning projects, especially those requiring CUDA for GPU acceleration.

## Features

- **Miniconda3**: Lightweight environment for Python applications.
- **CUDA Toolkit**: Pre-installed for GPU acceleration, compatible with NVIDIA hardware.
- **PyTorch**: Comprehensive deep learning library with CUDA support.

## Prerequisites

- Docker installed on your machine.
- NVIDIA GPU drivers and Docker NVIDIA runtime for GPU acceleration (if intending to use CUDA).

## Getting Started

### Building the Docker Image

To build the image from the Dockerfile, navigate to the directory containing the Dockerfile and run:

```bash
docker build -t miniconda3-cuda-pytorch .
```

This command creates a Docker image named `miniconda3-cuda-pytorch` based on the instructions in the Dockerfile.

### Running the Container

Once the image is built, you can start a container with:

```bash
docker run -it --rm -p 80:80 miniconda3-cuda-pytorch
```

This command starts a container where:

- `-it` allows you to interact with the container.
- `--rm` removes the container once it stops running.
- `-p 80:80` maps port 80 of the container to port 80 on the host, making the application accessible via [http://localhost](http://localhost).

### Customization

- **Application Code**: Place your Python application code in the same directory as the Dockerfile or modify the `COPY` command in the Dockerfile to include your application's directory.
- **Dependencies**: Add or remove Python packages by modifying the `RUN conda install` commands.
- **Environment Variables**: Set custom environment variables by adding `ENV` commands in the Dockerfile.

## Usage

After starting the container, it will execute the command specified in the `CMD` directive, running `app.py` with Python. You can replace `app.py` with your own application script by modifying the `CMD` command or overriding it when starting the container.

