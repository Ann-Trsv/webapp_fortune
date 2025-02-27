<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Профиль - Fortune</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
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
        <h2 class="section-title"><b>ПРОФИЛЬ</b></h2>
        <h5 class="section-subtitle">Добро пожаловать, ${user.username}!</h5>
        <hr class="hr-circle">
        <p>Ваши права: ${user.role.name}.</p>
        <p>Ваша почта: ${user.email}.</p>
        <div style="margin-top: 100px">
            <#if user.role.name == "ADMIN">
                <div class="center-button">
                    <a href="/dishes/list">
                        <button type="submit" class="btn btn-custom">МЕНЮ</button>
                    </a>
                    <a href="/profile">
                        <button type="submit" class="btn btn-custom">ПОЛЬЗОВАТЕЛИ</button>
                    </a>
                </div>
                <div class="center-button">
                    <a href="/requests/list">
                        <button type="submit" class="btn btn-custom">ЗАЯВКИ</button>
                    </a>
                    <button id="backButton" class="btn btn-custom2">НАЗАД</button>
                    <a href="/logout">
                        <button type="submit" class="btn btn-custom">ВЫХОД</button>
                    </a>
                </div>
            </#if>
            <#if user.role.name == "USER">
                <div class="center-button">
                    <a href="/requests/list">
                        <button type="submit" class="btn btn-custom">МОИ ЗАЯВКИ</button>
                    </a>
                    <a href="/logout">
                        <button type="submit" class="btn btn-custom">ВЫХОД</button>
                    </a>
                </div>
                <div class="center-button">
                    <button id="backButton" class="btn btn-custom2">НАЗАД</button>
                    <a href="/profile/delete/${user.id}">
                        <button type="submit" class="btn btn-custom">УДАЛИТЬ ПРОФИЛЬ</button>
                    </a>
                </div>
            </#if>
        </div>
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
            window.history.back();
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

