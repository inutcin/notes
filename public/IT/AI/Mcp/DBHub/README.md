# Подключение локальной БД к opencode через MCP-сервер DBHub

## Запуск MCP-сервера

### Перейдите в папку с MCP-сервером
```bash
cd ./docker/xtra/mcp/DBHub/local
```

### Скопируйте пример настроечного файла

```bash
cp .env.sample .env
```

### Отредактируйте .env, пропишите настройки подключения к БД

Пример файла `env`

```
DB_HOST=10.240.2.19
DB_USER=bduser
DB_PASS=sj8cn84nsla
```

Запустите контейнер
```bash
docker compose up -d
```

## Подключение MCP-сервера к opencode 

Отредактируйте файл `~/.config/opencode/opencode.jsonc`, добавьте туда секцию
c mcp, например

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
      "db_local": {
        "type": "remote", // Use "remote" for HTTP/SSE or "local" for stdio
        "url": "http://localhost:8933/mcp",
        "enabled": true
      }  
   } 
}
```

## Проверка подключения 

После завершения проверьте статус командой 

```bash
$ opencode mcp ls

┌  MCP Servers
│
●  ✓ dbhub_local connected
│      http://localhost:8933/mcp
│
└  1 server(s)

```


## Обращение к данным сервера из opencode

Промпт

```
Get structure of public.variables table from mcp-server `dbhub_queue`
```

Ответ

```
| Column | Type | Nullable | Default | Description |
|---|---|---|---|---|
| `id` | `bigint` | NO | `nextval('variable_id_seq')` | |
| `created_at` | `timestamp` | YES | | |
| `updated_at` | `timestamp` | YES | | |
| `code` | `varchar(64)` | NO | | Код переменной |
| `value` | `varchar(255)` | YES | | Значение переменной |
| `type` | `varchar(16)` | YES | `'string'` | Тип переменной |
| `description` | `varchar(255)` | YES | | Описание |
| `visible` | `smallint` | YES | `0` | Отображать в CMS |
| `is_showcase` | `smallint` | NO | `0` | Настройка витрины |

```





