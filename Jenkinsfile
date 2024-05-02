node {
    checkout scm
    stage('Build') {
        docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
                sh 'mvn -B -DskipTests clean package'
        }
    }
    stage('Test') {
        try {
                docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
                        sh 'mvn test'
                }
        } catch (e) {
                echo "Test Stage Failed!"
        } finally {
                junit 'target/surefire-reports/*.xml'
        }
    }
    stage('Manual Approval') {
        input message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed'
    }
    stage('Deploy') {
        archiveArtifacts 'target/simple-java-app-1.0-SNAPSHOT.jar'
	    docker.build("simple-java-app:latest");
        sh 'docker run --rm simple-java-app:latest'
        sh 'sleep 1m'
    }
}
