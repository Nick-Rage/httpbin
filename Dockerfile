FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "httpbin:app"]

