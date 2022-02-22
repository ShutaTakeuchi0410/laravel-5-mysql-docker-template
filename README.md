# README

Version
```
PHP 7.4
Laravel 5.*
MySQL 5.7
```

## Usage

### 1. Get template

```bash
$ mkdir YOUR_REPOSITORY_NAME
$ cd YOUR_REPOSITORY_NAME
$ git clone git@github.com:ShutaTakeuchi0410/laravel-5-mysql-docker-template.git .
```

### 2. Reset Git

```bash
$ make reset-git
```

### 3. Create Laravel project

```bash
$ make create-project
```

### 4. Define APP_NAME
Change environment variable,  **APP_NAME** if necessary.  
(./Docker/App/.env.example)
```
APP_NAME=LaravelApp
```

### 5. Set Laravel configuration
setting .env & generating key & chmod 777

```bash
$ make init
```

## Command

### docker compose up

```bash
$ make up
```

### Enter App container

```bash
$ make app
```

### Open Localhost:8000

```bash
$ make browse
```

### Open phpMyAdmin

```bash
$ make pma
```

[Click here to see other commands & details](Makefile)

## Basic Setting

### 1. Prevent Character Code Error

1. Open **AppServiceProvider.php**  
(./src/app/Providers/AppServiceProvider.php)

2. Add **use**
```
use Illuminate\Support\Facades\Schema;
```

3. set **defaultStringLength(191)** into function called *boot*
```
public function boot()
    {
        dSchema::defaultStringLength(191);  # Add this!
    }
```

### 2. Set Timezone & locale

1. Open **app.php**  
(./src/app/config/app.php)

2. set value **'timezone'** & **'locale'**
```
'timezone' => 'Asia/Tokyo',
'locale' => 'ja',
```
