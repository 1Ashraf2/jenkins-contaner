In this project I am creating a Jenkins Master and agent using Terraform on AWS Cloud services.
Jenkins master and agent are containerized in Docker, so the agent is not constantly running, and 
only comes on Master is notified of a change in the GitHub repo and triggers the agent.
When The master is first deployed, the initial password can be retrieved using the following Docker command:
To get the initial Jenkins password from the Docker container:
docker exec <6462b6491862...> cat /var/jenkins_home/secrets/initialAdminPassword
