# Step 1: Builder
FROM node:alpine AS builder
WORKDIR '/usr/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Step 2: Despliegue (run)
FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html


