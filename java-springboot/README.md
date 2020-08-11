# Helm 
## Create secret key 
Create secret key in kubernetes to store password 

DB_PASSWORD=password


echo -n 'password' > ./password.txt


kubectl create secret generic laravel-nginx-secret --from-file=./password.txt



## load generator
kubectl run -it --rm load-generator --image=busybox /bin/sh

Hit enter for command prompt

while true; do wget -q -O- http://<api-uri>; done