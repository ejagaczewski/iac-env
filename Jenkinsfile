podTemplate(containers: [
    containerTemplate(name: 'ubuntu', image: 'ubuntu:latest', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        echo "${env.getEnvironment()}"
        stage('Get Terraform') {
            container('ubuntu') {
                stage('Get terraform') {
                    sh '''
                    apt-get update && apt-get -y install -y gnupg software-properties-common curl
                    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
                    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                    apt-get update && apt-get -y install terraform git
                    ls
                    '''
                stage('Pull IaC Template') {
                    sh '''
                    git clone https://github.com/ejagaczewski/iac-env.git
                    '''
                    }
                stage('Terraform Plan & Scan with wiz') {
                    sh '''
                    cd iac-env
                    terraform init
                    terraform plan -out
                    curl -o wizcli https://wizcli.test.wiz.io/wizcli
                    chmod +x wizcli
                    WIZ_ENV=test ./wizcli auth --id $WIZ_ID --secret $WIZ_SECRET
                    wizcli iac scan --path plan.tfplanjson
                    '''
                    }
                stage('Terraform init') {
                    sh '''
                    cd iac-env
                    terraform apply -auto-approve
                    '''
                }

                }
            }
        }
    }
}