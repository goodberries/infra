docker build -t yashwanthydg/bot-service:v6 .
docker push yashwanthydg/bot-service:v6


docker build -t yashwanthydg/api-gateway:v7 .
docker push yashwanthydg/api-gateway:v7

docker build -t yashwanthydg/feedback-service:v1 .
docker push yashwanthydg/feedback-service:v1

docker build -t yashwanthydg/frontend-service:v4 .
docker push yashwanthydg/frontend-service:v4

curl -X POST http://10.111.201.251:8081/process_query \
-H "Content-Type: application/json" \
-d '{"query": "How do I cancel my order?"}'

curl -X POST http://10.107.64.154:80/chat \
-H "Content-Type: application/json" \
-d '{"query": "How do I cancel my order?"}'

curl -X POST "http://10.107.64.154:80/chat?query=How%20do%20I%20cancel%20my%20order%3F"

curl -X POST "http://34.204.18.67:30007/chat?query=How%20do%20I%20cancel%20my%20order%3F"


kubectl set image deployment/api-gateway result=yashwanthydg/api-gateway:v6