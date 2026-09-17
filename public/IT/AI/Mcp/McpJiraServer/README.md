Подключение Jira MCP-сервера к opencode
==================

Рассматриваем подключение 

# Репозиторий MPC-сервера mcp-jira-server

[MCP Jira Server for Self-Hosted Jira](https://github.com/edrich13/mcp-jira-server)

# Установка nodejs

Это самый безопасный и удобный способ. `nvm` (Node Version Manager) позволяет установить несколько версий Node.js и переключаться между ними без конфликтов . Вам не придется переустанавливать глобальные пакеты для каждой версии.

1.  **Установите `nvm`**. Откройте терминал и выполните команду:
    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    ```
    После установки перезапустите терминал или выполните `source ~/.bashrc` (или `source ~/.zshrc`, если используется Zsh) .

2.  **Установите Node.js версии 18**:
    ```bash
    nvm install 18
    ```
    Эта команда скачает и установит самую свежую версию из ветки 18.x .

3.  **Начните использовать новую версию**:
    ```bash
    nvm use 18
    ```

4.  **(Опционально)** Сделайте версию 18 версией по умолчанию, чтобы она автоматически загружалась при открытии нового терминала:
    ```bash
    nvm alias default 18
    ```

5.  **Проверьте результат**:
    ```bash
    node -v
    ```
    В выводе должно быть `v18.x.x` .

# Установка mcp-jira-server

```
npx mcp-jira-server
```

# Настройка

## Получение докена доступа

Создаётся в разделе `Профиль` вашей jira

```
https://jira.domain.ru/secure/ViewProfile.jspa?selectedTab=com.atlassian.pats.pats-plugin:jira-user-personal-access-tokens
```



## Конфиг в корне проекта

Добавьте в opencode.jsonc в корне проекта в блок `mcp`

```json
...
  "mcp": {
    "jira_domain": {
      "type": "local",
      "command": [
        "npx", "-y", "mcp-jira-server"
      ],
      "environment": {
        "JIRA_BASE_URL": "https://jira.domain.ru"
      },
      "enabled": true,
      "timeout": 60000
    }
    
  },

...
```

## Конфиг в корне пользовательского каталога

Чтобы доступы к jira случайно не попали в репозиторий проекта.

Добавьте в `~/.config/opencode/opencode.jsonc` в блок `mcp`,
где в `JIRA_PAT` установите токен доступа

```
//...
 "mcp": {
    //...
    "jira_domain": {
      "environment": {
        "JIRA_PAT": "*********************" 
      },
      "enabled": true
    }

    //...
  } 
//...
```

# Проверка работы

## Проверка в консоли

```
opencode mcp ls
```

```
$ opencode mcp ls

┌  MCP Servers
│
●  ✓ jira_domain connected
│      npx -y mcp-jira-server
│
└  1 server(s)
```

## Проверка промптом

```
Получи из jira список моих задач в статусе `In review` и представь в виде таблицы
- Название задачи
- Дата создания
- Приоритет 
- Deadline
```

```
Two issues. Deadline not set. Present table with requested columns.

Задачи в статусе **In Review** (2 шт., поле Deadline не заполнено):

| Название задачи | Дата создания | Приоритет | Deadline |
|---|---|---|---|
| XX-12854 news/listing падает при передаче фильтра по категории и мероприятия | 16.09.2026 | Medium | — |
| XX-12696 Правка unit-тестов VI | 31.08.2026 | Medium | — |

```