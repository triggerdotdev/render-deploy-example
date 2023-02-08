FROM node:18-bullseye-slim

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install app dependencies
ENV NODE_ENV development
RUN npm install --ignore-scripts --frozen-lockfile

# Copy app source code
COPY . .

# build the app
ENV NODE_ENV production
RUN npm run build

# Start the service
ENTRYPOINT ["pnpm", "run", "start"]
