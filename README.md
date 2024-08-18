In this project, I am creating a Jenkins Master and agent using Terraform on AWS Cloud services.
I have included the remote statefile, the VPC, and the rest of the networking implementations, so if you 
wanted to test it from scratch, you need to create an S3 for the statefile.
Jenkins master and agent are containerized in Docker, so the agent is not constantly running, and 
only comes on when Master is notified of a change in the GitHub repo then it triggers the agent.
When The master is first deployed, the initial password can be retrieved using the following Docker command:
To get the initial Jenkins password from the Docker container:

docker exec <6462b6491862...> cat /var/jenkins_home/secrets/initialAdminPassword
