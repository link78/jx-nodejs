FROM node:alpine
ENV PORT 8000
EXPOSE 8000
WORKDIR /usr/src/app
COPY . .
CMD ["npm", "start"]
