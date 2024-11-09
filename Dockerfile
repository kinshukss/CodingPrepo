# Use a lightweight Node.js image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Install serve to serve the production build
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Command to serve the built application
CMD ["serve", "-s", "build", "-l", "3000"]
