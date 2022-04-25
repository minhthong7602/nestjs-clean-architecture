pipeline {

  agent none

  stages {
    // stage('Clone') {
    //   agent { node { label 'master' } }
    //   steps {
    //     git credentialsId: 'minhthong_git3', url: 'https://github.com/minhthong7602/nestjs-clean-architecture.git'
    //   }
    // }
    stage('Test') {
      agent {
        docker {
          image 'node:12.18.1'
          args '-u 0:0 -v /tmp:/root/.cache'
        }
      }
      
      steps {
        sh 'npm install'
        sh 'npm run test:cov'
      }
    }
    stage('Build') {
      agent { node { label 'master' } }
      environment {
        DOCKER_TAG="${GIT_BRANCH == 'origin/development' ? 'dev' : 'latest'}"
      }
      steps {
        script {
          if(GIT_BRANCH == "origin/development" || GIT_BRANCH == "origin/master") {
            sh "docker build -t minhthongbkhn1994/nestjs-blog:${DOCKER_TAG} ."
            withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
              sh "docker push minhthongbkhn1994/nestjs-blog:${DOCKER_TAG}"
            }
            sh "docker image rm minhthongbkhn1994/nestjs-blog:${DOCKER_TAG}"
          }
        }
        echo 'Pulling brach...' + GIT_BRANCH
        echo 'Docker tag...' + DOCKER_TAG
      }
    }
    stage('Run') {
      agent { node { label 'master' } }
      steps {
        sshagent(['ssh-remote']) {
          // some block
          script {
            if(GIT_BRANCH == "origin/development" || GIT_BRANCH == "origin/master") {
              if(GIT_BRANCH == "origin/development") {
                sh 'docker ps -aq --filter="name=nestjs-blog-dev" | grep -q . && docker stop nestjs-blog-dev && docker rm nestjs-blog-dev || echo "not exist container nestjs-blog-dev"'
                sh 'docker run -d --name "nestjs-blog-dev" -p 5000:5000 minhthongbkhn1994/nestjs-blog:dev'
              } else {
                sh 'docker ps -aq --filter="name=nestjs-blog-prod" | grep -q . && docker stop nestjs-blog-prod && docker rm nestjs-blog-prod || echo "not exist container nestjs-blog-prod"'
                sh 'docker run -d --name "nestjs-blog-prod" -p 3000:3000 minhthongbkhn1994/nestjs-blog:latest'
              }
            }
          }
        }
      }
    }
  }
}