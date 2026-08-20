def call(String imageName, String dockerfilePath = '.') {
    echo "Building Docker image: ${imageName} using Dockerfile in ${dockerfilePath}..."
    sh "docker build -t ${imageName} ${dockerfilePath}"
}