FROM dart:stable AS build

WORKDIR /app

COPY pubspec.yaml .

RUN dart pub get

COPY lib lib/
COPY web web/

RUN dart compile js -o build/web/main.dart.js lib/main.dart

FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
