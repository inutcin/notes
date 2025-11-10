Traceroute (проверка маршрута доставки пакетов)
======================

# Простой пример использования

```bash
$ traceroute ya.ru
traceroute to ya.ru (77.88.44.242), 30 hops max, 60 byte packets
 1  _gateway (10.240.2.254)  1.066 ms  1.285 ms  1.414 ms
 2  195.34.18.229 (195.34.18.229)  2.586 ms  1.583 ms  3.242 ms
 3  83.242.244.24 (83.242.244.24)  3.588 ms  4.165 ms  3.457 ms
 4  10.217.2.1 (10.217.2.1)  4.042 ms  4.546 ms  3.895 ms
 5  che-cr03-eth-trunk30.4093.sam.mts-internet.net (212.188.11.77)  3.464 ms  4.019 ms  3.957 ms
 6  che-cr02-ae7.0.sam.mts-internet.net (212.188.56.176)  22.155 ms  20.785 ms  24.945 ms
 7  a197-cr08-eth-trunk1.msk.mts-internet.net (212.188.29.25)  21.827 ms  22.028 ms  21.960 ms
 8  a197-cr02-be2.msk.mts-internet.net (212.188.42.121)  23.346 ms  22.413 ms  23.215 ms
 9  a197-cr03-ae0.16.msk.mts-internet.net (212.188.55.2)  20.850 ms  23.091 ms  23.017 ms
10  195.34.49.174 (195.34.49.174)  20.928 ms  20.847 ms  20.179 ms
11  * * *
12  * * *
13  a197-cr07-eth-trunk15.msk.mts-internet.net (212.188.1.92)  23.551 ms  20.588 ms  23.254 ms
14  212.188.75.18 (212.188.75.18)  23.998 ms  23.042 ms  22.682 ms
15  * * klg-32z5-ae1.yndx.net (93.158.160.135)  33.230 ms
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

# Тестирование маршрута доставки через сетевой интерфейс wlp2s0

```bash
$ traceroute ya.ru -i wlp2s0
```

# Использовать для тестирования маршрута доставки TCP SYN протокол по порту 443

```bash
$ sudo traceroute ya.ru -T -p 443
traceroute to ya.ru (5.255.255.242), 30 hops max, 60 byte packets
 1  _gateway (10.240.2.254)  0.954 ms  1.175 ms *
 2  195.34.18.229 (195.34.18.229)  2.118 ms * *
 3  83.242.244.24 (83.242.244.24)  2.367 ms * *
 4  10.217.2.1 (10.217.2.1)  3.296 ms * *
 5  * * che-cr03-eth-trunk30.4093.sam.mts-internet.net (212.188.11.77)  4.350 ms
 6  che-cr02-ae7.0.sam.mts-internet.net (212.188.56.176)  23.719 ms * *
 7  a197-cr08-eth-trunk1.msk.mts-internet.net (212.188.29.25)  20.813 ms * *
 8  a197-cr02-be2.msk.mts-internet.net (212.188.42.121)  20.752 ms * *
 9  a197-cr03-ae0.16.msk.mts-internet.net (212.188.55.2)  21.016 ms * *
10  195.34.49.114 (195.34.49.114)  53.457 ms * *
11  * * *
12  * * *
13  a197-cr07-eth-trunk15.msk.mts-internet.net (212.188.1.92)  20.446 ms  22.148 ms  22.029 ms
14  212.188.75.18 (212.188.75.18)  20.674 ms  21.528 ms  21.414 ms
15  * vla-32z3-ae2.yndx.net (93.158.172.23)  25.045 ms vla-32z7-ae4.yndx.net (93.158.172.35)  23.179 ms
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  ya.ru (5.255.255.242)  26.420 ms * *
```

# Использовать для тестирования маршрута доставки ICMP ECHO

```bash
$ sudo traceroute ya.ru -I
traceroute to ya.ru (77.88.55.242), 30 hops max, 60 byte packets
 1  _gateway (10.240.2.254)  0.957 ms  1.163 ms *
 2  195.34.18.229 (195.34.18.229)  2.750 ms * *
 3  83.242.244.24 (83.242.244.24)  3.626 ms * *
 4  10.217.2.1 (10.217.2.1)  4.544 ms * *
 5  che-cr03-eth-trunk30.4093.sam.mts-internet.net (212.188.11.77)  7.455 ms * *
 6  che-cr02-ae7.0.sam.mts-internet.net (212.188.56.176)  31.389 ms * *
 7  a197-cr08-eth-trunk1.msk.mts-internet.net (212.188.29.25)  24.284 ms * *
 8  a197-cr02-be2.msk.mts-internet.net (212.188.42.121)  20.921 ms * *
 9  a197-cr03-ae0.16.msk.mts-internet.net (212.188.55.2)  20.790 ms * *
10  a197-cr03-ae9.10.msk.mts-internet.net (212.188.2.230)  21.301 ms * *
11  * * *
12  * * *
13  a197-cr07-eth-trunk15.msk.mts-internet.net (212.188.1.92)  20.566 ms * *
14  212.188.75.18 (212.188.75.18)  20.684 ms * *
15  sas-32z7-ae2.yndx.net (87.250.239.81)  28.552 ms * *
16  * * *
17  * * *
18  ya.ru (77.88.55.242)  27.167 ms  27.215 ms  27.195 ms
```

Ещё одна утилита для исследования маршрута доставки [mtr](Mrt.md)