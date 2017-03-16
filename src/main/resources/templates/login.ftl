<html ng-app="docmanApp">
<head>
    <title>Login</title>

    <link href="${request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>

<body class="main-body bg-app">

<nav class="navbar navbar-toggleable-sm navbar-light bg-white fixed-top">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${request.contextPath}">Docman</a>

    <div class="collapse navbar-collapse ">

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link text-uppercase " href="${request.contextPath}/login">Login <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-uppercase" href="${request.contextPath}/register">Register</a>
            </li>
        </ul>

    </div>
</nav>

<div class="container-fluid " ng-controller="loginCtrl">
    <section >
        <div class="card-login-width card m-auto bg-fade rounded-0 border-0">
            <div style="height:0.2rem;" class="bg-info">
            </div>
            <div class="m-1 pt-2">
                <h5 class="card-title text-center">Login</h5>
            </div>
            <form class="card-block" name="login_form">
                <div class="form-group"
                     ng-class="{'has-danger':login_form.username.$invalid&&!login_user.change}">
                    <label for="email">Email</label>
                    <input type="text" id="email" ng-model="login_user.username" name="username"
                           ng-class="{'form-control-danger':login_form.username.$invalid&&!login_user.change}"
                           ng-change="change(login_form)"
                           class="form-control rounded-0" placeholder="Email"
                           required=""></input>
                </div>
                <div class="form-group"
                     ng-class="{'has-danger':login_form.password.$invalid&&!login_user.change}">
                    <label for="password">Password</label>
                    <input type="password" id="password" ng-model="login_user.password" name="password"
                           ng-class="{'form-control-danger':login_form.password.$invalid&&!login_user.change}"
                           ng-change="change(login_form)"
                           class="form-control rounded-0" placeholder="Password"
                           required=""></input>
                </div>
                <div class="form-group">
                    <button type="button" ng-click="login(login_form,$event)"
                            class="btn btn-success btn-block rounded-0">Login
                    </button>
                </div>
                <div class="text-center">
                    <a class="btn-link" href="register">Register</a>
                </div>
            </form>
        </div>
    </section>

    <section class="ng-cloak  m-0 p-0" ng-cloak
             ng-hide="!login_form.$errors">
        <div class="alert alert-danger fixed-bottom fade show rounded-0" role="alert">
            <button type="button" class="close" ng-click="change(login_form)">
                <span aria-hidden="true">&times;</span>
                <span class="sr-only">Close</span>
            </button>
            <strong>Warning!</strong>
            {{login_form.$errors}}
        </div>

    </section>
</div>
<script>
    var serverPath ="${request.contextPath}";
</script>

<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/static/js/app/common.js"></script>
<script src="${request.contextPath}/static/js/angular-route.min.js"></script>
<script src="${request.contextPath}/static/js/app/app.js"></script>
<script src="${request.contextPath}/static/js/app/controller.js"></script>

</body>
</html>