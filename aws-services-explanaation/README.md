#How do you backup an EC2 instance

1. Snapshot(lifecycle manager supports auto backups and delete older snapshots)
2. Backup(backup is a service, it supports to take backups of ec2, rds, efs,etc..)


#How do you secure s3 bucket 
1. IAM user/role policies that specify the users/roles that can access specific buckets.
2. bucket policies that define access to specific buckets and objects.
3. Block Public Access as a centralized way to limit public access.
4. Setting access control lists (ACLs) on your buckets and objects.
5. Enable S3 server-side encryption (SSE).

#Why do we make subnets

We've to protect our senstive data information from outside world.
Using subenets, we can isolate our public and private resources and also Ip assigned from subnets.
If we've used private subnets for databases,  we can access only through VPN and Outside people can't access it.


Example:
Let's consider two tier applications architecture.

Loadbalancer is deployed in public subnets and application & db services are deployed in private subnets.

User request comes to r53 > Loadbalancer(PublicSubnet) > application(PrivateSubnet) > DB(PrivateSubnet)