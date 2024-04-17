# Use an official Node.js runtime as the base image
FROM node:14-alpine as build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Use nginx as the base image for serving the React app
FROM nginx:alpine

# Copy the built React app from the build stage to the nginx public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
