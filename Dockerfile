FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /httpbin

# Install pipenv
RUN pip install pipenv

# Copy project files
COPY . /httpbin/

# Install dependencies from Pipfile
RUN pipenv install --deploy --ignore-pipfile

# Expose port
EXPOSE 80

# Run HTTPBin using gunicorn through pipenv
CMD ["pipenv", "run", "gunicorn", "-b", "0.0.0.0:80", "httpbin:app"]
