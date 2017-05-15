
<#assign layout="shared/_layoutAccount.ftl"/>
<#assign title="Register"/>

<body class="main-body bg-app">

<#assign renderBody>

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

</#assign>


<!-- page specific plugin scripts -->
<#assign specificScripts>

<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/app/common.js"></script>
<script src="${request.contextPath}/static/js/angular-route.min.js"></script>
<script src="${request.contextPath}/static/js/app/app.js"></script>
<script src="${request.contextPath}/static/js/app/controller.js"></script>

</#assign>
