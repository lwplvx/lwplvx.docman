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

import lwplvx.docman.Result.ResultBase;
import lwplvx.docman.model.*;
import lwplvx.docman.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author lwp
 * @since 2017-02-21 00:02
 */
@RestController
@RequestMapping("/{projectName}/{appName}/docs")
public class DocumentController extends BaseController {
    @Autowired
    private DocumentSamplesService documentSamplesService;
    @Autowired
    private DocumentFieldsService documentFieldsService;
    @Autowired
    private DocumentService documentService;
    @Autowired
    private AppService appService;
    @Autowired
    private ProjectService projectService;

    @RequestMapping
    public ModelAndView index(HttpSession session, @PathVariable String projectName, @PathVariable String appName) {

        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            return Redirect("/projects");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            return Redirect("/apps");
        }
        List<Document> docList = documentService.getByAppId(app.getId());
        ModelAndView result = new ModelAndView("docs/index");

        User user = (User) session.getAttribute("User");
        if (user != null) {
            result.addObject("user", user);
        }

        result.addObject("docList", docList);

        return result;// View("projects/index", "projectList", projectList);
    }

    @RequestMapping(value = "{docName}")
    public ModelAndView view(HttpSession session, @PathVariable String projectName,
                             @PathVariable String appName, @PathVariable String docName) {

        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            return Redirect("/projects");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            return Redirect("/apps");
        }
        Document doc = documentService.getByDocName(docName, app.getId());
        if (doc == null) {
            return Redirect(String.format("%s/%s/docs", project.getProjectName(), app.getAppName()));
        }


        List<Documentfields> fieldList = documentFieldsService.getByDocumentId(doc.getId(), doc.getUserid());
        List<Documentsamples> sampleList = documentSamplesService.getByDocumentId(doc.getId(), doc.getUserid());

        ModelAndView result = new ModelAndView("docs/view");
        User user = (User) session.getAttribute("User");
        if (user != null) {
            result.addObject("user", user);
        }
        result.addObject("doc", doc);
        result.addObject("fieldList", fieldList);
        result.addObject("sampleList", sampleList);
        List<Document> docList = documentService.getByAppId(app.getId());
        result.addObject("docList", docList);

        List<String> groups = new ArrayList<String>();
        for (Document item : docList) {
            if (groups.contains(item.getGroupname()))
            {continue;}
            groups.add(item.getGroupname());
        }
        result.addObject("groups", groups);
        return result;// View("projects/index", "projectList", projectList);
    }

    @RequestMapping(value = "{docName}/deleteField/{id}")
    public ResultBase deleteField(HttpSession session, @PathVariable String projectName,
                                  @PathVariable String appName, @PathVariable String docName, @PathVariable Integer id) {

        User user = (User) session.getAttribute("User");
        if (user == null) {
            return error("user == null");
        }
        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            //  return Redirect("/projects");
            return error("project == null");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            return error("app == null");
        }
        Document doc = documentService.getByDocName(docName, app.getId());
        if (doc == null) {
            return error("doc == null，" + docName);
        }
        Documentfields df = documentFieldsService.getById(id);
        if (doc.getId() != df.getDocumentid()) {
            return error("doc.getId() != df.getDocumentid()");
        }
        documentFieldsService.deleteById(id);
        return success();
    }

    @RequestMapping(value = "delete/{id}")
    public ResultBase delete(HttpSession session, @PathVariable String projectName,
                             @PathVariable String appName, @PathVariable Integer id) {

        User user = (User) session.getAttribute("User");
        if (user == null) {
            return error("user == null");
        }
        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            return error("project == null");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            return error("app == null");
        }
        Document doc = documentService.getById(id);
        if (doc.getAppid() != app.getId()) {
            return error("doc.getAppid() != app.getId()");
        }
        documentService.deleteById(id);

        // documentFieldsService.deleteBydocumentId(user.getId(),id);
        // documentSamplesService.deleteBydocumentId(user.getId(),id);

        return success();
    }


    @RequestMapping(value = "{docName}/addField", method = RequestMethod.POST)
    public ResultBase addField(HttpSession session, Documentfields model
            , @PathVariable String projectName, @PathVariable String appName, @PathVariable String docName) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            //  return Redirect("/login");
        }
        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            //   return Redirect("/projects");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            //  return Redirect("/apps");
        }
        Document doc = documentService.getByDocName(docName, app.getId());
        if (doc == null) {
            //  return Redirect("/apps");
        }
        model.setUserid(user.getId());
        model.setDocumentid(doc.getId());

        documentFieldsService.add(model);
        return success();
    }

    @RequestMapping(value = "{docName}/addSample", method = RequestMethod.POST)
    public ResultBase addSample(HttpSession session, Documentsamples model
            , @PathVariable String projectName, @PathVariable String appName, @PathVariable String docName) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return error("user == null");
        }
        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            return error("project == null");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            return error("app == null");
        }
        Document doc = documentService.getByDocName(docName, app.getId());
        if (doc == null) {
            return error("doc == null");
        }
        model.setUserid(user.getId());
        model.setDocumentid(doc.getId());

        documentSamplesService.add(model);
        return success();
    }


    @RequestMapping(value = "{docName}/deleteSample/{id}")
    public ResultBase deleteSample(HttpSession session, @PathVariable String projectName,
                                   @PathVariable String appName, @PathVariable String docName, @PathVariable Integer id) {

        User user = (User) session.getAttribute("User");
        if (user == null) {
            return error("user == null");
        }
        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            return error("project == null");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            return error("app == null");
        }

        Document doc = documentService.getByDocName(docName, app.getId());

        if (doc == null) {
            return error("doc == null");
        }
        Documentsamples docS = documentSamplesService.getById(id);
        if (docS.getDocumentid() != doc.getId()) {
            return error("docS.getDocumentid() != doc.getId()");
        }
        documentSamplesService.deleteById(id);
        return success();
    }


    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ResultBase add(HttpSession session, Document model
            , @PathVariable String projectName, @PathVariable String appName) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            // return Redirect("/login");
        }
        Project project = projectService.getByProjectName(projectName);
        if (project == null) {
            //   return Redirect("/projects");
        }
        App app = appService.getByAppName(appName, project.getId());
        if (app == null) {
            //  return Redirect("/apps");
        }

        model.setUserid(user.getId());
        model.setAppid(app.getId());

        documentService.add(model);
        return success();
    }


}
