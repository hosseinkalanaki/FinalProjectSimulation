# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements (if any) and project files to the container
COPY . .

# Install dependencies (schedule is the only external dependency)
RUN pip install --no-cache-dir schedule

# Expose the TCP server port
EXPOSE 80

# Run the Python script when the container launches
CMD ["python", "main.py"]
