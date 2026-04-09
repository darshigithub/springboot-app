pipeline {
    agent any

    tools {
        maven 'Maven'   // Configure this in Jenkins Global Tool Configuration
    }

    environment {
        IMAGE_NAME = "springboot-app"
        CONTAINER_NAME = "springboot-container"
        PORT = "8081"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "Cloning source code..."
                git 'https://github.com/darshigithub/springboot-app.git'
            }
        }

        stage('Build Application') {
            steps {
                echo "Building Spring Boot application..."
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running tests..."
                bat 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                bat 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo "Stopping old container if exists..."
                bat 'docker rm -f $CONTAINER_NAME || true'
            }
        }

        stage('Run New Container') {
            steps {
                echo "Starting new container..."
                bat 'docker run -d -p $PORT:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed. Check logs!"
        }
    }
}