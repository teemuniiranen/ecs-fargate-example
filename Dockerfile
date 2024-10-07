# Use an official Python runtime as the base image
FROM --platform=linux/arm64 python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY src/requirements.txt .

# Copy the source code
COPY src/main.py .

# Install any dependencies
RUN pip install -v --no-cache-dir -r requirements.txt

# Specify the command to run on container start
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
