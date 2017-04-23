FROM alpine:latest
LABEL org.freenas.version="1.6.1"                       \
      org.freenas.interactive="false"                   \
      org.freenas.autostart="true"                      \
      org.freenas.port-mappings="53:53/udp"             \
      org.freenas.expose-ports-at-host="true"           \
      org.freenas.volumes="[                            \
          {                                             \
              \"name\": \"/etc/unbound\", \
              \"descr\": \"Unbound config files\"    \
          }                                             \
      ]"                                                \
      org.freenas.settings="[                           \
          {                                             \
              \"env\": \"NUM_THREADS\",                 \
              \"descr\": \"Number of threads to create, default 1\", \
              \"optional\": true                        \
          },                                            \
              \"env\": \"PUID\",                        \
              \"descr\": \"UserID - Must be readable by 999\", \
              \"optional\": true                        \
          },                                            \
          {                                             \
              \"env\": \"PGID\",                        \
              \"descr\": \"GroupID - Must be readable by 999\", \
              \"optional\": true                        \
          },                                            \
          {                                             \
              \"env\": \"TZ\",                          \
              \"descr\": \"Timezone - eg Europe/London\", \
              \"optional\": true                        \
          }                                             \
      ]"
VOLUME ["/etc/unbound"]
RUN apk add --no-cache unbound && chown -R unbound:unbound /etc/unbound/
COPY unbound.conf /etc/unbound/
EXPOSE 53 53/udp
ENTRYPOINT ["/usr/sbin/unbound", "-dd"]
