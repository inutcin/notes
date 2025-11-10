Ping (проверка доступности узлов сети)
==============

# Простой пример использования

```
$ ping ya.ru
```

Ответ - принятые назад ответы о доставленных пакетах

```
64 bytes from ya.ru (5.255.255.242): icmp_seq=1 ttl=245 time=23.2 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=2 ttl=245 time=27.2 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=3 ttl=245 time=24.0 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=4 ttl=245 time=23.2 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=5 ttl=245 time=23.2 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=6 ttl=245 time=24.2 ms
^C
--- ya.ru ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5005ms
```

Расшифровка ответа

- **64 bytes** - размер тела пакета (заголовок пакета составляет 8 байт)
- **icmp_seq=1** - порядковый номер отправленного пакета
- **ttl=245** - количество пересылок пакета до момента когда он будет утрачен, по этой цифре можно судить о количестве уже состоявшихся пересылок.
- **time=23.2 ms** - время возврата ответа о доставке пакета

# Другие примеры использования


## Послать ровно 10 пакетов

```bash
$ ping ya.ru  -c 10
PING ya.ru (5.255.255.242) 56(84) bytes of data.
64 bytes from ya.ru (5.255.255.242): icmp_seq=1 ttl=245 time=23.4 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=2 ttl=245 time=23.1 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=3 ttl=245 time=25.6 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=4 ttl=245 time=24.1 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=5 ttl=245 time=24.0 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=6 ttl=245 time=23.3 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=7 ttl=245 time=24.3 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=8 ttl=245 time=24.1 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=9 ttl=245 time=23.7 ms
64 bytes from ya.ru (5.255.255.242): icmp_seq=10 ttl=245 time=24.1 ms

--- ya.ru ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9010ms
rtt min/avg/max/mdev = 23.133/23.968/25.563/0.654 ms
```
## Послать 10 пакетов через сетевой интерфейс wlp2s0 

```bash
$ ping ya.ru -c 10 -I wlp2s0
PING ya.ru (77.88.55.242) from 10.240.2.19 wlp2s0: 56(84) bytes of data.
64 bytes from ya.ru (77.88.55.242): icmp_seq=1 ttl=51 time=26.8 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=2 ttl=51 time=27.7 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=3 ttl=51 time=28.0 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=4 ttl=51 time=27.6 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=5 ttl=51 time=28.0 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=6 ttl=51 time=28.9 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=7 ttl=51 time=27.7 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=8 ttl=51 time=29.3 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=9 ttl=51 time=26.9 ms
64 bytes from ya.ru (77.88.55.242): icmp_seq=10 ttl=51 time=27.5 ms

--- ya.ru ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9009ms
rtt min/avg/max/mdev = 26.831/27.850/29.260/0.732 ms
```

## Послать 5 пакетов через сетевой интерфейс с конкретным временем жизни

Отправка с временем жизни 1

Последний ответивший узел - ближайший в цепочке пересылок (локальный шлюз)

```bash
$ ping ya.ru -c 5 -I wlp2s0 -t 1
PING ya.ru (77.88.55.242) from 10.240.2.19 wlp2s0: 56(84) bytes of data.
From _gateway (10.240.2.254) icmp_seq=1 Time to live exceeded
From _gateway (10.240.2.254) icmp_seq=2 Time to live exceeded
From _gateway (10.240.2.254) icmp_seq=3 Time to live exceeded
^C
--- ya.ru ping statistics ---
3 packets transmitted, 0 received, +3 errors, 100% packet loss, time 2001ms
```

Отправка с временем жизни 2

Последний ответивший узел - тот который идёт сразу за локальным шлюзом

```bash
$ ping ya.ru -c 5 -I wlp2s0 -t 2
PING ya.ru (77.88.55.242) from 10.240.2.19 wlp2s0: 56(84) bytes of data.
From 195.34.18.229 icmp_seq=1 Time to live exceeded
From 195.34.18.229 icmp_seq=2 Time to live exceeded
From 195.34.18.229 icmp_seq=3 Time to live exceeded
From 195.34.18.229 icmp_seq=4 Time to live exceeded
^C
--- ya.ru ping statistics ---
4 packets transmitted, 0 received, +4 errors, 100% packet loss, time 3002ms
```

Команда, которая последовательно посылает ICMP пакеты с увеличивающимся ttl называется [traceroute](Traceroute.md)

# Ссылки

- [Сети и Linux](https://dzen.ru/a/ZK-KB3aBJhGadyIp)