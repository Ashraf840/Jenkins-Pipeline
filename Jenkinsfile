pipeline{
    agent any
    stages{
        stage('Setup Python Virtual ENV')
        {
            steps{
                sh '''
                chmod +x envsetup.sh
                ./envsetup.sh
                '''
            }
        }
        stage('Gunicorn Setup')
        {
            steps{
                sh '''
                chmod +x gunicorn.sh
                ./gunicorn.sh
                '''
            }
        }
        stage('Supervisor Setup')
        {
            steps{
                sh '''
                chmod +x supervisor.sh
                ./supervisor.sh
                '''
            }
        }
        stage('NGINX Setup')
        {
            steps{
                sh '''
                chmod +x nginx.sh
                ./nginx.sh
                '''
            }
        }
    }
}