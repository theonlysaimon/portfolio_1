<!DOCTYPE html>
<html lang="en">
<head>
   <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>
<div class="description">
   <h2 class="form__contact">Наши контакты</h2>
   <div class="contact-info">
      <div class="item">
      <i class="icon fa fa-home"></i>
      г. Самара, ул. Московское шоссе 77б, каб. 02-13
      </div>
      <div class="item">
      <i class="icon fa fa-phone"></i>
      +7 (927) 774 31-19
      </div>
      <div class="item">
      <i class="icon fa fa-envelope"></i>
      nickita.smn2014@yandex.ru
      </div>
      <div class="item">
      <i class="icon fa fa-clock-o"></i>
      Пн - Пт: 09:00 - 17:00 (местное)
      </div>
   </div>
</div>
   <div class="description_form"> 
      <form action="" id="description_form" class="form_email">
         <h2 class="form__title">Обратная связь</h2>
         <div class="form__group">
            <input id="formName" class="form__input _req" name="name" type="text">
            <label for="formName" class="form__label">Ваше имя*</label>
         </div>
         <div class="form__group">
            <input id="formEmail" class="form__input _req _email" name="email" type="text">
            <label for="formEmail" class="form__label">e-mail*</label>
         </div>
         <div class="form__group">
            <textarea id="formText" class="form__input_area_doc _req" name="message" type="text"></textarea>
            <label for="formText" class="form__label">Ваше сообщение*</label>
         </div>
         <div class="checkbox">
            <input id="formAgreement" type="checkbox" name="agreement" class="checkbox__input _req">
            <label for="formAgreement" class="checkbox__label"><span>Я даю согласие на обработку <a href="politica.php">перосональных данных*</a></span></label>
         </div>
         <button class="form__button" type="submit">Отправить</button>
      </form> 
</div>
<?php include "end-head.html";?>
</body>
<?php include "scripts.php";?>
</html>
