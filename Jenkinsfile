pipeline {

  agent none

  stages {
    stage('Clone') {
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
        sh 'npm run test'
      }
      // steps {
      //   sh 'docker ps -aq --filter="name=node-js" | grep -q . && docker stop node-js && docker rm node-js || echo "not exist container nodejs"'
      //   sh 'docker run --name node-js -v /home/minhthong/Data/Study/Jenkin/Data/workspace/React_Native_Demo@2:/nestjs-app node:12.18.1 /bin/sh -c "cd nestjs-app && npm install && npm run test"'
      //   sh 'docker rm node-js'
      // }
    }
    // stage('Build') {
    //   steps {
    //     sh 'docker build -t minhthongbkhn1994/nestjs-blog:v1 .'
    //     withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
    //       sh 'docker push minhthongbkhn1994/nestjs-blog:v1'
    //     }
        
    //     sh 'docker image rm minhthongbkhn1994/nestjs-blog:v1'
    //   }
    // }
    // stage('SSH Server') {
    //   steps {
    //     sshagent(['ssh-remote']) {
    //       // some block
    //       sh 'docker ps -aq --filter="name=nestjs-blog" | grep -q . && docker stop nestjs-blog && docker rm nestjs-blog && docker run -d --name "nestjs-blog" -p 5000:5000 minhthongbkhn1994/nestjs-blog:v1 || docker run -d --name "nestjs-blog" -p 5000:5000 minhthongbkhn1994/nestjs-blog:v1'
    //     } 
    //   }
    // }
  }
}