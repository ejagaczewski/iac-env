pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = "AKIAR2MD64656UHZYG7K"
        AWS_SECRET_ACCESS_KEY = "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"
        AWS_DEFAULT_REGION    = "eu-west-1"
        BACKEND_BUCKET        = "jenkins-terraform-pipeline-state"
    }

    parameters {
        choice(
            name: 'Action',
            choices: ['Build', 'Destroy'],
            description: 'The action to take'
        )
        choice(
            name: 'Colour',
            choices: ['Blue', 'Green'],
            description: 'The environment to use'
        )
    }

    stages {
        stage('Init') {
            steps {
                terraformInit()
            }
        }
        stage('Plan') {
            steps {
                terraformPlan()
            }
        }
        stage('Approval') {
            steps {
                input(message: 'Apply Terraform ?')
            }
        }
        stage('Apply') {
            steps {
                terraformApply()
            }
        }
        stage('Validate') {
            steps {
                inspecValidation()
            }
        }
    }
    post {
        always {
            echo 'Deleting Directory!'
            deleteDir()
        }
    }
}

def terraformInit() {
    sh("""
        terraform init
    """)
}

def terraformPlan() {
    // Setting Terraform Destroy flag
    if(params.Action == 'Destroy') {
        env.DESTROY = '-destroy'
    } else {
        env.DESTROY = ""
    }

    sh("""
        cd Terraform/Demo;
        terraform plan ${env.DESTROY} -var-file=${params.Colour.toLowerCase()}.tfvars -no-color -out=tfout
    """)
}

def terraformApply() {
    sh("""
        cd Terraform/Demo;
        terraform apply tfout -no-color
        mkdir ../../Inspec/files/
        terraform output --json > ../../Inspec/files/output.json
    """)
}

def inspecValidation() {
    sh("""
        inspec exec Inspec/ -t aws:// --input workspace=${params.Colour}
    """)
}