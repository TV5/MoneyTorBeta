<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Moneytor
 * -------------------------------------------------------------------------
 -->
 
<!DOCTYPE html>
<html>
<head>

  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

	
  <!-- Site Properities -->
  <title>Login</title>
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.min.css')}" type="text/css">
  <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'form.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'transition.js')}"></script>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
  $(document)
    .ready(function() {
      $('.ui.form')
        .form({
          fields: {
            username: {
              identifier  : 'username',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your username'
                },                
                {
                    type   : 'length[8]',
                    prompt : 'Your username must be at least 8 characters'
                  }
                  
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your password must be at least 8 characters'
                }
              ]
            }
          }
        })
      ;
    })
  ;
  </script>
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="${resource(dir: 'images', file: 'logo.png')}" class="image">
      <div class="content">
        MoneyTor
      </div>
    </h2>

    <g:form class="ui large form" name="form" controller="main" action="login" id="form">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <g:textField name="username" value="${username}" placeholder="username" />
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <g:passwordField name="password" value="${password}" placeholder="password"/>
          </div>
        </div>

        <g:actionSubmit class="ui fluid large teal submit button" value="login" action="login"/>
      </div>
    <g:if test="${flash.error}">
	    <div class="ui message" ><a>error: ${flash.error}</a></div>
    </g:if>



    </g:form>

  </div>
</div>

</body>

</html>
