echo "CENTOS SETUP JENKINS"

echo "Install wget"
sudo yum update -y
sudo yum install wget -y

echo "Jenkins repo"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key


echo "Install packages"
sudo yum install jenkins -y
sudo yum install openjdk-11-jre -y
sudo yum install java-11-openjdk-devel -y

echo "Start jenkins"
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Firewall"
# /etc/init.d/jenkins - ako hoces da menjas port dodas JENKINS_PORT=<port> na pocetak
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload