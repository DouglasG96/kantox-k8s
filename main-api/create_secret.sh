kubectl create secret docker-registry regcred \
  --docker-server=docker.io \
  --docker-username=your-dockerhub-username \
  --docker-password=your-dockerhub-password \
  --docker-email=your-dockerhub@email.com \
  -n main-api-prod