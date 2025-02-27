<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Редактирование блюда - Fortune</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function validateForm() {
            var name = document.getElementById('name').value;
            var category = document.getElementById('category').value;
            var caloric = document.getElementById('caloric').value;
            var weight = document.getElementById('weight').value;
            var info = document.getElementById('info').value;
            var price = document.getElementById('price').value;
            var checkboxes = document.getElementsByName('products');
            var isChecked = false;

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isChecked = true;
                    break;
                }
            }

            var valid = true;

            if (name.length < 2) {
                document.getElementById('nameError').innerText = 'Название блюда должно содержать минимум два символа.';
                valid = false;
            } else {
                document.getElementById('nameError').innerText = '';
            }

            if (category === "") {
                document.getElementById('categoryError').innerText = 'Пожалуйста, выберите категорию.';
                valid = false;
            } else {
                document.getElementById('categoryError').innerText = '';
            }

            if (caloric === "") {
                document.getElementById('caloricError').innerText = 'Пожалуйста, укажите калорийность.';
                valid = false;
            } else {
                document.getElementById('caloricError').innerText = '';
            }

            if (weight === "") {
                document.getElementById('weightError').innerText = 'Пожалуйста, укажите вес.';
                valid = false;
            } else {
                document.getElementById('weightError').innerText = '';
            }

            if (info === "") {
                document.getElementById('infoError').innerText = 'Пожалуйста, укажите информацию.';
                valid = false;
            } else {
                document.getElementById('infoError').innerText = '';
            }

            if (price === "") {
                document.getElementById('priceError').innerText = 'Пожалуйста, укажите цену.';
                valid = false;
            } else {
                document.getElementById('priceError').innerText = '';
            }

            if (!isChecked) {
                document.getElementById('productsError').innerText = 'Пожалуйста, выберите хотя бы один продукт.';
                valid = false;
            } else {
                document.getElementById('productsError').innerText = '';
            }

            return valid;
        }

        function checkDataPresence() {
            var products = document.querySelectorAll('#productsList li');
            var categories = document.querySelectorAll('#category option');

            if (products.length === 0) {
                document.getElementById('noProductsMessage').style.display = 'block';
            }

            if (categories.length === 1) { // Assuming the first option is the placeholder
                document.getElementById('noCategoriesMessage').style.display = 'block';
            }
        }

        function adjustTextareaHeight(textarea) {
            textarea.style.height = 'auto';
            textarea.style.height = (textarea.scrollHeight) + 'px';
        }

        window.onload = function () {
            checkDataPresence();
            var textarea = document.getElementById('info');
            textarea.addEventListener('input', function () {
                adjustTextareaHeight(textarea);
            });
            adjustTextareaHeight(textarea);
        };
    </script>
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
        <h2 class="section-title"><b>Редактирование блюда</b></h2>
        <form action="/admin/dishes/edit/${dish.id}" method="post" enctype="multipart/form-data"
              onsubmit="return validateForm();">
            <div class="form-group">
                <label for="name">Название блюда:</label>
                <input type="text" class="form-field" id="name" name="name" value="${(dish.name)!}"/>
                <span id="nameError" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="category">Категория:</label>
                <select class="form-field" id="category" name="categoryId">
                    <option value="">Выберите категорию</option>
                    <#list categories as category>
                        <option value="${category.id}"
                                <#if ((dish.category??)&&(category == dish.category))>selected</#if>>${category.name}</option>
                    </#list>
                </select>
                <span id="categoryError" class="error-message"></span>
                <span id="noCategoriesMessage" class="info-message" style="display: none;">Информация о категориях отсутствует.</span>
            </div>

            <div class="form-group">
                <label for="caloric">Калорийность:</label>
                <input type="number" class="form-field" id="caloric" name="caloric" value="${(dish.caloric)!}"/>
                <span id="caloricError" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="weight">Вес:</label>
                <input type="number" class="form-field" id="weight" name="weight" value="${(dish.weight)!}"/>
                <span id="weightError" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="info">Информация:</label>
                <textarea class="form-field auto-expand" id="info" name="info">${(dish.info)!}</textarea>
                <span id="infoError" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="price">Цена:</label>
                <input type="number" class="form-field" id="price" name="price" value="${(dish.price)!}"/>
                <span id="priceError" class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="image">Изображение:</label>
                <input type="file" class="form-field" id="image" name="image"/>
            </div>
            <div class="form-group">
                <label for="products">Продукты:</label>
                <ul id="productsList">
                    <#list products as product>
                        <li>
                            <#assign isProductDish = false>
                            <#list dish.products as dishProduct>
                                <#if dishProduct.id == product.id>
                                    <#assign isProductDish = true>
                                    <#break>
                                </#if>
                            </#list>
                            <input type="checkbox" name="products" value="${product.id}"
                                   <#if isProductDish>checked</#if>>
                            <span>${product.name}</span>
                        </li>
                    </#list>
                </ul>
                <span id="productsError" class="error-message"></span>
                <span id="noProductsMessage" class="info-message" style="display: none;">Информация о продуктах отсутствует.</span>
            </div>

            <div class="center-button">
                <button type="submit" class="btn btn-custom">СОХРАНИТЬ ИЗМЕНЕНИЯ</button>
                <a href="/dishes/details/${dish.id}" class="btn btn-custom2">НАЗАД</a>
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
</script>
</body>
</html>