# Use a base image with Node.js and other dependencies
FROM node:14-slim

# Set up non-root user
RUN useradd -m vscode

# Change to the non-root user
USER vscode

# Set the work directory
WORKDIR /home/vscode

# Install VSCode Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose port 8080
EXPOSE 8080

# Set the entry point for the container
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
