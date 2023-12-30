# Use a base image with Node.js installed
FROM node:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if present) to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install


# Copy the entire application code to the working directory
COPY . .

# Expose the port your app runs on (if needed)
# EXPOSE 3000
RUN rm -rf package-lock.json
RUN yarn
RUN yarn install

# Command to start the application
CMD ["npm", "start"]
