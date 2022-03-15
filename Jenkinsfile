podTemplate(containers: [
    containerTemplate(name: 'ubuntu', image: 'ubuntu:latest', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        stage('Get Terraform') {
            container('ubuntu') {
                stage('Get terraform') {
                    sh '''
                    apt-get install terraform
                    terraform --version
                    '''
                }
            }
        }
    }
}