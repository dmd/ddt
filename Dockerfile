FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir gunicorn

COPY . .

RUN mkdir -p data

EXPOSE 5050

CMD ["gunicorn", "--config", "gunicorn.conf.py", "ddt_web:app"]