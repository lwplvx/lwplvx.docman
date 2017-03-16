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

import lwplvx.docman.model.Project;
import lwplvx.docman.model.User;
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
@RequestMapping("/projects")
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService ProjectService;


    @RequestMapping
    public ModelAndView index(HttpSession session) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return Redirect("/login");
        }
        List<Project> projectList = ProjectService.getByUserId(user.getId());
        ModelAndView result=new ModelAndView("projects/index");
        result.addObject("user",user);
        result.addObject("projectList",projectList);

        return result;// View("projects/index", "projectList", projectList);
    }

    @RequestMapping(value = "/add")
    public Project add() {
        return new Project();
    }

    @RequestMapping(value = "/view/{id}")
    public Project view(@PathVariable Integer id) {
        // ModelAndView result = new ModelAndView();
        Project Project = ProjectService.getById(id);
        return Project;
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelMap delete(@PathVariable Integer id) {
        ModelMap result = new ModelMap();
        ProjectService.deleteById(id);
        result.put("msg", "删除成功!");
        return result;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelMap save(Project Project) {
        ModelMap result = new ModelMap();
        String msg = Project.getId() == null ? "新增成功!" : "更新成功!";
        ProjectService.save(Project);
        result.put("Project", Project);
        result.put("msg", msg);
        return result;
    }
}
