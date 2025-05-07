#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Ask for Docker Hub username
echo -e "${YELLOW}What's your Docker Hub username?${NC}"
read DOCKER_USERNAME

# Step 2: Ask for Vercel frontend URL
echo -e "${YELLOW}What's your Vercel frontend URL? (e.g., https://your-app.vercel.app)${NC}"
read VERCEL_URL

# Step 3: Build the Docker image
echo -e "${GREEN}Building Docker image...${NC}"
docker build -t $DOCKER_USERNAME/univercity-app:latest -f Dockerfile-local .

# Step 4: Login to Docker Hub
echo -e "${YELLOW}Please login to Docker Hub:${NC}"
docker login

# Step 5: Push the image to Docker Hub
echo -e "${GREEN}Pushing image to Docker Hub...${NC}"
docker push $DOCKER_USERNAME/univercity-app:latest

# Step 6: Create docker-compose file for EC2
echo -e "${GREEN}Creating docker-compose file for EC2...${NC}"
cat > ec2-docker-compose.yml << EOL
version: "3.9"

services:
  springboot-app:
    container_name: univercity-app
    image: $DOCKER_USERNAME/univercity-app:latest
    ports:
      - "80:8088"
    depends_on:
      - postgres
      - redis
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/UniverCity
      SPRING_DATASOURCE_USERNAME: username
      SPRING_DATASOURCE_PASSWORD: password
      SPRING_DATA_REDIS_HOST: redis
      SPRING_DATA_REDIS_PORT: 6379
      ACTIVATION_URL: $VERCEL_URL/activate-account
      CORS_ALLOWED_ORIGINS: $VERCEL_URL
      SERVER_FORWARD-HEADERS-STRATEGY: NATIVE
    networks:
      - spring-demo
    restart: unless-stopped

  postgres:
    container_name: postgres-sql-uc
    image: postgres:17.2
    environment:
      POSTGRES_USER: username
      POSTGRES_PASSWORD: password
      PGDATA: /var/lib/postgresql/data
      POSTGRES_DB: UniverCity
    volumes:
      - postgres:/var/lib/postgresql/data
    expose:
      - "5432"
    networks:
      - spring-demo
    restart: unless-stopped
    command: postgres -c shared_buffers=128MB -c max_connections=20

  redis:
    container_name: redis-cache
    image: redis:7-alpine
    expose:
      - "6379"
    networks:
      - spring-demo
    restart: unless-stopped
    volumes:
      - redis-data:/data
    command: redis-server --maxmemory 128mb --maxmemory-policy allkeys-lru

networks:
  spring-demo:
    driver: bridge

volumes:
  postgres:
    driver: local
  redis-data:
    driver: local
EOL

# Step 7: Create EC2 setup script
echo -e "${GREEN}Creating EC2 setup script...${NC}"
cat > ec2-setup.sh << EOL
#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-\$(uname -s)-\$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add current user to docker group
sudo usermod -aG docker \${USER}

# Create app directory
mkdir -p ~/univercity-app
EOL

echo -e "${GREEN}Files created successfully!${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Set up your EC2 instance"
echo "2. Copy ec2-setup.sh to your EC2 instance and run it"
echo "3. Copy ec2-docker-compose.yml to your EC2 instance as docker-compose.yml"
echo "4. Run 'docker-compose up -d' on your EC2 instance"