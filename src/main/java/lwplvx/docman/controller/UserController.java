/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014-2016 abel533@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package lwplvx.docman.controller;

import com.github.pagehelper.PageInfo;

import lwplvx.docman.Result.ResultError;
import lwplvx.docman.Result.ResultBase;
import lwplvx.docman.Result.ResultRequired;
import lwplvx.docman.model.User;
import lwplvx.docman.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lwp
 * @since 2015-12-19 11:10
 */
@RestController
@RequestMapping("/users")
//@SessionAttributes({"User"})        //此处定义此Controller中将要创建和使用哪些session中的对象名
public class UserController extends BaseController {

    @Autowired
    private UserService UserService;

    @RequestMapping
    public PageInfo<User> getAll(User User) {
        List<User> UserList = UserService.getAll(User);
        return new PageInfo<User>(UserList);
    }

    @RequestMapping("/index")
    public ModelAndView index(User User) {
        ModelAndView result = new ModelAndView("user/index");
        List<User> UserList = UserService.getAll(User);
        result.addObject("UserList", UserList);
        return result;
    }

    @RequestMapping(value = "/get/{username}", method = RequestMethod.GET)
    public User login(@PathVariable String username) {

        // ModelAndView result = new ModelAndView();
        User User = UserService.getByUserName(username);
        return User;
    }

    @RequestMapping(value = "/login")
    public ResultBase login(User model,HttpSession session) {
        if (model.getUsername() == null) {
            return new ResultRequired("Username");
        }
        if (model.getPassword() == null) {
            return new ResultRequired("Password");
        }
        User user = UserService.getByUserName(model.getUsername());

        if (user == null) {
            return new ResultError("Username not exist");
        }
        if (!user.getPassword().equals(model.getPassword())) {
            return new ResultError("Password Error");
        }
        session.setAttribute("User", user);
       //modelMap.addAttribute("User", user);        //成功将user存入session中
     //   modelMap.addAttribute("Y", 1);                   //成功将1存入session中
        // modelMap.get()
        ResultBase res = new ResultBase();
        res.setData(user);
        return res;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session) {
        //@ModelAttribute("User")相当于将session中名为"User"的对象注入user对象中
        //sessionStatus中的setComplete方法可以将session中的内容全部清空
       // sessionStatus.setComplete();
        session.removeAttribute("User");
        return Redirect("/");
    }

    @RequestMapping(value = "/register")
    public ResultBase register(User model) {
        if (model.getUsername() == null) {
            return new ResultRequired("Username");
        }
        if (model.getPassword() == null) {
            return new ResultRequired("Password");
        }

        User user = UserService.getByUserName(model.getUsername());
        if (user != null) {
            return new ResultError("user != null");
        }
        UserService.save(model);

        ResultBase res = new ResultBase();
        res.setData(user);
        return res;
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelMap save(User User) {
        ModelMap result = new ModelMap();
        String msg = User.getId() == null ? "新增成功!" : "更新成功!";
        UserService.save(User);
        result.put("User", User);
        result.put("msg", msg);
        return result;
    }
}
