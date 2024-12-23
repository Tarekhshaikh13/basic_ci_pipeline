# Use the official Python 3.10 slim image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt .

# Install dependencies from the requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . .

# Expose the desired port (replace with the port your application uses)
EXPOSE 8000

# Define the default command to run your app (adjust as needed)
CMD ["python", "app.py"]
