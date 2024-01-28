# Use an official Ubuntu runtime as a base image
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /app

# Copy the sourcecode file into the container at /app
COPY code_model_training /app/code_model_training
COPY data /app/data
COPY model /app/model
COPY ms /app/ms
COPY app.py /app
COPY requirements.txt /app


# Setup Python env
# Create a virtual environment and activate it and install required dependencies
# python3 should be preinstalled in ubuntu base image
RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-venv
RUN python3 -m venv glenv
RUN /bin/bash -c "source glenv/bin/activate"
RUN pip install --no-cache-dir -r requirements.txt


# Specify the command to run on container start
CMD ["python3", "app.py"]