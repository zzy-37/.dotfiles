# proxy setting for wsl
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export http_proxy="http://$host_ip:10809"
export https_proxy="http://$host_ip:10809"
