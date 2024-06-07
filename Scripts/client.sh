
# Change to your project directory
cd /nsldev/prince_deployer/

sudo rm -r ./deployment_testing

# Pull latest changes
sudo git clone https://p111222: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@github.com/p111222/deployment_testing.git

# Build the client
cd /nsldev/prince_deployer/deployment_testing/client
sudo npm install
sudo npm run build

# Stop and remove the existing container
docker stop deployment_testing_client
docker rm deployment_testing_client

# Remove existing image
docker rmi deployment_testing_client

# Build Docker image from Dockerfile in current directory
cd /nsldev/prince_deployer/deployment_testing/client
docker build -t deployment_testing_client .

# Run Docker container
docker run -d -p 4001:80 --name deployment_testing_client deployment_testing_client
