pipeline {

  agent none

  stages {
    stage('Clone') {
      agent { node { label 'master' } }
      steps {
        git credentialsId: 'minhthong_git3', url: 'https://github.com/minhthong7602/nestjs-clean-architecture.git'
      }
    }
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
      steps {
        // sh 'docker build -t minhthongbkhn1994/nestjs-blog:v1 .'
        // withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
        //   sh 'docker push minhthongbkhn1994/nestjs-blog:v1'
        // }
        
        // sh 'docker image rm minhthongbkhn1994/nestjs-blog:v1'
        echo 'Pulling brach...' + GIT_BRANCH
      }
    }
    stage('Run') {
      agent { node { label 'master' } }
      steps {
        // sshagent(['ssh-remote']) {
        //   // some block
        //   sh 'docker ps -aq --filter="name=nestjs-blog" | grep -q . && docker stop nestjs-blog && docker rm nestjs-blog || echo "not exist container nestjs-blog"'
        //   sh 'docker run -d --name "nestjs-blog" -p 5000:5000 minhthongbkhn1994/nestjs-blog:v1'
        // } 
      }
    }
  }
}