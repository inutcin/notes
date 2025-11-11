Network Manager (сервис управления сетевыми соединениями)
===================================

# Установка

```bash
sudo apt-get install network-manager
```

# Проверка статуса

```bash
$ systemctl status NetworkManager
● NetworkManager.service - Network Manager
     Loaded: loaded (/usr/lib/systemd/system/NetworkManager.service; enabled; preset: enabled)
     Active: active (running) since Tue 2025-11-11 08:51:22 +04; 15min ago
       Docs: man:NetworkManager(8)
   Main PID: 755 (NetworkManager)
      Tasks: 4 (limit: 18933)
     Memory: 14.2M (peak: 29.6M)
        CPU: 596ms
     CGroup: /system.slice/NetworkManager.service
             └─755 /usr/sbin/NetworkManager --no-daemon

```

# Просмотр сетевых интрефейсов

```bash
$ nmcli device

DEVICE          TYPE      STATE                 CONNECTION 
wlp2s0          wifi      подключено            SamaraAP   
lo              loopback  подключено (внешнее)  lo         
docker0         bridge    подключено (внешнее)  docker0    
p2p-dev-wlp2s0  wifi-p2p  отключено             --         
eno1            ethernet  недоступно            --         

```

# Просмотр IP адреса сетевого интерфейса

```bash
$ nmcli device show wlp2s0

GENERAL.DEVICE:                         wlp2s0
GENERAL.TYPE:                           wifi
GENERAL.HWADDR:                         58:96:1D:B3:6A:37
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (подключено)
GENERAL.CONNECTION:                     SamaraAP
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/2
IP4.ADDRESS[1]:                         10.240.2.19/24
IP4.GATEWAY:                            10.240.2.254
IP4.ROUTE[1]:                           dst = 10.240.2.0/24, nh = 0.0.0.0, mt = 600
IP4.ROUTE[2]:                           dst = 0.0.0.0/0, nh = 10.240.2.254, mt = 600
IP4.DNS[1]:                             10.4.1.88
IP4.DNS[2]:                             10.3.0.88
IP6.ADDRESS[1]:                         fe80::24f4:3dd0:e15f:ceb5/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 1024
```

# Просмотр сетевых соединений

```bash
$ nmcli connection

NAME                     UUID                                  TYPE      DEVICE  
SamaraAP                 bac029af-1d3f-4b2a-b20e-a5c187605fed  wifi      wlp2s0  
lo                       0e157b55-e7e4-4b59-8295-7998da0f3d76  loopback  lo      
docker0                  0f56576e-ee97-4f69-8d5d-4ab9045538d8  bridge    docker0 
```

# Просмотр свойства сетевого соединения

```bash
$ nmcli connection show id SamaraAP
connection.id:                          SamaraAP
connection.uuid:                        bac029af-1d3f-4b2a-b20e-a5c187605fed
connection.stable-id:                   --
connection.type:                        802-11-wireless
connection.interface-name:              wlp2s0
connection.autoconnect:                 да
connection.autoconnect-priority:        0
connection.autoconnect-retries:         -1 (default)
connection.multi-connect:               0 (default)
connection.auth-retries:                -1
connection.timestamp:                   1762836685
connection.permissions:                 --
connection.zone:                        --
connection.controller:                  --
connection.master:                      --
connection.slave-type:                  --
connection.port-type:                   --
connection.autoconnect-slaves:          -1 (default)
connection.autoconnect-ports:           -1 (default)
connection.secondaries:                 --
connection.gateway-ping-timeout:        0
connection.metered:                     неизвестно
connection.lldp:                        default
connection.mdns:                        -1 (default)
connection.llmnr:                       -1 (default)
connection.dns-over-tls:                -1 (default)
connection.mptcp-flags:                 0x0 (default)
connection.wait-device-timeout:         -1
connection.wait-activation-delay:       -1
802-11-wireless.ssid:                   SamaraAP
802-11-wireless.mode:                   infrastructure
802-11-wireless.band:                   --
802-11-wireless.channel:                0
802-11-wireless.bssid:                  --
802-11-wireless.mac-address:            --
802-11-wireless.cloned-mac-address:     --
802-11-wireless.generate-mac-address-mask:--
802-11-wireless.mac-address-blacklist:  --
802-11-wireless.mac-address-randomization:default
802-11-wireless.mtu:                    автоматически
802-11-wireless.seen-bssids:            E0:63:DA:A8:2C:3A,E0:63:DA:A8:2E:DF
802-11-wireless.hidden:                 нет
802-11-wireless.powersave:              0 (default)
802-11-wireless.wake-on-wlan:           0x1 (default)
802-11-wireless.ap-isolation:           -1 (default)
802-11-wireless-security.key-mgmt:      wpa-psk
802-11-wireless-security.wep-tx-keyidx: 0
802-11-wireless-security.auth-alg:      open
802-11-wireless-security.proto:         --
802-11-wireless-security.pairwise:      --
802-11-wireless-security.group:         --
802-11-wireless-security.pmf:           0 (default)
802-11-wireless-security.leap-username: --
```

# Добавление статического маршрута сетевому соединению

Смотрим маршруты

```bash
# route

Таблица маршутизации ядра протокола IP
Destination Gateway Genmask Flags Metric Ref Use Iface
default         _gateway        0.0.0.0         UG    600    0        0 wlp2s0
10.240.2.0      0.0.0.0         255.255.255.0   U     600    0        0 wlp2s0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
```

```bash
# nmcli connection modify SamaraAP +ipv4.routes "10.250.105.0/24 10.240.2.254"
```

Перезапускаем соединение

```bash
# nmcli connection up SamaraAP
```

Проверяем маршруты
```bash
# route

Таблица маршутизации ядра протокола IP
Destination Gateway Genmask Flags Metric Ref Use Iface
default         _gateway        0.0.0.0         UG    600    0        0 wlp2s0
10.240.2.0      0.0.0.0         255.255.255.0   U     600    0        0 wlp2s0
10.250.105.0    _gateway        255.255.255.0   UG    600    0        0 wlp2s0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
```

# Источники

- [Configure Network Settings Using Network Manager in Linux](https://www.baeldung.com/linux/network-manager)