<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Детали блюда - Fortune</title>
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
        <h2 class="section-title"><b>Детали блюда</b></h2>
        <h5 class="section-subtitle">№ ${dish.id}</h5>
        <hr class="hr-circle">
        <div class="form-column-2">
            <div class="column" style="padding-left: 20px">
                <p><b>Название блюда:</b> ${dish.name}</p>
                <p><b>Категория:</b>
                    <#if dish.category??>
                        ${dish.category.name!}.
                    <#else>
                        Нет информации.
                    </#if></p>
                <p><b>Калорийность:</b>
                    <#if dish.caloric??>
                        ${dish.caloric!} ккал..
                    <#else>
                        Нет информации.
                    </#if></p>
                <p><b>Продукты:</b>
                    <#if dish.products?? && dish.products?size gt 0>
                        <#list dish.products as product>
                            ${product.name}<#if product_has_next>, <#else>.</#if>
                        </#list>
                    <#else>
                        Нет продуктов.
                    </#if>
                </p>
                <p><b>Вес:</b>
                    <#if dish.weight??>
                        ${dish.weight!} г..
                    <#else>
                        Нет информации.
                    </#if></p>
                <p><b>Цена:</b>
                    <#if dish.price??>
                        ${dish.price!} руб..
                    <#else>
                        Нет информации.
                    </#if></p>
            </div>
            <div class="column" style="text-align: right; padding-right: 20px">
                <#if dish.imagePath??>
                    <img src="${dish.imagePath}" alt="${dish.name}" class="image-gallery" style="border-radius: 35px; height: 300px; width: 300px">
                <#else>
                    Нет изображения.
                </#if>
            </div>
        </div>
        <div>
            <p style="padding: 20px;"><b>Информация:</b>
                <#if dish.info??>
                    ${dish.info!}
                <#else>
                    Нет информации.
                </#if></p>
        </div>
        <div class="center-button">
            <#if isAdmin>
                <a href="/admin/dishes/edit/${dish.id}" class="btn btn-custom">РЕДАКТИРОВАТЬ</a>
            </#if>
            <a href="/dishes/list" class="btn btn-custom2">НАЗАД</a>
            <#if isAdmin>
                <a href="/admin/dishes/delete/${dish.id}" class="btn btn-custom">УДАЛИТЬ</a>
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
</body>
</html>
