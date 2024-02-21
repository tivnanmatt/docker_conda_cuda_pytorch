# Use the official Miniconda3 image as a base
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Install necessary system packages
RUN apt-get update && apt-get install -y wget git libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

# Install Python and other dependencies with Conda
RUN conda install python=3.10 -y 
RUN conda install matplotlib -y
RUN conda install scipy -y 
RUN conda install ffmpeg -y 
RUN conda install -c nvidia/label/cuda-12.1.1 cuda-toolkit -y 
RUN conda install -c pytorch -c nvidia pytorch torchvision torchaudio pytorch-cuda=12.1 -y

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Specify the command to run on container start
CMD ["conda", "run", "-n", "base", "python", "app.py"]