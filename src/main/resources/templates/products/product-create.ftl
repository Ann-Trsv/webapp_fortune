<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание продукта - Fortune</title>
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
        <h2 class="name-form"><b>СОЗДАНИЕ ПРОДУКТА</b></h2>
        <hr class="hr-circle">
        <form action="/admin/products/create" method="post">
            <div class="form-group">
                <label for="name">Название:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <#if error??>
                <div class="form-control error-message">${error}</div>
            </#if>
            <div class="center-button">
                <button class="btn-custom2" type="submit">СОЗДАТЬ</button>
                <a href="/admin/products/list" class="btn btn-custom2">НАЗАД</a>
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
