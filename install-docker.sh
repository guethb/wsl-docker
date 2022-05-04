export http_proxy=http://10.0.0.0:8080
export https_proxy=https://10.0.0.0:8080
apt-get -q update
apt-get -qy install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo  \
	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
	> /etc/apt/sources.list.d/docker.list
apt-get -q update
apt-get -qy install docker-ce docker-ce-cli containerd.io
cat << EOF | envsubst >> /etc/default/docker
export http_proxy=$http_proxy
export https_proxy=$https_proxy
EOF
update-alternatives --set iptables /usr/sbin/iptables-legacy
