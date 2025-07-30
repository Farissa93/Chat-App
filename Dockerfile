FROM python:3.12-slim
WORKDIR /app

# Install system dependencies required for PyPI packages that require compilation
# Install system dependencies required for PyPI packages that require compilation
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    python3-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . /app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable to specify the port number
ENV PORT=8000

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]