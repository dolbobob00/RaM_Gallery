# Rick and Morty Character Explorer

A Flutter application that demonstrates modern app architecture and best practices through a Rick and Morty character explorer interface.

## Features

- 🔄 Character browsing with infinite scroll
- ⭐ Favorite characters management
- 🌓 Dark/Light theme support
- 📱 Offline support with data caching
- 🎯 Clean Architecture implementation
- 🎨 Custom animations and transitions

Screenshots of screens:
https://imgur.com/a/Rskf1jG

#### Функциональные требования
**Главный экран (Список персонажей):**
1. ✅ Отображение списка персонажей в карточках
2. ✅ Изображение персонажа
3. ✅ Имя персонажа
4. ✅ Дополнительные характеристики (статус, вид, локация)
5. ✅ Кнопка "звездочка" с анимацией

**Экран "Избранное":**
1. ✅ Список избранных персонажей
2. ✅ Карточки как на главном экране
3. ✅ Сортировка (по имени, статусу, виду)
4. ✅ Удаление из избранного

**Навигация:**
1. ✅ BottomNavigationBar
2. ✅ Анимированные переходы между экранами

**Дополнительно:**
1. ✅ Пагинация при скролле
2. ✅ Кэширование данных
3. ✅ Сохранение фаворитов (Hive)

#### Нефункциональные требования
**State Management:**
1. ✅ Использован BLoC/Cubit

**Зависимости:**
1. ✅ Минимальный набор (Hive для БД, Dio для сети)

**API-запросы:**
1. ✅ REST API

**Код:**
1. ✅ Чистая архитектура
2. ✅ Структурированный код
3. ✅ Читаемость

#### Дополнительные плюсы
**Темная тема:**
1. ✅ Поддержка светлой/темной темы
2. ✅ Возможность переключения

**Анимации:**
1. ✅ Анимация иконки избранного
2. ✅ Анимации переходов между экранами
3. ✅ Анимации при удалении из избранного
