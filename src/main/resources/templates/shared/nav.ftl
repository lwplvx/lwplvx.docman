
<nav class="navbar navbar-toggleable-sm navbar-light bg-info fixed-top ">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${request.contextPath}/">Docman</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link text-uppercase" href="#">About</a>
            </li>
        </ul>
        <ul class="navbar-nav ">

        <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="#"> ${user.username}</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-danger my-2 my-sm-0 text-uppercase rounded-0"
                   href="${request.contextPath}/users/logout">Logout</a>
            </li>
        <#else>
            <li class="nav-item">
                <a class="nav-link text-uppercase " href="${request.contextPath}/login">Login <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-uppercase" href="${request.contextPath}/register">Register</a>
            </li>
        </#if>
        </ul>

    </div>
</nav>