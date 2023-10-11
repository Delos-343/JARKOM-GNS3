apt-get update
apt-get install bind9 -y

sleep 1

echo 'zone "i02.com" {
	type master;
	file "/etc/bind/i02/i02.com";
};' | tee -a /etc/bind/named.conf.local

sleep 1

mkdir -p /etc/bind/i02

cp /etc/bind/db.local /etc/bind/i02/i02.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     i02.com. root.i02.com. (
                     2023101001         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      i02.com.
@       IN      A       192.229.2.2
www     IN      CNAME   i02.com.
@       IN      AAAA    ::1' | tee /etc/bind/i02/i02.com

sleep 1

echo 'zone "2.229.192.in-addr.arpa" {
    type master;
    file "/etc/bind/i02/2.229.192.in-addr.arpa";
};' | tee -a /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/i02/2.229.192.in-addr.arpa

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     i02.com. root.i02.com. (
                     2023101001         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.229.192.in-addr.arpa      IN      NS      i02.com.
2                           IN      PTR     i02.com.' | tee /etc/bind/i02/2.229.192.in-addr.arpa

service bind9 restart


