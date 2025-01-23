Getting Started
Follow these instructions to set up and run the project locally.

Prerequisites
Python 3.8 or higher: Ensure Python is installed on your system. You can download it from the official website.

pip: Python's package installer. It usually comes with Python, but you can verify by running:

bash
Copy
Edit
pip --version
Docker: To run the application in a containerized environment. Install Docker from the official website.

Installation
Clone the Repository:

bash
Copy
Edit
git clone https://github.com/hosseinkalanaki/FinalProjectSimulation.git
cd FinalProjectSimulation
Create a Virtual Environment (optional but recommended):

bash
Copy
Edit
python3 -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
Install Required Packages:

bash
Copy
Edit
pip install -r requirements.txt
Running the Application
After installation, you can run the application using:

bash
Copy
Edit
python main.py
Docker Setup
To containerize the application using Docker, follow these steps:

Building the Docker Image
Build the Docker Image:

bash
Copy
Edit
docker build -t finalprojectsimulation:latest .
This command builds the Docker image using the provided Dockerfile.

Running the Docker Container
Run the Docker Container:

bash
Copy
Edit
docker run -d -p 8080:8080 finalprojectsimulation:latest
This command runs the container in detached mode and maps port 8080 of the container to port 8080 on your host machine.