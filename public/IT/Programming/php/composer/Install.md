Установка composer
====================

# Установка php

```
# sudo apt install php-cli
```

# Скачивание установщика

```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
```

# Запускаем установщик

```
$ php composer-setup.php
All settings correct for using Composer
Downloading...

Composer (version 2.8.12) successfully installed to: composer.phar
Use it: php composer.phar
```

# Устанавливаем composer в систему

```
$ sudo mv composer.phar /usr/local/bin/composer
```

# Назначаем права на исполнение

```
sudo chmod +x /usr/local/bin/composer
```

# Проверяем версию 

```
$ composer -V
Composer version 2.8.12 2025-09-19 13:41:59
PHP version 8.3.6 (/usr/bin/php8.3)
Run the "diagnose" command to get more detailed diagnostics output.
```

# Проводим диагностику

```
$ composer diagnose
Checking composer.json: OK
Checking platform settings: OK
Checking git settings: OK git version 2.43.0
Checking http connectivity to packagist: OK
Checking https connectivity to packagist: OK
Checking github.com rate limit: OK
Checking disk free space: OK
Checking pubkeys: 
Tags Public Key Fingerprint: 57815BA2 7E54DC31 7ECC7CC5 573090D0  87719BA6 8F3BB723 4E5D42D0 84A14642
Dev Public Key Fingerprint: 4AC45767 E5EC2265 2F0C1167 CBBB8A2B  0C708369 153E328C AD90147D AFE50952
OK
Checking Composer version: OK
Checking Composer and its dependencies for vulnerabilities: OK
Composer version: 2.8.12
PHP version: 8.3.6
PHP binary path: /usr/bin/php8.3
OpenSSL version: OpenSSL 3.0.13 30 Jan 2024
curl version: missing, using php streams fallback, which reduces performance
zip: extension not loaded, unzip present, 7-Zip present (7z)

```

# Устанавливаем отсутствующие библиотеки

Из предыдущего пункта видно что в php не хватает следующих расширений

- curl
- zip

```
$ sudo apt install php-curl php-zip
```

Проверяем повторно

```
$ composer diagnose
Checking composer.json: OK
Checking platform settings: OK
Checking git settings: OK git version 2.43.0
Checking http connectivity to packagist: OK
Checking https connectivity to packagist: OK
Checking github.com rate limit: OK
Checking disk free space: OK
Checking pubkeys: 
Tags Public Key Fingerprint: 57815BA2 7E54DC31 7ECC7CC5 573090D0  87719BA6 8F3BB723 4E5D42D0 84A14642
Dev Public Key Fingerprint: 4AC45767 E5EC2265 2F0C1167 CBBB8A2B  0C708369 153E328C AD90147D AFE50952
OK
Checking Composer version: OK
Checking Composer and its dependencies for vulnerabilities: OK
Composer version: 2.8.12
PHP version: 8.3.6
PHP binary path: /usr/bin/php8.3
OpenSSL version: OpenSSL 3.0.13 30 Jan 2024
curl version: 8.5.0 libz 1.3 brotli 1.1.0 zstd supported ssl OpenSSL/3.0.13
zip: extension present, unzip present, 7-Zip present (7z)

```

Вот теперь всё ок.
