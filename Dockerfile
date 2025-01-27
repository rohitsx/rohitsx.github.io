# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Set environment variables
ENV FLASK_ENV=development
ENV FLASK_APP=server

# Expose the port your Flask app runs on
EXPOSE 5000

# Command to run the Flask app
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "server:app"]
