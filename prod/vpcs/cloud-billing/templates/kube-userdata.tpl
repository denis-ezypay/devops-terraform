#!/bin/bash -xe
usermod  -l ${admin_user} centos
groupmod -n ${admin_user} centos
usermod  -d /home/${admin_user} -m ${admin_user}
sed -i -e 's/centos/${admin_user}/g' /etc/sudoers.d/90-cloud-init-users
sudo hostnamectl set-hostname --static ${environment_prefix}-${app_name}-$(date +%N)
systemctl start docker

docker run -e CATTLE_AGENT_IP="$(curl http://169.254.169.254/latest/meta-data/local-ipv4)"  -e CATTLE_HOST_LABELS="env=${environment_prefix}"  --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.6  ${rancher_url}
