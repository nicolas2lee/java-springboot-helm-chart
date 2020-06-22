# Helm 
## Create secret key 
Create secret key in kubernetes to store password 

DB_PASSWORD=password


echo -n 'password' > ./password.txt


kubectl create secret generic laravel-nginx-secret --from-file=./password.txt



