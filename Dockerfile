FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/trust.template

ARG PORT=8080
ARG WORK_CONNS=1024
ARG ORDER_PORT=8082
ARG CARD_PORT=8081

ENV PORT=${PORT}
ENV WORK_CONNS=${WORK_CONNS}
ENV ORDER_PORT=${ORDER_PORT}
ENV CARD_PORT=${CARD_PORT}

EXPOSE ${PORT}
RUN envsubst < /etc/nginx/conf.d/trust.template > /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
