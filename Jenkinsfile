pipeline {
    agent any

    tools {
        maven 'Maven'
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
                bat "docker build -t ${env.IMAGE_NAME} ."
            }
        }

        stage('Stop Old Container') {
            steps {
                echo "Stopping old container if exists..."
                bat "docker rm -f ${env.CONTAINER_NAME} || exit 0"
            }
        }

        stage('Run New Container') {
            steps {
                echo "Starting new container..."
                bat "docker run -d -p ${env.PORT}:8080 --name ${env.CONTAINER_NAME} ${env.IMAGE_NAME}"
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