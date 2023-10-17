FROM golang:1-alpine as build

# Build binary
COPY . /higo
WORKDIR /higo
RUN go build -a -o "/bin/higo" .

# Create application user
RUN adduser -D -u 1000 -g appuser appuser

# Start building the final image
FROM scratch

# Copy binary from build stage
COPY --from=build /bin/higo /bin/higo

# Ensure the application user and group is set
COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /etc/group /etc/group

# Switch to application user
USER appuser

CMD ["/bin/higo"]