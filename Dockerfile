FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependencies file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose port 80
EXPOSE 80

# Start the server using gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:80", "httpbin:app"]
