```markdown
# Getting Started

Follow these instructions to set up and run the project locally.

## Prerequisites

- **Python 3.8 or higher**: Ensure Python is installed on your system. You can download it from the [official website](https://www.python.org/downloads/).
- **pip**: Python's package installer. It usually comes with Python, but you can verify by running:
  ```bash
  pip --version
  ```
- **Docker**: To run the application in a containerized environment. Install Docker from the [official website](https://www.docker.com/get-started/).

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/hosseinkalanaki/FinalProjectSimulation.git
   cd FinalProjectSimulation
   ```

2. **Create a Virtual Environment** (optional but recommended):
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
   ```

3. **Install Required Packages**:
   ```bash
   pip install -r requirements.txt
   ```

## Running the Application

After installation, you can run the application using:
```bash
python main.py
```

## Docker Setup

To containerize the application using Docker, follow these steps:

### Building the Docker Image

1. **Build the Docker Image**:
   ```bash
   docker build -t finalprojectsimulation:latest .
   ```

   This command builds the Docker image using the provided `Dockerfile`.

### Running the Docker Container

2. **Run the Docker Container**:
   ```bash
   docker run -d -p 8080:8080 finalprojectsimulation:latest
   ```

   This command runs the container in detached mode and maps port 8080 of the container to port 8080 on your host machine.
