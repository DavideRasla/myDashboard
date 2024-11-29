FROM dart:stable AS build

WORKDIR /app

COPY pubspec.yaml . 
RUN dart pub get

RUN mkdir -p /app/web /app/lib

COPY web /app/web
COPY lib /app/lib

RUN dart compile js --verbose -o /app/web/main.dart.js lib/main.dart 

FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
