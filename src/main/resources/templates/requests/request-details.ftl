<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Детали заявки №${request.id} - Fortune</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
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
        <h2 class="section-title"><b>ДЕТАЛИ ЗАЯВКИ №${request.id}</b></h2>
        <h5 class="section-subtitle">Статус: ${request.comment}</h5>
        <hr class="hr-circle">
        <div class="form-column-2">
            <div class="column" style="padding-left: 40px">
                <p>Название Мероприятия: ${request.event.name}</p>
                <p>Дата: ${request.event.date}</p>
                <p>Время Начала: ${request.event.startTime}</p>
                <p>Время Окончания: ${request.event.endTime}</p>
                <p>Пожелания:
                    <#if request.event.info??>${request.event.info}<#else>Информация отсутствует.</#if>
                </p>
            </div>
            <div class="column" style="padding-left: 40px">
                <p>Фамилия: ${request.lastName}</p>
                <p>Имя: ${request.firstName}</p>
                <p>Отчество: ${request.patronymic}</p>
                <p>Телефон: ${request.phone}</p>
            </div>
        </div>
        <#if ((isConfirmationNull) || (user.role.name == "ADMIN"))>
            <div class="form-column-2">
                <div class="column">
                    <form class="center-button" action="/requests/edit/${request.id}" method="get">
                        <button class="btn-custom" type="submit">РЕДАКТИРОВАТЬ</button>
                    </form>
                </div>
                <div class="column">
                    <div class="center-button">
                        <form action="/requests/delete/${request.id}" method="post">
                            <button class="btn-custom" type="submit">УДАЛИТЬ</button>
                        </form>
                    </div>
                </div>
                <div class="center-button">
                    <button id="backButton" class="btn btn-custom2" type="button">НАЗАД</button>
                </div>
            </div>
        <#else>
            <div class="form-control orange-message">Заявка обработана. Редактирование и удаление невозможно!</div>
            <div class="center-button">
                <a href="/requests/list" class="btn btn-custom2" TYPE="button">НАЗАД</a>
            </div>
        </#if>

    </section>
</div>

<footer class="footer text-center text-lg-start">
    <div class="text-center">
        <p><span class="red">© 2024</span>&emsp;<span class="yellow">F</span><span class="fiolet">ORT</span><span
                    class="yellow">UN</span><span class="fiolet">E</span>&emsp;<span
                    class="green">Все права защищены</span></p>
    </div>
</footer>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const backButton = document.getElementById('backButton');
        backButton.addEventListener('click', function () {
            if (window.history.length > 1) {
                window.history.back();
            } else {
                window.location.href = '/';
            }
        });
    });
</script>
</body>
</html>
