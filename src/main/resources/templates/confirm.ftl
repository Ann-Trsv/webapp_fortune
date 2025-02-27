<!-- src/main/resources/templates/confirm.ftl -->
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Подтверждение регистрации - Fortune</title>
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
            <li class="nav-item"><a class="nav-link" href="/#contacts">Контакты</a></li>
            <li class="nav-item"><a class="nav-link" href="/#gallery">Галерея</a></li>
            <li class="nav-item"><a class="nav-link green" href="/register">Регистрация</a></li>
            <li class="nav-item"><a class="nav-link red" href="/login">Вход</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <section class="section">
        <h2 class="name-form"><b>ПОДТВЕРЖДЕНИЕ РЕГИСТРАЦИИ</b></h2>
        <form>
            <div class="form-group text-center">
                <#if message??>
                    <p>${message}</p>
                </#if>
                <#if isConfirmed?? && isConfirmed>
                    <p>Ваша регистрация была успешно подтверждена!<br>Теперь вы можете <a href="/login">войти</a>.</p>
                    <img class="img-status" src="../images/ok.svg" alt="ВХОД">
                </#if>
                <#if !isConfirmed?? || !isConfirmed>
                    <p class="text-center">Пожалуйста, попробуйте снова позднее.</p>
                    <div class="center-button">
                        <a href="/" class="btn btn-custom2">ГЛАВНАЯ</a>
                    </div>
                    <img class="img-status" src="../images/error.svg" alt="ОШИБОЧКА">
                </#if>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>