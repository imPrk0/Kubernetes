
# FirewallD
systemctl status firewalld
systemctl stop firewalld
systemctl disable firewalld

# SeLinux
setenforce 0
sed -i 's/enforcing/disabled/' /etc/selinux/config

# swap
swapoff -a
sed -ri 's/.*swap.*/#&/' /etc/fstab

# IPv4 ===bridge==> IPTables
cat > /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# System Time
yum install ntpdate -y
ntpdate time.windows.com
