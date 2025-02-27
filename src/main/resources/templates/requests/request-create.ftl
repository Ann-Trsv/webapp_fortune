<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание заявки - Fortune</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#phone').mask('+7 (000) 000-00-00');
        });

        document.addEventListener('DOMContentLoaded', function () {
            const textarea = document.getElementById('description');

            textarea.addEventListener('input', function () {
                this.style.height = 'auto'; // Сброс высоты для корректного измерения
                this.style.height = (this.scrollHeight) + 'px'; // Установка новой высоты
            });
        });
    </script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap CSS для стилизации -->
    <link href="/css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <!-- Popper.js для всплывающих подсказок и модальных окон -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Bootstrap JS для интерактивных компонентов -->
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top">
    <a class="navbar-brand" href="/"><span class="yellow">F</span><span class="fiolet">ORT</span><span
                class="yellow">UN</span><span class="fiolet">E</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link yellow" href="/#services">Давайте устроим праздник?</a></li>
            <li class="nav-item"><a class="nav-link" href="/#about">О нас</a></li>
            <li class="nav-item"><a class="nav-link" href="/#attractions">Аттракционы</a></li>
            <li class="nav-item"><a class="nav-link" href="/#menu">Меню</a></li>
            <li class="nav-item"><a class="nav-link" href="/#gallery">Галерея</a></li>
            <li class="nav-item"><a class="nav-link" href="/#contacts">Контакты</a></li>
            <li class="nav-item"><a class="nav-link green" href="/profile">Профиль</a></li>
            <li class="nav-item"><a class="nav-link red" href="/logout">Выход</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <section class="section-index more-height">
        <h2 class="name-form"><b>СОЗДАНИЕ ЗАЯВКИ</b></h2>
        <hr class="hr-circle">
        <form action="/requests/create" method="post">
            <div class="form-column-2">
                <div class="column">
                    <div class="form-group">
                        <label for="name">Название мероприятия:</label>
                        <input type="text" id="name" name="name" class="form-control" value="${(event.name)!}">
                        <#if (nameError?? && nameError != '')>
                            <div class="form-control error-message">${nameError}</div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="date">Дата:</label>
                        <input type="date" id="date" name="date" class="form-control" value="${(event.date)!}">
                        <#if (dateError?? && dateError != '')>
                            <div class="form-control error-message">${dateError}</div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="startTime">Время начала:</label>
                        <input type="time" id="startTime" name="startTime" class="form-control"
                               value="${(event.startTime)!}">
                        <#if (startTimeError?? && startTimeError != '')>
                            <div class="form-control error-message">${startTimeError}</div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="endTime">Время окончания:</label>
                        <input type="time" id="endTime" name="endTime" class="form-control" value="${(event.endTime)!}">
                        <#if (endTimeError?? && endTimeError != '')>
                            <div class="form-control error-message">${endTimeError}</div>
                        </#if>
                    </div>
                </div>
                <div class="column">
                    <div class="form-group">
                        <label for="lastName">Фамилия:</label>
                        <input type="text" id="lastName" name="lastName" class="form-control"
                               value="${(request.lastName)!}">
                        <#if (lastNameError?? && lastNameError != '')>
                            <div class="form-control error-message">${lastNameError}</div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="firstName">Имя:</label>
                        <input type="text" id="firstName" name="firstName" class="form-control"
                               value="${(request.firstName)!}">
                        <#if (firstNameError?? && firstNameError != '')>
                            <div class="form-control error-message">${firstNameError}</div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="patronymic">Отчество:</label>
                        <input type="text" id="patronymic" name="patronymic" class="form-control"
                               value="${(request.patronymic)!}">
                        <#if (patronymicError?? && patronymicError != '')>
                            <div class="form-control error-message">${patronymicError}</div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <label for="phone">Телефон:</label>
                        <input type="text" id="phone" name="phone" class="form-control" value="${(request.phone)!}">
                        <#if (phoneError?? && phoneError != '')>
                            <div class="form-control error-message">${phoneError}</div>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Пожелания:</label>
                <textarea class="form-control auto-expand" id="info" name="info">${(event.info)!}</textarea>
                <#if (descriptionError?? && descriptionError != '')>
                    <div class="form-control error-message">${descriptionError}</div>
                </#if>
                <#if (error?? && error != '')>
                    <div class="form-control error-message">${error}</div>
                </#if>
            </div>
            <div class="center-button">
                <button class="btn-custom" type="submit">СОЗДАТЬ ЗАЯВКУ</button>
                <a href="/" class="btn btn-custom2">ГЛАВНАЯ</a>
            </div>
        </form>

    </section>
</div>
<footer class="footer text-center text-lg-start">
    <div class="text-center">
        <p><span class="red">© 2024</span>&emsp;<span class="yellow">F</span><span class="fiolet">ORT</span><span
                    class="yellow">UN</span><span class="fiolet">E</span>&emsp;<span
                    class="green">Все права защищены</span></p>
    </div>
</footer>
</body>
</html>
