//app.js;

'use strict'

var app = angular.module('docmanApp', ["ngRoute"]);

function GetUrl(url) {
   return serverPath + "/" + url;
   // return "/" + url;
};

function HttpGet($location, $http, url, success) {
    /* 
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    */
    $http({
        method: 'GET',
        url: GetUrl(url),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded', 
        }
    }).then(function onSuccess(response) {
        // Handle success
        var data = response.data;
        var status = response.status;
        var statusText = response.statusText;
        var headers = response.headers;
        var config = response.config;
        //响应成功
        if (data.ResultCode === 10) {
            console.log(data);

            setCurrentUser(null);
            $location.path("/login");
        } else { 
            success(data);
        }

    }).catch(function onError(response) {
        // Handle error
        var data = response.data;
        var status = response.status;
        var statusText = response.statusText;
        var headers = response.headers;
        var config = response.config;
        //处理响应失败
        console.log(data);
        if (error) {
            error(data);
        }
    });

}

function HttpPost($location, $http, url, param, success, error) {
    if (!param.API_KEY) {
        var cUser = getCurrentUser();
        if (cUser) { 
            param.API_KEY = cUser.API_KEY;
        } 
    }

    $http({
        method: 'POST',
        url: GetUrl(url),
        data: $.param(param),  // pass in data as strings
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    }).then(function onSuccess(response) {
        // Handle success
        var data = response.data;
        var status = response.status;
        var statusText = response.statusText;
        var headers = response.headers;
        var config = response.config;

        //响应成功
        if (data.ResultCode === 10) {
            console.log(data);
            setCurrentUser(null);
            $location.path("/login");
        } else {
            success(data);
        }
    }).catch(function onError(response) {
        // Handle error
        var data = response.data;
        var status = response.status;
        var statusText = response.statusText;
        var headers = response.headers;
        var config = response.config;
        //处理响应失败
        console.log(data);
        if (error) {
            error(data);
        }
    });
}


function HttpPostUrl($location, $http, url, param, success, error) {
    if (!param.API_KEY) {
        var cUser = getCurrentUser();
        if (cUser) {
            param.API_KEY = cUser.API_KEY;
        }
    }

    $http({
        method: 'POST',
        url: url,
        data: $.param(param),  // pass in data as strings
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    }).then(function onSuccess(response) {
        // Handle success
        var data = response.data;
        var status = response.status;
        var statusText = response.statusText;
        var headers = response.headers;
        var config = response.config;

        //响应成功
        if (data.ResultCode === 10) {
            console.log(data);
            setCurrentUser(null);
            $location.path("/login");
        } else {
            success(data);
        }
    }).catch(function onError(response) {
        // Handle error
        var data = response.data;
        var status = response.status;
        var statusText = response.statusText;
        var headers = response.headers;
        var config = response.config;
        //处理响应失败
        console.log(data);
        if (error) {
            error(data);
        }
    });
}


function isEmpty(value) {
    return value === null || value === "";
}

function isUndefined(value) { return typeof value === 'undefined'; }
function isDefined(value) { return typeof value !== 'undefined'; }
function isFunction(value) { return typeof value === 'function'; }

function getCurrentUser() {
    //读取 
    var obj = sessionStorage.currentUser;
    if (isUndefined(obj) || isEmpty(obj)) {
        //重新转换为对象 
        obj = getCookie("currentUser");
        if (isUndefined(obj) || isEmpty(obj)) {
            return null;
        }
    }
    return JSON.parse(obj);
}

function setCurrentUser(currentUser) {
    if (currentUser == null) {
        sessionStorage.currentUser = null;
        delCookie("currentUser");
        return;
    }
    var str = JSON.stringify(currentUser);
    //存入 
    sessionStorage.currentUser = str;

    if (currentUser.rememberme) {
        setCookie("currentUser", str);
    }
}

function uuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
}

function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

//使用示例
//setCookie("name", "hayden");
//alert(getCookie("name"));

function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

//如果需要设定自定义过期时间
//那么把上面的setCookie　函数换成下面两个函数就ok;
//程序代码
function setCookie(name, value, time) {
    if (!time) {
        time = 'd14';
    }
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec * 1);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

//
function getsec(str) {
    // alert(str);
    var str1 = str.substr(1, str.length) * 1;
    var str2 = str.substr(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    }
    else if (str2 == "h") {
        return str1 * 60 * 60 * 1000;
    }
    else if (str2 == "d") {
        return str1 * 24 * 60 * 60 * 1000;
    }
}
//这是有设定过期时间的使用示例：
//s20是代表20秒
//h是指小时，如12小时则是：h12
//d是天数，30天则：d30
//setCookie("name", "hayden", "s20");

function getRootPath_web() {
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht + projectName);
}

