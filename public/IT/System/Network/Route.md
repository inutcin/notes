Маршрутизация
===============

# Установка пакетов

Debian/Ubuntu
```
# apt-get install net-tools
```

CentOs/Fedora/Redhat

```
dnf install net-tools
```


# Примеры команд

## Просмотр таблицы маршрутизации

```
# route
Таблица маршутизации ядра протокола IP
Destination Gateway Genmask Flags Metric Ref Use Iface
default         _gateway        0.0.0.0         UG    600    0        0 wlp2s0
10.0.0.0        10.3.63.248     255.0.0.0       UG    2      0        0 tun0
10.3.32.0       0.0.0.0         255.255.224.0   U     2      0        0 tun0
10.240.2.0      0.0.0.0         255.255.255.0   U     600    0        0 wlp2s0
172.16.0.0      10.3.63.248     255.240.0.0     UG    2      0        0 tun0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
```

```
# ip route list
default via 10.240.2.254 dev wlp2s0 proto dhcp src 10.240.2.19 metric 600
10.0.0.0/8 via 10.3.63.248 dev tun0 proto static metric 2
10.3.32.0/19 dev tun0 proto kernel scope link src 10.3.36.96 metric 2
10.240.2.0/24 dev wlp2s0 proto kernel scope link src 10.240.2.19 metric 600
172.16.0.0/12 via 10.3.63.248 dev tun0 proto static metric 2
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown

# ip route show
default via 10.240.2.254 dev wlp2s0 proto dhcp src 10.240.2.19 metric 600
10.0.0.0/8 via 10.3.63.248 dev tun0 proto static metric 2
10.3.32.0/19 dev tun0 proto kernel scope link src 10.3.36.96 metric 2
10.240.2.0/24 dev wlp2s0 proto kernel scope link src 10.240.2.19 metric 600
172.16.0.0/12 via 10.3.63.248 dev tun0 proto static metric 2
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
```

## Добавление маршрута

Синтакс
```
route add -net <ip_address> netmask <netmask_address_here> gw <gw_address_here>
```

Пример

```
# route add default gw 192.168.1.254 eth0
```
или

```
ip route add 192.168.1.0/24 dev eth0
```

## Удаление маршрута

Синтакс
```
route del -net <ip_address_here> netmask <netmask_address_here> dev <gw_interface_here>
```

Пример

```
route del default
```

# Настройка на поднятие маршрутов при загрузке системы

## RHEL/CentOS/Fedora/Scientific Linux 

### Установка маршрута по умолчанию

```
# vi /etc/sysconfig/network
```
```
## setup default gateway ##
GATEWAY=192.168.1.254
```
### Установка дополнительных статических маршрутов

```
# vi /etc/sysconfig/network-scripts/route-eth0
```
```
10.0.0.0/8 via 10.10.29.65
```

## Debian/Ubuntu

```
vi /etc/network/interfaces
```
```
up route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.254
down route del -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.254
```

## Mint

Настраивается через [NetworkManager](NetworkManager.md)





