# Версия образа python
ARG DOCKERVERSION=3.11-slim

FROM python:$DOCKERVERSION

# Автор образа
MAINTAINER Mr. Artem Parhomenko

# Условная верисия контейнера
LABEL version="1.0"

# Рабочия директория внутри контейнера
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt .

# Установка библиотек
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения в контейнер
COPY app.py .

# Открываем прабочий порт
EXPOSE 8080

# Команда запуска сервера
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
