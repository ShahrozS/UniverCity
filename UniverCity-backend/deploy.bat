@echo off
echo What's your Docker Hub username?
set /p DOCKER_USERNAME=

echo What's your Vercel frontend URL? (e.g., https://your-app.vercel.app)
set /p VERCEL_URL=

echo Building Docker image...
docker build -t %DOCKER_USERNAME%/univercity-app:latest -f Dockerfile-local .

echo Please login to Docker Hub:
docker login

echo Pushing image to Docker Hub...
docker push %DOCKER_USERNAME%/univercity-app:latest

echo Creating docker-compose file for EC2...
(
echo version: "3.9"
echo.
echo services:
echo   springboot-app:
echo     container_name: univercity-app
echo     image: %DOCKER_USERNAME%/univercity-app:latest
echo     ports:
echo       - "80:8088"
echo     depends_on:
echo       - postgres
echo       - redis
echo     environment:
echo       SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/UniverCity
echo       SPRING_DATASOURCE_USERNAME: username
echo       SPRING_DATASOURCE_PASSWORD: password
echo       SPRING_DATA_REDIS_HOST: redis
echo       SPRING_DATA_REDIS_PORT: 6379
echo       ACTIVATION_URL: %VERCEL_URL%/activate-account
echo       CORS_ALLOWED_ORIGINS: %VERCEL_URL%
echo       SERVER_FORWARD-HEADERS-STRATEGY: NATIVE
echo     networks:
echo       - spring-demo
echo     restart: unless-stopped
echo.
echo   postgres:
echo     container_name: postgres-sql-uc
echo     image: postgres:17.2
echo     environment:
echo       POSTGRES_USER: username
echo       POSTGRES_PASSWORD: password
echo       PGDATA: /var/lib/postgresql/data
echo       POSTGRES_DB: UniverCity
echo     volumes:
echo       - postgres:/var/lib/postgresql/data
echo     expose:
echo       - "5432"
echo     networks:
echo       - spring-demo
echo     restart: unless-stopped
echo     command: postgres -c shared_buffers=128MB -c max_connections=20
echo.
echo   redis:
echo     container_name: redis-cache
echo     image: redis:7-alpine
echo     expose:
echo       - "6379"
echo     networks:
echo       - spring-demo
echo     restart: unless-stopped
echo     volumes:
echo       - redis-data:/data
echo     command: redis-server --maxmemory 128mb --maxmemory-policy allkeys-lru
echo.
echo networks:
echo   spring-demo:
echo     driver: bridge
echo.
echo volumes:
echo   postgres:
echo     driver: local
echo   redis-data:
echo     driver: local
) > ec2-docker-compose.yml

echo Creating EC2 setup script...
(
echo #!/bin/bash
echo.
echo # Update system
echo sudo apt update ^&^& sudo apt upgrade -y
echo.
echo # Install Docker
echo sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
echo curl -fsSL https://download.docker.com/linux/ubuntu/gpg ^| sudo apt-key add -
echo sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable"
echo sudo apt update
echo sudo apt install -y docker-ce
echo.
echo # Install Docker Compose
echo sudo curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-\$(uname -s)-\$(uname -m)" -o /usr/local/bin/docker-compose
echo sudo chmod +x /usr/local/bin/docker-compose
echo.
echo # Add current user to docker group
echo sudo usermod -aG docker \${USER}
echo.
echo # Create app directory
echo mkdir -p ~/univercity-app
) > ec2-setup.sh

echo Files created successfully!
echo Next steps:
echo 1. Set up your EC2 instance
echo 2. Copy ec2-setup.sh to your EC2 instance and run it
echo 3. Copy ec2-docker-compose.yml to your EC2 instance as docker-compose.yml
echo 4. Run 'docker-compose up -d' on your EC2 instance

pause