# Use an official Node.js runtime as a parent image
FROM node:14-alpine as builder

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files to the container
COPY . .

# Build the app for production
RUN npm run build --prod

# Use an official Nginx runtime as a parent image
FROM nginx:1.21-alpine

# Copy the built app from the previous stage to the container
COPY --from=builder /app/dist/advice-app /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Start the web server
CMD ["nginx", "-g", "daemon off;"]
