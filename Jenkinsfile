pipeline{
    agent any
    stages{
        stage('Setup Pyhton Virtual ENV')
        {
            sh '''
            chmod +x envsetup.sh
            ./envsetup.sh
            '''
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
        stage('Setup NGINX')
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