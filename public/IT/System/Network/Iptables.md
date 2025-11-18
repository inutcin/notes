Iptables (файрвол)

# Схема прохождения пакетов

![alt text](image.png)


# Просмотр правил из определённой цепочки и таблицы с номерами строк

```bash
# iptables -t filter -L FORWARD --line-numbers -n
Chain FORWARD (policy DROP)
num  target     prot opt source               destination         
1    DOCKER-USER  0    --  0.0.0.0/0            0.0.0.0/0           
2    DOCKER-FORWARD  0    --  0.0.0.0/0            0.0.0.0/0           
```

- **-t filter** - просмотр таблицы filter
- **-L FORWARD** - просмотр цепочки FORWARD
- **--line-numbers** - вывести номера правил внутри цепочки

# Просмотр правил определённой таблицы из всех цепочек

```bash
# iptables -t nat --line-numbers -n
iptables v1.8.10 (nf_tables): no command specified
Try `iptables -h' or 'iptables --help' for more information.
root@rasian-ThinkCentre-M720q:/home/r-asian/sshfs# iptables -t nat -L --line-numbers -n
Chain PREROUTING (policy ACCEPT)
num  target     prot opt source               destination         
1    DOCKER     0    --  0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL

Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination         
1    DOCKER     0    --  0.0.0.0/0           !127.0.0.0/8          ADDRTYPE match dst-type LOCAL

Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination         
1    MASQUERADE  0    --  172.18.0.0/16        0.0.0.0/0           
2    MASQUERADE  0    --  172.100.33.0/24      0.0.0.0/0           
3    MASQUERADE  0    --  172.17.0.0/16        0.0.0.0/0           

Chain DOCKER (2 references)# iptables -t nat --line-numbers -n
iptables v1.8.10 (nf_tables): no command specified
Try `iptables -h' or 'iptables --help' for more information.
root@rasian-ThinkCentre-M720q:/home/r-asian/sshfs# iptables -t nat -L --line-numbers -n
Chain PREROUTING (policy ACCEPT)
num  target     prot opt source               destination         
1    DOCKER     0    --  0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL

Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination         
1    DOCKER     0    --  0.0.0.0/0           !127.0.0.0/8          ADDRTYPE match dst-type LOCAL

Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination         
1    MASQUERADE  0    --  172.18.0.0/16        0.0.0.0/0           
2    MASQUERADE  0    --  172.100.33.0/24      0.0.0.0/0           
3    MASQUERADE  0    --  172.17.0.0/16        0.0.0.0/0           

Chain DOCKER (2 references)
num  target     prot opt source               destination         
1    RETURN     0    --  0.0.0.0/0            0.0.0.0/0           
2    RETURN     0    --  0.0.0.0/0            0.0.0.0/0           
3    RETURN     0    --  0.0.0.0/0            0.0.0.0/0           
4    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8081 to:172.18.0.2:8080
5    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5436 to:172.100.33.3:5432
6    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5433 to:172.100.33.2:5432
7    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5434 to:172.100.33.4:5432
8    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5437 to:172.100.33.5:5432
9    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5435 to:172.100.33.7:5432
10   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:11211 to:172.100.33.8:11211
11   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5672 to:172.100.33.10:5672
12   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:15672 to:172.100.33.10:15672
13   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8501 to:172.100.33.19:80
14   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8520 to:172.100.33.21:80

num  target     prot opt source               destination         
1    RETURN     0    --  0.0.0.0/0            0.0.0.0/0           
2    RETURN     0    --  0.0.0.0/0            0.0.0.0/0           
3    RETURN     0    --  0.0.0.0/0            0.0.0.0/0           
4    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8081 to:172.18.0.2:8080
5    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5436 to:172.100.33.3:5432
6    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5433 to:172.100.33.2:5432
7    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5434 to:172.100.33.4:5432
8    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5437 to:172.100.33.5:5432
9    DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5435 to:172.100.33.7:5432
10   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:11211 to:172.100.33.8:11211
11   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:5672 to:172.100.33.10:5672
12   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:15672 to:172.100.33.10:15672
13   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8501 to:172.100.33.19:80
14   DNAT       6    --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8520 to:172.100.33.21:80

```

# Просмотр правил в определённой цепочке и таблице со статистикой пакетов

```bash
# iptables -t filter -L FORWARD --line-numbers -n -v
Chain FORWARD (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1      382 22440 DOCKER-USER  0    --  *      *       0.0.0.0/0            0.0.0.0/0           
2      382 22440 DOCKER-FORWARD  0    --  *      *       0.0.0.0/0            0.0.0.0/0           

```


# Удаление правила по имени цепочки и номеру правила


```bash
# iptables -t filter -L INPUT  --line-numbers -n -v
Chain INPUT (policy ACCEPT 30741 packets, 8514K bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1    30741 8514K FILTERS    0    --  *      *       0.0.0.0/0            0.0.0.0/0           
```

```bash
# iptables -t filter -D INPUT 1
```

```bash
# iptables -t filter -L INPUT  --line-numbers -n -v
Chain INPUT (policy ACCEPT 35384 packets, 9401K bytes)
num   pkts bytes target     prot opt in     out     source               destination
```

# Логирование прохождения пакетов по цепочкам

## Получаем список правил интересующей цепочки с номерами правил

```
iptables -t nat -L POSTROUTING --line-numbers
```

```
Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination         
1    MASQUERADE  all  --  syn-172-100-016-000.res.spectrum.com/24  anywhere            
2    MASQUERADE  all  --  172.17.0.0/16        anywhere            
3    MASQUERADE  tcp  --  syn-172-100-016-002.res.spectrum.com  syn-172-100-016-002.res.spectrum.com  tcp dpt:6901
4    MASQUERADE  tcp  --  syn-172-100-016-002.res.spectrum.com  syn-172-100-016-002.res.spectrum.com  tcp dpt:5901
```

## Вставляем в нужную цепочку ПЕРЕД правилом, действие которого надо залогировать

Вставляем в цепочку FORWARD **перед** 3 строкой

```
iptables -t nat -I POSTROUTING 3 -s 10.0.0.0/8 -p tcp -j LOG --log-prefix "ngate-"
```

## Проверка вставки

```
iptables -t nat -L POSTROUTING --line-numbers
```
```
Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination         
1    MASQUERADE  all  --  syn-172-100-016-000.res.spectrum.com/24  anywhere            
2    MASQUERADE  all  --  172.17.0.0/16        anywhere            
3    LOG        tcp  --  10.0.0.0/8           anywhere             LOG level warning prefix "ngate-"
4    MASQUERADE  tcp  --  syn-172-100-016-002.res.spectrum.com  syn-172-100-016-002.res.spectrum.com  tcp dpt:6901
5    MASQUERADE  tcp  --  syn-172-100-016-002.res.spectrum.com  syn-172-100-016-002.res.spectrum.com  tcp dpt:5901

```

## Просмотр логов

```
grep "ngate-" /var/log/syslog
```

```
Nov 18 14:19:30 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203639.243070] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=212.11.155.165 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54993 DF PROTO=TCP SPT=56478 DPT=443 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:19:41 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203650.270061] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=89.208.157.2 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=56524 DF PROTO=TCP SPT=34580 DPT=993 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:19:41 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203650.296170] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=89.208.157.2 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=3269 DF PROTO=TCP SPT=34590 DPT=993 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:19:41 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203650.331476] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=89.208.157.2 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=52170 DF PROTO=TCP SPT=34596 DPT=993 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:19:41 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203650.354675] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=89.208.157.2 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=35725 DF PROTO=TCP SPT=34600 DPT=993 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:20:30 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203699.246577] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=212.11.155.165 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=2393 DF PROTO=TCP SPT=43572 DPT=443 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:20:33 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203702.552333] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=108.177.14.139 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=38026 DF PROTO=TCP SPT=36514 DPT=443 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:20:40 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203709.275390] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=77.88.21.125 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=28578 DF PROTO=TCP SPT=42698 DPT=143 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:20:55 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203724.586897] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=77.88.21.125 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=31101 DF PROTO=TCP SPT=42698 DPT=993 WINDOW=64240 RES=0x00 SYN URGP=0
Nov 18 14:21:10 rasian-IdeaPad-Gaming-3-15IMH05 kernel: [203739.294482] ngate-IN= OUT=wlp0s20f3 SRC=10.240.2.37 DST=77.88.21.125 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7481 DF PROTO=TCP SPT=59268 DPT=143 WINDOW=64240 RES=0x00 SYN URGP=0

```




