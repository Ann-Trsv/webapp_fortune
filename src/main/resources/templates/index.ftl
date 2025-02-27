<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Главная страница - Fortune</title>
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
            <li class="nav-item"><a class="nav-link yellow" href="#services">Давайте устроим праздник?</a></li>
            <li class="nav-item"><a class="nav-link" href="#about">О нас</a></li>
            <li class="nav-item"><a class="nav-link" href="#attractions">Аттракционы</a></li>
            <li class="nav-item"><a class="nav-link" href="#menu">Меню</a></li>
            <li class="nav-item"><a class="nav-link" href="#gallery">Галерея</a></li>
            <li class="nav-item"><a class="nav-link" href="#contacts">Контакты</a></li>
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
<div class="container-index">
    <section class="section-index first-slide-index">
        <div class="row">
            <div class="col-md-8">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../images/image1.jpeg" class="carousel-image d-block w-100" alt="Фото 1">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/image2.jpeg" class="carousel-image d-block w-100" alt="Фото 2">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/image3.jpeg" class="carousel-image d-block w-100" alt="Фото 3">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/image4.jpeg" class="carousel-image d-block w-100" alt="Фото 4">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/image5.jpeg" class="carousel-image d-block w-100" alt="Фото 5">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                       data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                       data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-4 content-first-slide-index" style="padding-left: 20px">
                <div id="mini-map" class="mini-map">
                    <a href="https://maps.app.goo.gl/6kdNbc8jjGgAC1uS6" target="_blank">
                        <img src="../images/map.png" alt="Мини-карта"></a>
                </div>
                <p class="find-us-text">Ищите нас здесь!</p>
                <h5 class="attraction-cafe-title">АТТРАКЦИОН-КАФЕ</h5>
                <h2 class="fortune-title"><b>FORTUNE</b></h2>
                <p class="fortune-description">— это уникальное место, где каждый посетитель может не только насладиться
                    интересными
                    блюдами, но и испытать свою смелость и удачу!</p>
            </div>
        </div>
    </section>

    <section id="about" class="section-index first-slide-index">
        <div class="row about-row">
            <div class="col-md-3 service-column">
                <div class="service">
                    <p>У нас Вы найдете множество аттракционов для всех возрастов! <br>От экстремальных горок до
                        спокойных прогулочных лодочек на канале.</p>
                    <img src="../images/attraction.svg" alt="attractionlogo" class="service-icon" loading="lazy">
                </div>
                <img src="../images/firework1.png" alt="firework" class="firework-image left-firework" loading="lazy">
            </div>
            <div class="col-md-3 service-column">
                <div class="service">
                    <p>Идеально проведёте <br>праздник или банкет <br>с профессиональными ведущими и аниматорами <br>в
                        самых разных ярких <br>тематических локациях!</p>
                    <img src="../images/events.svg" alt="eventlogo" class="service-icon" loading="lazy">
                </div>
            </div>
            <div class="col-md-3 service-column">
                <div class="service">
                    <p>Вкусно перекусите <br>в уютном кафе с разнообразным меню, <br>блюда которого <br>понравятся даже
                        самому <br>маленькому критику!</p>
                    <img src="../images/menu.svg" alt="menulogo" class="service-icon" loading="lazy">
                </div>
                <img src="../images/firework2.png" alt="firework" class="firework-image right-firework" loading="lazy">
            </div>
        </div>
        <div class="welcome-section">
            <div class="welcome-header content-first-slide-index">
                <h2 class="welcome-title">Добро пожаловать в аттракцион-кафе — "FORTUNE"</h2>
                <h5 class="welcome-subtitle">В самую масштабную развлекательную площадку Самарской области!</h5>
                <p class="welcome-description">Не упускайте возможности окунуться в мир настоящего веселья и радости...
                    <br>Мы ждём именно Вас!</p>
            </div>
        </div>
    </section>

    <section id="services" class="section-index first-slide-index">
        <div class="menu-header content-first-slide-index">
            <h2 class="section-title">ОРГАНИЗАЦИЯ МЕРОПРИЯТИЙ</h2>
            <h5 class="section-subtitle">Доверьтесь профессионалам</h5>
            <p class="section-description">Успейте оставить заявку на праздник... Время ограничено!</p>
            <hr class="hr-circle">
            <div class="center-button">
                <a href="/requests/create">
                    <button type="submit" class="btn btn-custom">СОЗДАТЬ ЗАЯВКУ</button>
                </a>
            </div>

        </div>
    </section>

    <section id="attractions" class="section-index first-slide-index">
        <div class="attractions-header content-first-slide-index">
            <h2 class="section-title">АТТРАКЦИОНЫ</h2>
            <h5 class="section-subtitle">Веселье от мала до велика</h5>
            <p class="section-description">В "Fortune" никто не останется без внимания... <br>На территории
                атракцион-кафе расположено множество игровых зон и аттракционов.</p>
            <div class="center-button">
                <a href="/#attractions">
                    <button type="submit" class="btn btn-custom2">ПОДРОБНЕЕ</button>
                </a>
            </div>
        </div>
        <div class="dark-background">
            <div class="center-button" style="margin: 0">
                <div id="menuCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
                    <div class="carousel-inner" style="border-radius: 35px;">
                        <div class="carousel-item active">
                            <div class="d-flex">
                                <img class="image-menu" src="../images/attraction1.jpeg" class="d-block w-100" alt="..." loading="lazy">
                                <div class="section-mini">
                                    <h5 class="section-subtitle">ЭМОЦИИ И ВПЕЧАТЛЕНИЯ</h5>
                                    <p class="section-description">Наши аттракционы способны подарить людям яркие эмоции
                                        и
                                        незабываемые впечатления - испытать адреналин, радость,
                                        удивление и другие сильные чувства, делая отдых более насыщенным и
                                        запоминающимся.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="d-flex">
                                <img class="image-menu" src="../images/attraction2.jpeg" class="d-block w-100" alt="..." loading="lazy">
                                <div class="section-mini">
                                    <h5 class="section-subtitle">РАЗНООБРАЗИЕ</h5>
                                    <p class="section-description">"Fortune" предлагает широкий выбор развлечений для
                                        разных возрастных групп и предпочтений. Аттракционы могут быть подходящими как
                                        для
                                        детей, так и для взрослых, предлагая разнообразные виды развлечений, от
                                        каруселей до экстремальных горок.</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="d-flex">
                                <img class="image-menu" src="../images/attraction3.jpeg" class="d-block w-100" alt="..." loading="lazy">
                                <div class="section-mini">
                                    <h5 class="section-subtitle">БЕЗОПАСНОСТЬ</h5>
                                    <p class="section-description">Наши аттракционы проходят строгий контроль
                                        качества. Они оснащены необходимыми системами, которые
                                        делают развлечения надёжными и безопасными при соблюдении правил.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="menu" class="section-index first-slide-index ">
        <div class="menu-header content-first-slide-index">
            <h2 class="section-title">ОНЛАЙН-МЕНЮ</h2>
            <h5 class="section-subtitle">Разнообразные блюда на любой вкус</h5>
            <p class="section-description">Хотите попробовать что-то интересное? Тогда Вам к нам! <br>Кафе "Fortune" -
                место незабываемых ощущений... Скорее загляните в гости!</p>
            <div class="center-button">
                <a href="/dishes/list">
                    <button type="submit" class="btn btn-custom2">ПОДРОБНЕЕ</button>
                </a>
            </div>
        </div>
        <div class="dark-background">
            <div class="center-button" style="margin: 0">
                <div id="menuCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
                    <div class="carousel-inner" style="border-radius: 35px;">
                        <div class="carousel-item active">
                            <div class="d-flex">
                                <img class="image-menu" src="../images/menu1.jpeg" class="d-block w-100" alt="..." loading="lazy">
                                <div class="section-mini">
                                    <h5 class="section-subtitle">НАГЛЯДНОСТЬ И УДОБСТВО</h5>
                                    <p class="section-description">Онлайн-меню предоставляет посетителям информацию о
                                        блюдах и напитках, которые можно заказать в кафе. Это ускоряет процесс выбора
                                        желаемого блюда и облегчает приём заказов.</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="d-flex">
                                <img class="image-menu" src="../images/menu2.jpeg" class="d-block w-100" alt="..." loading="lazy">
                                <div class="section-mini">
                                    <h5 class="section-subtitle">ИНДИВИДУЛЬНЫЙ ПОДХОД</h5>
                                    <p class="section-description">В онлайн-меню представлены различные блюда и напитки,
                                        чтобы удовлетворить вкусы разных посетителей. Оно включает в себя блюда разных
                                        кухонь, вегетарианские и диетические варианты, а также широкий выбор
                                        напитков.</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="d-flex">
                                <img class="image-menu" src="../images/zone1.jpeg" class="d-block w-100" alt="..." loading="lazy">
                                <div class="section-mini">
                                    <h5 class="section-subtitle">СОСТАВ И КАЛЛОРИЙНОСТЬ</h5>
                                    <p class="section-description">Наше онлайн-меню содержит информацию о составе блюд и
                                        их калорийности. Это позволяет посетителям сделать более осознанный выбор и
                                        следить за своим питанием.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="gallery" class="section-index first-slide-index" style="overflow:visible">
        <div class="gallery-header content-first-slide-index">
            <div style="position: absolute; width: 350px; height: 500px; left: -85px; bottom: -320px">
                <img class="img-balls1" src="../images/balls.png" alt="balls" loading="lazy">
            </div>
            <div style="position: absolute; width: 350px; height: 500px; right: -85px; bottom: -320px">
                <img class="img-balls2" src="../images/balls.png" alt="balls" loading="lazy">
            </div>
            <h2 class="section-title">ГАЛЕРЕЯ ПРАЗДНИКОВ</h2>
            <h5 class="section-subtitle">Улыбка и смех приятны для всех</h5>
            <p class="section-description">Посмотрите фотографии с наших прошлых мероприятий и праздников. <br>Вдохновитесь
                на организацию своего незабываемого события вместе с нами!<br></p>
            <hr class="hr-circle">
        </div>
        <div class="carousel-container">
            <div id="carousel1" class="carousel slide"
                 style="width: 350px; height: 300px; margin: 10px; object-fit: cover"
                 data-ride="carousel" data-interval="3000">
                <div class="carousel-inner"
                     style="overflow: hidden; border-bottom-left-radius: 35px; border-top-left-radius: 35px;">
                    <div class="carousel-item img-gallery active">
                        <img class="image-gallery" src="../images/gallery1.jpeg" alt="Photo 1" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery2.jpg" alt="Photo 2" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery3.jpeg" alt="Photo 3" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery4.jpeg" alt="Photo 4" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery5.jpeg" alt="Photo 5" loading="lazy">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carousel1" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel1" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div id="carousel2" style="width: 350px; height: 300px; margin: 10px; object-fit: cover"
                 class="carousel slide"
                 data-ride="carousel" data-interval="3000">
                <div class="carousel-inner" style="overflow: hidden;">
                    <div class="carousel-item active ">
                        <img class="image-gallery" src="../images/gallery12.jpeg" alt="Photo 6" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery7.jpg" alt="Photo 7" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery8.jpg" alt="Photo 8" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery9.jpg" alt="Photo 9" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery10.jpg" alt="Photo 10" loading="lazy">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carousel2" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel2" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div id="carousel3"
                 style="width: 350px; height: 300px; margin: 10px; border-radius: 35px; object-fit: cover"
                 class="carousel slide" data-ride="carousel" data-interval="3000">
                <div class="carousel-inner"
                     style="overflow: hidden; border-bottom-right-radius: 35px; border-top-right-radius: 35px;">
                    <div class="carousel-item active">
                        <img class="image-gallery" src="../images/gallery18.jpeg" alt="Photo 6" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery6.jpg" alt="Photo 7" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery13.jpeg" alt="Photo 8" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery14.jpg" alt="Photo 9" loading="lazy">
                    </div>
                    <div class="carousel-item">
                        <img class="image-gallery" src="../images/gallery15.jpg" alt="Photo 10" loading="lazy">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carousel3" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel3" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>

    <section id="contacts" class="section-index first-slide-index contacts-section">
        <div class="content-first-slide-index contacts-content">
            <h2 class="section-title">КОНТАКТЫ</h2>
            <h5 class="section-subtitle">всегда протянем руку</h5>
            <p class="section-description">Свяжитесь с нами по телефону или электронной почте, <br>если у Вас остались
                какие-либо вопросы. <br>Мы с радостью на них ответим!</p>
            <p class="text-left">Адрес электронной почты: <a href="mailto:fortune.cafe.contact@gmail.com" class="blue">fortune.cafe.contact@gmail.com</a>.
            </p>
            <p class="text-left">Номер телефона: <a href="tel:+79271111111" class="blue">+7(927)111-11-11</a>.</p>
            <p>Режим работы:</p>
            <ul type="circle">
                <li>детский сектор с 10:00 до 22:00;</li>
                <li>взрослый сектор с 10:00 до 23:00.</li>
            </ul>
            <p>Режим работы парка и кафе может меняться в зависимости от погодных условий.</p>
            <p>Если возникнут изменения, вся актуальная информация будет размещена на нашем сайте.</p>
            <p>Ваше удовлетворение и комфорт — наша главная цель!</p>
        </div>
        <div class="map-container">
            <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2389.8304569352463!2d50.215357676617785!3d53.20295677224803!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x41661e6d135b0ffb%3A0xca6496be0080ef99!2z0J_QsNGA0Log0JTRgNGD0LbQsdGL!5e0!3m2!1sru!2sru!4v1734611680780!5m2!1sru!2sru"
                    width="100%"
                    height="100%"
                    style="border:0;"
                    allowfullscreen=""
                    loading="lazy">
            </iframe>
        </div>
    </section>
</div>
<footer class="footer text-center text-lg-start">
    <div class="text-center">
        <p><span class="red">© 2024</span>&emsp;<span class="yellow">F</span><span class="fiolet">ORT</span><span
                    class="yellow">UN</span><span class="fiolet">E</span>&emsp;<span
                    class="green">Все права защищены</span>
        </p>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
