pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git credentialsId: 'minhthong_git3', url: 'https://github.com/minhthong7602/nestjs-clean-architecture.git'
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t minhthongbkhn1994/nestjs-blog:v1 .'
        withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
          sh 'docker push minhthongbkhn1994/nestjs-blog:v1'
        }
        
        sh 'docker image rm minhthongbkhn1994/nestjs-blog:v1'
      }
    }
    stage('SSH Server') {
      steps {
        sshagent(['ssh-remote']) {
          // some block
          sh 'docker ps -aq --filter="name=nestjs-blog" | grep -q . && docker stop nestjs-blog && docker rm nestjs-blog && docker run -d --name "nestjs-blog" -p 5000:5000 minhthongbkhn1994/nestjs-blog:v1 || docker run -d --name "nestjs-blog" -p 5000:5000 minhthongbkhn1994/nestjs-blog:v1'
        } 
      }
    }
  }
}