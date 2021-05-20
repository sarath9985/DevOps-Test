## terraform actions:

1. create aws eks cluster
2. add instance group to cluster
3. push terraform state to s3


## installtion steps:

   `clone the repo https://github.com/sarath9985/DevOps-Test.git`
   
    update the values in variables.tf, according to the aws account, before you start the creation.

    Upload this folder into github repo and create a jenkins job using the same repo.
    Once you start a build, it will send you a mail for confirming the resource creation.
    if you approved, it will create the cluster, add nodes to cluster and shows the kubeconfig file as output.

    manual creation
    cd eks-cicd

    update the values in variables.tf
    terraform init
    terraform plan
    terraform apply

     

        
 ## Output:
    kubernetes pods logs

    kubectl get no --kubeconfig kubeconfig_devops-test

    NAME                            STATUS   ROLES    AGE   VERSION
    ip-172-31-21-98.ec2.internal    Ready    <none>   22m   v1.20.4-eks-6b7464
    ip-172-31-43-251.ec2.internal   Ready    <none>   22m   v1.20.4-eks-6b7464


