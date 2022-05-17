# DOCKER COMMANDS
##Create a Docker image
Build the Docker Image
```sh
docker build -t hello-world .
# Comment
```

Verify Docker Image
```shell
docker images --filter reference=hello-world
```

Run the Docker Image
```shell
docker run -t -i -p 80:80 hello-world
```
##Push image to Amazon ECR
Create ECR Repository
```shell
aws ecr create-repository --repository-name hello-repository --region region
```

Tag Image
```shell
docker tag hello-world <aws_account_id>.dkr.ecr.<region>.amazonaws.com/<hello-repository>
```
Build Docker Image
```shell
docker build -t hello-world . | gocopy
```
Login to ECR registry
```shell
aws ecr get-login-password | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
```
Push the Image to ECR
```sh
docker push aws_account_id.dkr.ecr.region.amazonaws.com/hello-repository
```

##Clean up
Delete ECR repository
aws ecr delete-repository --repository-name hello-repository --region region --force