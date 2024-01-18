# Use the official Python image from Docker Hub
FROM python:3.10.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the project's requirements.txt file to the container
COPY requirements.txt /app/

# Install the project dependencies
RUN pip install -r requirements.txt

# Install Gunicorn
RUN pip install gunicorn

# Copy the entire project directory to the container
COPY . /app/

# Expose the port that Gunicorn will run on
EXPOSE 8000

# Run the Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]






