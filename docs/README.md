## Назва проекту

"DiscussHub: Engage in Enlightening Conversations"

## Короткий опис проекту
The project is an online forum called "InterAct". It serves as a platform where users can discuss various topics, share ideas, and engage in conversations with other community members. Each user has the ability to register, after which they can create posts, leave comments, and participate in discussions. The project features a comprehensive database comprising tables for roles, users, comments, posts, and categories to ensure seamless and efficient functioning of the forum.

## API документація (таблиця де будуть ваші основні роути
| Метод  | URL                 | Опис                  |
|--------|---------------------|-----------------------|
| GET    | /comments           | Отримати всі коментарі |
| POST   | /comments           | Створити новий коментар |
| GET    | /comments/:id       | Отримати коментар за ідентифікатором |
| PUT    | /comments/:id       | Оновити існуючий коментар |
| DELETE | /comments/:id       | Видалити існуючий коментар |
| GET    | /posts              | Отримати всі пости      |
| POST   | /posts              | Створити новий пост     |
| GET    | /posts/:id          | Отримати пост за ідентифікатором |
| PUT    | /posts/:id          | Оновити існуючий пост   |
| DELETE | /posts/:id          | Видалити існуючий пост  |
| GET    | /categories         | Отримати всі категорії  |
| POST   | /categories         | Створити нову категорію |
| GET    | /categories/:id     | Отримати категорію за ідентифікатором |
| PUT    | /categories/:id     | Оновити існуючу категорію |
| DELETE | /categories/:id     | Видалити існуючу категорію |
| GET    | /users              | Отримати всіх користувачів |
| POST   | /users              | Створити нового користувача |
| GET    | /users/:id          | Отримати користувача за ідентифікатором |
| PUT    | /users/:id          | Оновити існуючого користувача |
| DELETE | /users/:id          | Видалити існуючого користувача |
| GET    | /roles              | Отримати всі ролі      |
| POST   | /roles              | Створити нову роль     |
| GET    | /roles/:id          | Отримати роль за ідентифікатором |
| PUT    | /roles/:id          | Оновити існуючу роль   |
| DELETE | /roles/:id          | Видалити існуючу роль  |

## Діаграми
ER діагама:
![Image alt](https://github.com/creonluv/ruby_laboratory_works/blob/lab1/image_2024-02-25_18-27-01.png)

## Опис скриптів
1. **bundle (або bundle.cmd на Windows)**
   - Скрипт для встановлення та керування гемами проекту за допомогою Bundler.

2. **docker-entrypoint**
   - Скрипт, який використовується для налаштування середовища контейнера Docker під час його запуску.

3. **importmap**
   - Скрипт, що пов'язаний з webpacker для управління залежностями веб-прикладів.

4. **rails**
   - Основний скрипт для запуску та керування Rails-додатком.

5. **rake**
   - Скрипт для виконання завдань Rake - інструмент для визначення та виконання завдань в Ruby.

6. **setup**
   - Скрипт для налаштування проекту або виконання певних дій перед запуском.

## Інструкції щодо встановлення та запуску проекту з Ruby on Rails та PostgreSQL

1. **Клонування репозиторію**
   - Спочатку склонуйте репозиторій на свій локальний комп'ютер за допомогою команди Git:
     ```
     git clone <URL репозиторію>
     ```
   
2. **Встановлення залежностей**
   - Перейдіть до папки проекту і виконайте команду для встановлення всіх залежностей:
     ```
     bundle install
     ```

3. **Налаштування бази даних PostgreSQL**
   - Впевніться, що у вас встановлено PostgreSQL на вашому комп'ютері.
   - Змініть налаштування бази даних у файлі `config/database.yml`, щоб вони відповідали вашій конфігурації PostgreSQL.

4. **Створення та міграція бази даних**
   - Виконайте команду для створення бази даних та міграції:
     ```
     rails db:create
     rails db:migrate
     ```

5. **Запуск сервера**
   - Після успішного налаштування бази даних ви можете запустити сервер за допомогою команди:
     ```
     rails server
     ```

6. **Перевірка роботи**
   - Після запуску сервера ваш застосунок буде доступний за адресою http://localhost:3000. Відкрийте цю адресу у своєму веб-браузері, щоб переконатися, що все працює коректно.

7. **Готово!**
   - Тепер ваш Ruby on Rails проект запущено та готовий до використання.


