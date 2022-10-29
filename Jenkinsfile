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
                chmod +x gunicorn_start.sh
                ./gunicorn_start.sh
                '''
            }
        }
        stage('Supervisor Setup')
        {
            steps{
                sh '''
                chmod +x supervisors.sh
                ./supervisor.sh
                '''
            }
        }
    }
}