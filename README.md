# Online Grocery Store

A full-stack e-commerce web application for a neighbourhood grocery store, built with **Spring Boot**, **Spring Data JPA** and **MySQL**, with server-rendered **JSP** pages.

**Live demo:** https://online-grocery-store-6ove.onrender.com
_(hosted on a free plan — the first load can take up to a minute while the server wakes up)_

## Features

**Customers**
- Register and log in (passwords hashed with BCrypt)
- Browse and search products, view product details
- Add to cart, update quantities, checkout and pay
- View order history and download PDF invoices
- Forgot / change password via email link
- Contact form

**Admin panel** (`/admin`)
- Add, edit and deactivate products with image upload
- Track orders by status: pending, delivered, cancelled
- View customers and contact messages
- Manage admin profile and password

## Tech stack

| Layer | Technology |
|---|---|
| Backend | Java 8, Spring Boot 2.2, Spring MVC, Spring Data JPA (Hibernate) |
| Database | MySQL 8 |
| Frontend | JSP, JSTL, Bootstrap, jQuery |
| Other | iText (PDF invoices), JavaMail, Spring Security Crypto (BCrypt) |
| Deployment | Docker |

## Project structure

```
General_Stores/
├── general_stores.sql          # Database schema and sample data
├── pom.xml
└── src/main/
    ├── java/com/general/stores/
    │   ├── controller/         # Web controllers (customer + admin)
    │   ├── entity/             # JPA entities
    │   ├── repository/         # Spring Data repositories
    │   └── service/            # Business logic
    ├── resources/
    │   ├── application.properties
    │   └── static/             # CSS, JS, images
    └── webapp/
        ├── WEB-INF/views/      # JSP pages
        └── resources/          # Product images
```

## Run locally

**Prerequisites:** Docker

```bash
# 1. Start MySQL
docker run --name grocery-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=general_stores -p 3306:3306 -d mysql:8.0

# 2. Load schema and sample data (wait ~20s for MySQL to start)
docker exec -i grocery-mysql mysql general_stores < General_Stores/general_stores.sql

# 3. Build and run the app
docker build -t grocery .
docker run -p 8888:8888 -e DB_URL="jdbc:mysql://host.docker.internal:3306/general_stores?useSSL=false&allowPublicKeyRetrieval=true" grocery
```

Open http://localhost:8888 (store) and http://localhost:8888/admin (admin panel).

## Configuration

Settings are read from environment variables, with local defaults:

| Variable | Purpose | Default |
|---|---|---|
| `DB_URL` | JDBC URL of the MySQL database | `jdbc:mysql://localhost:3306/general_stores...` |
| `DB_USER` | Database user | `root` |
| `DB_PASSWORD` | Database password | _(empty)_ |
| `PORT` | HTTP port | `8888` |
| `APP_URL` | Public URL, used in password-reset emails | `http://localhost:8888` |
| `MAIL_USER` / `MAIL_PASSWORD` | Gmail address and app password for sending emails | _(not set)_ |
