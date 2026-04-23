FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN chmod +x script.sh

EXPOSE 8083
ENV PORT=8083

CMD ["./script.sh"]