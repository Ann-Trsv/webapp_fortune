<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Категории - Fortune</title>
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
        <h2 class="section-title"><b>КАТЕГОРИИ</b></h2>
        <hr class="hr-circle">
        <div class="center-button">
            <a href="/" type="button" class="btn btn-custom2">ГЛАВНАЯ</a>
            <a href="/admin/categories/create" class="btn btn-custom">СОЗДАТЬ КАТЕГОРИЮ</a>
            <a href="/dishes/list" type="button" class="btn btn-custom2">МЕНЮ</a>
        </div>
        <form action="/admin/categories/list" method="get" class="center-button" style="margin-bottom: 20px">
            <input type="text" name="search" value="${search!}" placeholder="Поиск по названию"
                   class="form-control mr-2"/>
            <input type="number" name="id" value="${id!}" placeholder="Поиск по ID" class="form-control mr-2"/>
            <button type="submit" class="btn btn-custom" style="margin-right: 0">ПОИСК</button>
        </form>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Действия</th>
            </tr>
            </thead>
            <tbody>
            <#list categories as category>
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>
                        <a href="/admin/categories/edit/${category.id}" class="btn btn-link">Редактировать</a>
                        <a href="/admin/categories/delete/${category.id}" class="btn btn-link">Удалить</a>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </section>
</div>
<footer class="footer text-center text-lg-start">
    <div class="text-center">
        <p><span class="red">© 2024</span>&emsp;<span class="yellow">F</span><span class="fiolet">ORT</span><span
                    class="yellow">UN</span><span class="fiolet">E</span>&emsp;<span
                    class="green">Все права защищены</span></p>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>