//controller.js; 

'use strict'


function userCtrl($scope, $rootScope, $http
    , $routeParams, $location) {

    $rootScope.title = "users";
    $scope.viewflg = "spinner";
    $scope.$on("$viewContentLoaded", function () {
        console.log("ng-view content loaded!");
    });
    $scope.email = "";
    $scope.adduser = function () {

        $location.path("/send_key/select_ekey/" + $scope.sn + "/" + $scope.email);
    }

    $scope.$on("$routeChangeStart", function (event, next, current) {
        //event.preventDefault(); //cancel url change
        console.log("route change start!");
    });
    $scope.Users = [];
    $scope.getUsers = function () {
        $scope.viewflg = "spinner";
        setTimeout(function () {
            $scope.$apply(function () {
                $scope.viewflg = $scope.Users.length > 0 ? "users" : "no users";
            });
        }, 1000);


        //HttpPost($location, $http, "Contacter/List", $rootScope.currentUser, function (data) {
        //    $scope.Users = data.Data; 
        //});
    }
    $scope.getUsers();
};

function changePasswordCtrl($scope, $rootScope, $http, $location) {

    var currentUser = getCurrentUser();

    $scope.change_user = {
        email: currentUser.email,
        password: "",
        confirmnewpassword: "",
        change: true,
        errorfield: "",
    };

    $scope.change = function (change_form) {
        change_form.$errors = "";
        $scope.change_user.change = true;
        $scope.change_user.errorfield = "";
    };
    $scope.changepassword = function (change_form, event) {

        if (!change_form.password.$valid) {
            $scope.change_user.change = false;
            change_form.$errors = "password is required";// "密码不能为空";
            return;
        }
        if (!change_form.newpassword.$valid) {
            $scope.change_user.change = false;

            change_form.$errors = "new password is required";// "密码不能为空";
            return;
        }
        if (change_form.newpassword.$modelValue !== change_form.confirmnewpassword.$modelValue) {
            $scope.change_user.change = false;
            change_form.$errors = "New passwords do not match";// "两次填写的密码不一致";
            return;
        }

        if ($scope.change_user.change) {
            $scope.change_user.change = false;
            $scope.processForm(change_form, event);
        }
        ;
    };

    // process the form
    $scope.processForm = function (change_form, event) {
        var $btn = $(event.currentTarget).button('loading');

        $http({
            method: 'POST',
            url: GetUrl('/account/ChangePassword'),
            data: $.param($scope.change_user),  // pass in data as strings
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
        })
            .success(function (data) {
                if (data.errorCode !== 200) {
                    // if not successful, bind errors to error variables
                    change_form.$errors = data.errorMessage;
                    $btn.button('reset')
                } else {
                    // if successful, bind success message to message  
                    setCurrentUser(null);
                    $location.path("/login");
                }
                // business logic...
            })
            .error(function (e) {
                $btn.button('reset');
            });
    };
}

function profileCtrl($scope, $rootScope, $http
    , $routeParams, $location) {

    $rootScope.title = "profile";
    $scope.$on("$viewContentLoaded", function () {
        console.log("ng-view content loaded!");
    });

    $scope.$on("$routeChangeStart", function (event, next, current) {
        //event.preventDefault(); //cancel url change
        console.log("route change start!");
    });
    $scope.user = {};
    //$scope.myBrithYear = 0;
    //$scope.myGender = "Gender";

    $scope.getUser = function () {

        HttpGet($location, $http, getParamAPI_KEY("Account/Get", $rootScope), function (data) {
            if (data.errorCode === 200) {
                $scope.user = data;
                $scope.user.API_KEY = $rootScope.currentUser.API_KEY;
            }
        });
    }
    $scope.saveProfile = function (event) {
        var $btn = $(event.currentTarget).button('loading');

        HttpPost($location, $http, "Account/Update", $scope.user,
            function (data) {
                if (data.errorCode !== 200) {

                } else {

                }
                $btn.button('reset');
            }, function (e) {
                $btn.button('reset');
            });

    }
    $scope.genders = ["Gender", "Male", "Female"];
    $scope.years = function () {
        var date = new Date();
        var arr = [];
        for (var i = date.getFullYear() - 12; i >= date.getFullYear() - 95; i--) {
            arr.push(i);
        }
        return arr;
    }
    $scope.getUser();
};


function logoutCtrl($scope, $rootScope, $location) {
    $rootScope.title = "logout";
    setCurrentUser(null);
    $location.path('/login');
}

app.controller("loginCtrl",
    function ($scope, $rootScope, $http, $location) {

        $rootScope.title = "Login";
        $scope.login_user = {
            username: "",
            password: "",
            change: true,
            rememberme: false,
        };

        $scope.change = function (login_form) {
            login_form.$errors = "";
            $scope.login_user.change = true;
        };

        $scope.login = function (login_form, event) {
            if (!login_form.username.$valid) {
                $scope.login_user.change = false;
                if (login_form.username.$error) {
                    login_form.$errors = "UserName is required.";
                    return;
                }
            }

            if (!login_form.password.$valid) {
                $scope.login_user.change = false;
                login_form.$errors = "Password is required.";// "密码不能为空";
                return;
            }
            if ($scope.login_user.change) {
                $scope.login_user.change = false;
                $scope.processForm(login_form, event);
            }
            ;
        };
        // process the form
        $scope.processForm = function (login_form, event) {
            var $btn = $(event.currentTarget).button('loading');

            HttpPost($location, $http, "users/login",
                $scope.login_user,
                function (data) {
                    if (data.errorCode !== 200) {
                        // if not successful, bind errors to error variables
                        login_form.$errors = data.errorMessage;
                        $btn.button('reset');
                        return false;
                    } else {
                        // if successful, bind success message to message
                        var login_user = {
                            email: $scope.login_user.email,
                            API_KEY: data.API_KEY,
                            KeyExpire: data.KeyExpire,
                            rememberme: $scope.login_user.rememberme,
                        };
                        setCurrentUser(login_user);
                        //  $location.path("/devices");
                        location.href = GetUrl("projects");
                    }
                },
                function (e) {
                    $btn.button('reset');
                });
        };
    }
)


app.controller("documentAddCtrl",
    function ($location, $scope, $http) {
        $scope.document_add = {
            documentname: "",
            requestpath: "",
            httpmethod: "",
            describes: "",
            change: true,
        }
        $scope.change = function (document_add_form) {
            document_add_form.$errors = "";
            $scope.document_add.change = true;
        };

        $scope.is_document_add = false;

        $scope.addDocument = function (document_add_form, event) {
            if (!document_add_form.documentName.$valid) {
                document_add_form.$errors = "DocumentName is required.";
                return;
            }
            if (!document_add_form.requestPath.$valid) {
                document_add_form.$errors = "RequestPath is required.";
                return;
            }
            if ($scope.document_add.change) {
                $scope.document_add.change = false;
                $scope.processForm(document_add_form, event);
            }
        };
        // process the form
        $scope.processForm = function (document_add_form, event) {
            var $btn = $(event.currentTarget).button('loading');

            HttpPostUrl($location, $http, location.href + "/add/",
                $scope.document_add,
                function (data) {
                    if (data.errorCode !== 200) {
                        // if not successful, bind errors to error variables
                        request_form.$errors = data.errorMessage;
                        $btn.button('reset');
                        return false;
                    } else {
                        // if successful, bind success message to message
                        location.reload();
                    }
                },
                function (e) {
                    $btn.button('reset');
                });
        };

        $scope.deleteModel = {
            title:"",
            deleteCallback:{}
        };
        $scope.deleteDocument = function (docId, docName) {
            $scope.deleteModel.title = docName;
            $scope.deleteModel.deleteCallback = function () {
                HttpPostUrl($location, $http, location.href + "/delete/" + docId,
                    {docId: docId},
                    function (data) {
                        if (data.errorCode !== 200) {
                            // if not successful, bind errors to error variables
                           // request_form.$errors = data.errorMessage;
                            return false;
                        } else {
                            // if successful, bind success message to message
                            location.reload();
                        }
                    },
                    function (e) {
                    });
            }

            $('#deleteModal').modal('show');
        };

    }
)


app.controller("documentCtrl",
    function ($location, $scope, $http) {
        $scope.requestField_add = {
            fieldname: "",
            fieldtypedname: "",
            isrequired: "0",
            parametertype: "Request",
            describes: "",
            defaultvalue: "",
            change: true,
        }

        $scope.requestSample_add = {
            title: "",
            content: "",
            sampletype: "Request",
            change: true,
        }
        $scope.change = function (request_form) {
            request_form.$errors = "";
            $scope.requestField_add.change = true;
            $scope.requestSample_add.change = true;
        };

        $scope.is_request_field_add = false;
        $scope.is_request_sample_add = false;


        $scope.addRequestField = function (request_form, event) {
            if (!request_form.fieldName.$valid) {
                request_form.$errors = "FieldName is required.";
                return;
            }
            if (!request_form.fieldTypeName.$valid) {
                request_form.$errors = "FieldTypeName is required.";
                return;
            }
            if ($scope.requestField_add.change) {
                $scope.requestField_add.change = false;
                $scope.processForm(request_form, $scope.requestField_add, "addField", event);
            }
        };

        $scope.addRequestSample = function (request_form, event) {
            if (!request_form.title.$valid) {
                request_form.$errors = "Title is required.";
                return;
            }
            if (!request_form.content.$valid) {
                request_form.$errors = "Content is required.";
                return;
            }
            if ($scope.requestSample_add.change) {
                $scope.requestSample_add.change = false;
                $scope.processForm(request_form, $scope.requestSample_add, "addSample", event);
            }
        };

        // process the form
        $scope.processForm = function (field_form, model, path, event) {
            var $btn = $(event.currentTarget).button('loading');
            var url = location.href + "/" + path;
            HttpPostUrl($location, $http, url,
                model,
                function (data) {
                    if (data.errorCode !== 200) {
                        // if not successful, bind errors to error variables
                        field_form.$errors = data.errorMessage;
                        $btn.button('reset');
                        return false;
                    } else {
                        // if successful, bind success message to message
                        location.reload();
                    }
                },
                function (e) {
                    $btn.button('reset');
                });
        };


        $scope.deleteField = function (field_form, fieldId, event) {
            var $btn = $(event.currentTarget).button('loading');

            HttpPostUrl($location, $http, location.href + "/deleteField/" + fieldId,
                {fieldId: fieldId},
                function (data) {
                    if (data.errorCode !== 200) {
                        // if not successful, bind errors to error variables
                        field_form.$errors = data.errorMessage;
                        $btn.button('reset');
                        return false;
                    } else {
                        // if successful, bind success message to message
                        location.reload();
                    }
                },
                function (e) {
                    $btn.button('reset');
                });
        };

        $scope.deleteModel = {
            title:"",
            deleteCallback:{}
        };

        $scope.deleteSample = function (sample_form, sampleId, sampleTitle) {
            $scope.deleteModel.title = sampleTitle;
            $scope.deleteModel.deleteCallback = function () {
                HttpPostUrl($location, $http, location.href + "/deleteSample/" + sampleId,
                    {sampleId: sampleId},
                    function (data) {
                        if (data.errorCode !== 200) {
                            // if not successful, bind errors to error variables
                            sample_form.$errors = data.errorMessage;

                            return false;
                        } else {
                            // if successful, bind success message to message
                            location.reload();
                        }
                    },
                    function (e) {

                    });
            }

            $('#deleteModal').modal('show');
        };

        //-----------------------------------------------------------------------

        $scope.responseField_add = {
            fieldname: "",
            fieldtypedname: "",
            parametertype: "Response",
            isrequired: "0",
            describes: "",
            defaultvalue: "",
            change: true,
        }

        $scope.responseSample_add = {
            title: "",
            content: "",
            sampletype: "Response",
            change: true,
        }

        $scope.change = function (response_form) {
            response_form.$errors = "";
            $scope.responseField_add.change = true;
            $scope.responseSample_add.change = true;
        };

        $scope.is_response_field_add = false;
        $scope.is_response_sample_add = false;


        $scope.addResponseField = function (response_form, event) {
            if (!response_form.fieldName.$valid) {
                response_form.$errors = "FieldName is required.";
                return;
            }
            if (!response_form.fieldTypeName.$valid) {
                response_form.$errors = "FieldTypeName is required.";
                return;
            }
            if ($scope.responseField_add.change) {
                $scope.responseField_add.change = false;
                $scope.processForm(response_form, $scope.responseField_add, "addField", event);
            }
        };


        $scope.addResponseSample = function (request_form, event) {
            if (!request_form.title.$valid) {
                request_form.$errors = "Title is required.";
                return;
            }
            if (!request_form.content.$valid) {
                request_form.$errors = "Content is required.";
                return;
            }
            if ($scope.responseSample_add.change) {
                $scope.responseSample_add.change = false;
                $scope.processForm(request_form, $scope.responseSample_add, "addSample", event);
            }
        };


    }
)

function registerCtrl($scope, $rootScope, $http, $location) {

    $rootScope.title = "CREATE AN ACCOUNT!";

    $scope.register_user = {
        email: "",
        username: "",
        password: "",
        confirmpassword: "",
        registersn: "",
        password1: "",
        change: true,
        errorfield: "",
        //VerificationCode:"code"
    };

    $scope.change = function (register_form) {
        register_form.$errors = "";
        $scope.register_user.change = true;
        $scope.register_user.errorfield = "";
    };
    $scope.register = function (register_form, event) {


        if (!register_form.email.$valid) {
            $scope.register_user.change = false;

            if (register_form.email.$error) {
                if ($scope.register_user.email === "") {
                    register_form.$errors = "email is required"; //"邮箱不能为空";
                    return;
                }
                register_form.$errors = "Email format is not correct.";//"邮箱格式不正确";
                return;
            }

        }


        if (!register_form.password.$valid) {
            $scope.register_user.change = false;
            //if (register_form.password.$error) {
            //    if (register_form.password.$error.minlength) {
            //        register_form.$errors = "Password length should not be less than 6";// "输入的密码长度不能小于6";
            //        return;
            //    }
            //}
            register_form.$errors = "password is required";// "密码不能为空";
            return;
        }
        if (register_form.password.$modelValue !== register_form.confirmpassword.$modelValue) {
            $scope.register_user.change = false;
            register_form.$errors = "Passwords do not match";// "两次填写的密码不一致";
            return;
        }
        if ($scope.register_user.change) {
            $scope.register_user.change = false;
            $scope.processForm(register_form, event);
        }
        ;
    };

    // process the form
    $scope.processForm = function (register_form, event) {
        var $btn = $(event.currentTarget).button('loading');

        $http({
            method: 'POST',
            url: GetUrl('/account/register'),
            data: $.param($scope.register_user),  // pass in data as strings
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
        })
            .success(function (data) {
                if (data.errorCode !== 200) {
                    // if not successful, bind errors to error variables
                    register_form.$errors = data.errorMessage;
                    $btn.button('reset')
                } else {
                    // if successful, bind success message to message   
                    $location.path("/login");
                }
                // business logic...
            })
            .error(function (e) {
                $btn.button('reset');
            });
    };
}

function forgotPasswordCtrl($scope, $rootScope, $http, $location) {

    $rootScope.title = "forgot password";
    $scope.forgotpassword_user = {
        email: "",
        password: "",
        confirmpassword: "",
        change: true,
        errorfield: "",
        VerificationCode: ""
    };

    $scope.change = function (forgotpassword_form) {
        forgotpassword_form.$errors = "";
        forgotpassword_form.Message = "";
        $scope.forgotpassword_user.change = true;
        $scope.forgotpassword_user.errorfield = "";
    };

    $scope.getVerificationCode = function (forgotpassword_form, event) {
        if (!forgotpassword_form.email.$valid) {
            $scope.forgotpassword_user.change = false;

            if (forgotpassword_form.email.$error) {
                if ($scope.forgotpassword_user.email === "") {
                    forgotpassword_form.$errors = "email is required"; //"邮箱不能为空";
                    return;
                }
                forgotpassword_form.$errors = "Email format is not correct.";//"邮箱格式不正确";
                return;
            }

        }

        if ($scope.forgotpassword_user.change) {
            $scope.forgotpassword_user.change = false;
            $scope.processGetVerificationCode(forgotpassword_form, event);
        }
        ;
    };

    $scope.processGetVerificationCode = function (forgotpassword_form, event) {
        var $btn = $(event.currentTarget).button('loading');

        $http({
            method: 'POST',
            url: GetUrl('/account/GetResetPasswordCode'),
            data: $.param($scope.forgotpassword_user),  // pass in data as strings
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
        })
            .success(function (data) {
                if (data.errorCode !== 200) {
                    // if not successful, bind errors to error variables
                    forgotpassword_form.$errors = data.errorMessage;
                    $btn.button('reset')
                } else {
                    forgotpassword_form.Message = data.errorMessage + "  ,please check your email.";
                    //     $btn.button('reset');

                    var time = 0;
                    var interval = setInterval(function () {
                        time++;
                        $(event.currentTarget).text((60 - time) + " seconds after re acquisition");

                        if (time >= 60) {
                            clearInterval(interval);
                            forgotpassword_form.Message = "";
                            $btn.button('reset');
                        }
                    }, 1000);
                }
                // business logic...
            })
            .error(function (e) {
                $btn.button('reset');
            });
    };


    $scope.resetpassword = function (forgotpassword_form, event) {
        if (!forgotpassword_form.email.$valid) {
            $scope.forgotpassword_user.change = false;

            if (forgotpassword_form.email.$error) {
                if ($scope.forgotpassword_user.email === "") {
                    forgotpassword_form.$errors = "email is required"; //"邮箱不能为空";
                    return;
                }
                forgotpassword_form.$errors = "Email format is not correct.";//"邮箱格式不正确";
                return;
            }

        }

        if (!forgotpassword_form.password.$valid) {
            $scope.forgotpassword_user.change = false;
            forgotpassword_form.$errors = "password is required";// "密码不能为空";
            return;
        }
        if (forgotpassword_form.password.$modelValue !== forgotpassword_form.confirmpassword.$modelValue) {
            $scope.forgotpassword_user.change = false;
            forgotpassword_form.$errors = "Passwords do not match";// "两次填写的密码不一致";
            return;
        }
        if ($scope.forgotpassword_user.change) {
            $scope.forgotpassword_user.change = false;
            $scope.processForm(forgotpassword_form, event);
        }
        ;
    };

    // process the form
    $scope.processForm = function (forgotpassword_form, event) {
        var $btn = $(event.currentTarget).button('loading');

        $http({
            method: 'POST',
            url: GetUrl('/account/resetpassword'),
            data: $.param($scope.forgotpassword_user),  // pass in data as strings
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
        })
            .success(function (data) {
                if (data.errorCode !== 200) {
                    // if not successful, bind errors to error variables
                    forgotpassword_form.$errors = data.errorMessage;
                    $btn.button('reset')
                } else {
                    // if successful, bind success message to message   
                    $location.path("/login");
                }
                // business logic...
            })
            .error(function (e) {
                $btn.button('reset');
            });
    };
}

function deleteAccountCtrl($scope, $rootScope, $http, $location) {

    $rootScope.title = "delete account";
    $scope.delete_user = {
        email: "",
        password: "",
        change: false,
    };
    $scope.change = function (delete_form) {
        delete_form.$errors = "";
        $scope.delete_user.change = true;
    };

    $scope.deleteAccount = function (delete_form, event) {
        $scope.delete_user.change = false;

        $scope.currentUser = getCurrentUser();
        if (!delete_form.email.$valid) {
            if (delete_form.email.$error) {
                if ($scope.delete_user.email === "") {
                    delete_form.$errors = "email is required"; //"邮箱不能为空";
                    return;
                }
                delete_form.$errors = "email format is not correct";//"邮箱格式不正确";
                return;
            }
        }
        if ($scope.delete_user.email !== $scope.currentUser.email) {
            delete_form.$errors = "Other account cannot be deleted";//"邮箱格式不正确";
            return;
        }

        if (!delete_form.password.$valid) {
            delete_form.$errors = "password is required";// "密码不能为空";
            return;
        }

        $scope.delete_user.API_KEY = $scope.currentUser.API_KEY;

        var $btn = $(event.currentTarget).button('loading');

        HttpPost($location, $http, "Account/DeleteAccount", $scope.delete_user,
            function (data) {
                if (data.errorCode === 200) {
                    $location.path("/login");
                } else {
                    delete_form.$errors = data.errorMessage;
                }
                $btn.button('reset');
            }, function (e) {
                $btn.button('reset');
            });

    }

};


function getParamAPI_KEY(url, $rootScope) {
    var param = "?API_KEY=" + $rootScope.currentUser.API_KEY;
    return url + param;
}