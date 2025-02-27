<!-- src/main/resources/templates/register.ftl -->
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация - Fortune</title>
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
            <li class="nav-item"><a class="nav-link" href="/#menu">Меню</a></li>
            <li class="nav-item"><a class="nav-link" href="/#attractions">Аттракционы</a></li>
            <li class="nav-item"><a class="nav-link" href="/#gallery">Галерея</a></li>
            <li class="nav-item"><a class="nav-link" href="/#contacts">Контакты</a></li>
            <li class="nav-item"><a class="nav-link green" href="/register">Регистрация</a></li>
            <li class="nav-item"><a class="nav-link red" href="/login">Вход</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <section class="section more-height">
        <h2 class="name-form">РЕГИСТРАЦИЯ</h2>
        <div style="padding: 0 5px"><hr class="hr-circle"></div>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Имя пользователя:</label>
                <input type="text" id="username" name="username" class="form-control">
                <#if usernameError??>
                    <div class="form-control error-message">${usernameError}</div>
                </#if>
                <#if errors?? && errors.username??>
                    <div class="form-control error-message">${errors.username}</div>
                </#if>
            </div>
            <div class="form-group">
                <label for="email">Почта:</label>
                <input type="email" id="email" name="email" class="form-control">
                <#if emailError??>
                    <p class="form-control error-message">${emailError}</p>
                </#if>
                <#if errors?? && errors.email??>
                    <div class="form-control error-message">${errors.email}</div>
                </#if>
            </div>
            <div class="form-group">
                <label for="password">Пароль:</label>
                <input type="password" id="password" name="password" class="form-control">
                <input type="checkbox" id="show-password-checkbox" onclick="showPassword()">
                <label for="show-password-checkbox" style="margin-bottom:0">Показать пароль</label>
                <#if errors?? && errors.password??>
                    <div class="form-control error-message">${errors.password}</div>
                </#if>
            </div>
            <div class="center-button">
                <button type="submit" class="btn btn-custom">ЗАРЕГИСТРИРОВАТЬСЯ</button>
            </div>
            <div class="center-button">
                <a href="/" type="button" class="btn btn-custom2">ГЛАВНАЯ</a>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function showPassword() {
        var passwordField = document.getElementById("password");
        var checkbox = document.getElementById("show-password-checkbox");

        if (checkbox.checked) {
            passwordField.type = "text";
        } else {
            passwordField.type = "password";
        }
    }
</script>
</body>
</html>

