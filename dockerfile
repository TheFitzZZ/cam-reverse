# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container to /app
WORKDIR /app

# Clone the specific repository
RUN git clone https://github.com/TheFitzZZ/cam-reverse .

# Install the application dependencies
RUN npm install

# Build the application
RUN npm run build

# Copy the config.xml file into the Docker image
COPY config.yml ./

# Make port 8080 available to the outside world
EXPOSE 5000

# Run the application when the container launches
CMD ["node", "dist/bin.cjs", "http_server", "--config_file", "config.yml"]
