# mac an-error-failed-to-solve-with-frontend-dockerfile-v0
# https://stackoverflow.com/questions/64221861/an-error-failed-to-solve-with-frontend-dockerfile-v0
# solution: Don't use buildkit and it works for me.
# export DOCKER_BUILDKIT=0
# export COMPOSE_DOCKER_CLI_BUILD=0

FROM node:16-alpine
RUN mkdir -p /usr/app
WORKDIR /usr/app
COPY . .
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
RUN npm run build
ENV PORT 3000
EXPOSE $PORT
CMD npm run start -- -p $PORT