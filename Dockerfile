FROM ubuntu:latest

WORKDIR /app

COPY . .

RUN chmod +x script.sh

CMD ["./script.sh"]