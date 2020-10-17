FROM node:12.19.0-alpine3.11 AS base

WORKDIR /usr/src/app

ENV TZ Australia/Sydney

COPY package.json \
     package-lock.json \
     ./

RUN npm install

COPY tsconfig.json \
     jest.config.js \
     jest.setup.js \
     .eslintrc.js \
     .eslintignore \
     .prettierrc \
     .prettierignore \
     ./
COPY scripts/ scripts/
COPY src/ src/

######################################################################################################
FROM base AS lint

RUN npm run lint

######################################################################################################
FROM base AS unit-test

RUN npm run test --runInBand

######################################################################################################
FROM base AS integration-test

RUN npm run test:integration --runInBand

######################################################################################################
FROM base AS builder

RUN npm run build && \
    npm prune --production

######################################################################################################
FROM node:12.19.0-alpine3.11 AS final

WORKDIR /usr/src/app

COPY package.json .
COPY --from=builder /usr/src/app/node_modules node_modules/
COPY --from=builder /usr/src/app/dist dist/

CMD ["npm", "run", "start"]
