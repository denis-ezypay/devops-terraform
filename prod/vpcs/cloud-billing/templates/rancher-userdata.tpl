#!/bin/bash -xe
usermod  -l ${admin_user} centos
groupmod -n ${admin_user} centos
usermod  -d /home/${admin_user} -m ${admin_user}
sed -i -e 's/centos/${admin_user}/g' /etc/sudoers.d/90-cloud-init-users
sudo hostnamectl set-hostname --static ${environment_prefix}-${app_name}
systemctl start docker
docker run --name rancher -d --restart=unless-stopped -p 8080:8080 rancher/server:stable --db-host ${db_host} --db-port 3306 --db-user rancher_user --db-pass r#nch3rpassw0rd --db-name cattle
