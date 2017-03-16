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
<div class="container-fluid ">
    <section ng-controller="loginCtrl">
        <div class="card-login-width card m-auto bg-fade rounded-0 border-0">
            <div style="height:0.2rem;" class="bg-success">
            </div>
            <div class="m-1 pt-2">
                <h5 class="card-title text-center">Register</h5>
            </div>
            <form class="card-block">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" id="email"
                           class="form-control rounded-0" placeholder="Email"
                           required="required"></input>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password"
                           class="form-control rounded-0" placeholder="Password"
                           required="required"></input>
                </div>
                <div class="form-group">
                    <label for="cccpassword">ccc Password</label>
                    <input type="password" id="cccpassword"
                           class="form-control rounded-0" placeholder="ccc Password"
                           required="required"></input>
                </div>
                <div class="form-group">
                    <button type="submit"
                            class="btn btn-info btn-block rounded-0">Register
                    </button>
                </div>
                <div class="text-center">
                    <a class="btn-link" href="login">Login</a>
                </div>
            </form>
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
<script src="${request.contextPath}/static/js/app/app.js"></script>
<script src="${request.contextPath}/static/js/app/controller.js"></script>
</body>
</html>