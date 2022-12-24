#!/bin/bash
echo "Criando as imagens..."

docker build -t pjls2/projeto-backend:1.0 backend/.
docker build -t pjls2/projeto-database:1.0 database/.

echo "fazendo push das imagens"

docker push pjls2/projeto-backend:1.0
docker push pjls2/projeto-database:1.0

echo "criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "realizando deployment..."
kubectl apply -f ./deployment.yml