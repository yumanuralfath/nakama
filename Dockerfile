FROM registry.heroiclabs.com/heroiclabs/nakama:3.37.0

# Copy any custom configuration files if needed # COPY nakama-config.yml /nakama/data/

EXPOSE 7349 7350 7351

ENTRYPOINT ["/bin/sh", "-ecx", "\
/nakama/nakama migrate up --database.address $DATABASE_URL && \
exec /nakama/nakama \
  --name nakama1 \
  --database.address $DATABASE_URL \
  --logger.level INFO \
  --session.token_expiry_sec $SESSION_TOKEN_EXPIRY_SEC \
  --session.refresh_token_expiry_sec $SESSION_REFRESH_TOKEN_EXPIRY_SEC \
  --session.encryption_key $SESSION_ENCRYPTION_KEY \
  --session.refresh_encryption_key $SESSION_REFRESH_ENCRYPTION_KEY \
  --socket.server_key $SOCKET_SERVER_KEY \
  --runtime.http_key $RUNTIME_HTTP_KEY \
  --console.username $CONSOLE_USERNAME \
  --console.password $CONSOLE_PASSWORD \
  --console.signing_key $CONSOLE_SIGNING_KEY \
"]
