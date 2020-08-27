docker rm -f jenkins-wuhf
docker run -tid --name jenkins-wuhf -p 8890:8080 --dns=223.5.5.5 -v /home/aps/data/jenkins:/var/lib/jenkins  oaksharks/jenkins:0.1

