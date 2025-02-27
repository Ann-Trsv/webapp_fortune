<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Заявки - Fortune</title>
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
        <h2 class="section-title"><b>ЗАЯВКИ</b></h2>
        <hr class="hr-circle">
        <div class="form-column-2">
            <div class="column">
                <#list requests as request>
                    <ul type="circle">
                        <li>
                            <p><a style="color: black" href="/requests/details/${request.id}">№${request.id}
                                    - ${request.event.name} (${request.event.date}) - <span
                                            class="blue">${request.comment}</span></a></p>
                        </li>
                    </ul>
                </#list>
                <div class="pagination">
                    <#if pageNumber?? && (pageNumber > 1)>
                        <a href="/requests/list?page=${pageNumber - 1}" class="btn btn-link">${pageNumber - 1}</a>
                    </#if>
                    <span class="btn btn-link disabled">${pageNumber}</span>
                    <#if pageNumber?? && (pageNumber < totalPages)>
                        <a href="/requests/list?page=${pageNumber + 1}" class="btn btn-link">${pageNumber + 1}</a>
                    </#if>
                </div>
            </div>
            <div class="column">
                <form action="/requests/search" method="GET">
                    <div class="form-group">
                        <label for="name">Название мероприятия:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name!}">
                    </div>
                    <div class="form-group">
                        <label for="date">Дата:</label>
                        <input type="date" class="form-control" id="date" name="date" value="${date!}">
                    </div>
                    <div class="center-button">
                        <button type="submit" style="margin: 40px 0" class="btn btn-custom">ПОИСК</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="center-button">
            <a href="/requests/create" class="btn btn-custom">СОЗДАТЬ ЗАЯВКУ</a>
            <a href="/" class="btn btn-custom2">ГЛАВНАЯ</a>
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
