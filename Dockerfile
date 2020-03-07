# use different image for Build/Run phrase

# build phrase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build

# /app/build: all the staff
# run phrase
FROM nginx
# for aws, map incoming traffic directly
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
