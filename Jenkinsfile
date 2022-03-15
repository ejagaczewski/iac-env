podTemplate(containers: [
    containerTemplate(name: 'ubuntu', image: 'ubuntu:latest', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        stage('Get Terraform') {
            container('ubuntu') {
                stage('Get terraform') {
                    sh '''
                    apt-get update && apt-get install -y gnupg software-properties-common curl
                    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
                    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                    apt-get update && apt-get install terraform
                    terraform --version
                    ls
                    '''
                stage('Pull IaC Template') {
                    sh '''
                    git clone https://github.com/ejagaczewski/iac-env.git
                    '''
                    }
                stage('Terraform init') {
                    sh '''
                    terraform init
                    '''
                }
                }
            }
        }
    }
}