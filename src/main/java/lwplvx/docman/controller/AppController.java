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
import lwplvx.docman.model.App;
import lwplvx.docman.model.Project;
import lwplvx.docman.model.User;
import lwplvx.docman.service.AppService;
import lwplvx.docman.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lwp
 * @since 2017-02-21 00:02
 */
@RestController
@RequestMapping("/{projectName}/apps")
public class AppController extends  BaseController{

    @Autowired
    private AppService AppService;
    @Autowired
    private ProjectService ProjectService;

    @RequestMapping
    public ModelAndView index(HttpSession session,@PathVariable String projectName) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return Redirect("/login");
        }
        Project project= ProjectService.getByProjectName(projectName);
        if (project==null                )
        {
            return Redirect("/projects");
        }
        List<App> appList = AppService.getByProjectId(project.getId());
        ModelAndView result=new ModelAndView("apps/index");
        result.addObject("user",user);
        result.addObject("appList",appList);
        result.addObject("projectName",projectName);

        return result;// View("projects/index", "projectList", projectList);
    }

    @RequestMapping(value = "/add")
    public App add() {
        return new App();
    }


    @RequestMapping(value = "/delete/{id}")
    public ModelMap delete(@PathVariable Integer id) {
        ModelMap result = new ModelMap();
        AppService.deleteById(id);
        result.put("msg", "删除成功!");
        return result;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelMap save(App App) {
        ModelMap result = new ModelMap();
        String msg = App.getId() == null ? "新增成功!" : "更新成功!";
        AppService.save(App);
        result.put("App", App);
        result.put("msg", msg);
        return result;
    }
}
