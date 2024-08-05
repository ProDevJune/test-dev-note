# 빌드 단계
FROM node:18 AS build-stage
WORKDIR /app
COPY package.json yarn.lock ./
RUN if ! command -v yarn >/dev/null 2>&1; then npm install -g yarn; fi
RUN yarn install
COPY . .

# 환경 변수 설정
ARG VITE_API_URL
ENV VITE_API_URL=${VITE_API_URL}

RUN echo "Building with VITE_API_URL=${VITE_API_URL}"
RUN yarn build-only
RUN ls -la /app/dist

# 결과물만 포함하는 경량 이미지
FROM nginx:alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
