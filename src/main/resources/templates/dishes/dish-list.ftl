<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Онлайн-меню - Fortune</title>
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
            <#if isAuthenticated>
                <li class="nav-item"><a class="nav-link green" href="/profile">Профиль</a></li>
                <li class="nav-item"><a class="nav-link red" href="/logout">Выход</a></li>
            <#else>
                <li class="nav-item"><a class="nav-link green" href="/register">Регистрация</a></li>
                <li class="nav-item"><a class="nav-link red" href="/login">Вход</a></li>
            </#if>
        </ul>
    </div>
</nav>
<div class="container">
    <section class="section-index more-height">
        <h2 class="section-title"><b>Онлайн-меню</b></h2>
        <hr class="hr-circle">
        <div class="center-button" style="margin: 20px">
            <#if isAdmin>
                <a href="/admin/categories/list" class="btn btn-custom">КАТЕГОРИИ</a>
                <a href="/admin/products/list" class="btn btn-custom">ПРОДУКТЫ</a>
                <a href="/admin/dishes/create" class="btn btn-custom">СОЗДАТЬ БЛЮДО</a>
            </#if>
            <a href="/" class="btn btn-custom2">ГЛАВНАЯ</a>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Изображение</th>
                <th>Название</th>
                <th>Категория</th>
                <th>Цена (руб.)</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <#list dishes as dish>
                <tr>
                    <td>
                        <#if dish.imagePath??>
                            <img src="${dish.imagePath}" alt="${dish.name}" class="image-gallery" style="margin: 20px; border-radius: 35px; height: 300px; width: 300px">
                        <#else>
                            Нет изображения
                        </#if>
                    </td>
                    <td>${dish.name}</td>
                    <td>
                        <#if dish.category??>
                            ${dish.category.name!}
                        <#else>
                            Нет категории
                        </#if>
                    </td>
                    <td>
                        <#if dish.price??>
                            ${dish.price!}
                        <#else>
                            Нет информации
                        </#if>
                    </td>
                    <td>
                        <a href="/dishes/details/${dish.id}" class="btn btn-link">О блюде</a>

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
</body>
</html>
