FROM nginx AS builder

WORKDIR /app

RUN apt update 

RUN apt install mkdocs -y && \
  apt install  mkdocs-material -y

COPY . .

RUN mkdocs build 

FROM nginx:alpine

#COPY ./site /usr/share/nginx/html

COPY --from=builder /app/site /usr/share/ngnix/html

# EXPOSE  8000

#CMD ["mkdocs", "serve" "--dev-addr=0.0.0.0:8000"]

#COPY package*.json ./

#RUN npm install

#CMD ["xdg-open", "s


