podTemplate(containers: [
    containerTemplate(name: 'ubuntu', image: 'ubuntu:latest', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        stage('Get Terraform') {
            container('ubuntu') {
                stage('Get terraform') {
                    sh '''
                    apt-get update && sudo apt-get install -y gnupg software-properties-common curl
                    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
                    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                    sudo apt-get update && sudo apt-get install terraform
                    terraform --version
                    '''
                }
            }
        }
    }
}