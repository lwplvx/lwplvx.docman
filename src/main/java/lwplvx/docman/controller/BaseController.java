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
import lwplvx.docman.Result.ResultError;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author lwp
 * @since 2015-12-19 11:10
 */
@RestController
public class BaseController {

    public ResultBase success() {
        ResultBase res = new ResultBase();
        return res;
    }
    public ResultBase error(String errMsg) {
        ResultError res = new ResultError(errMsg);
        return res;
    }

    protected ModelAndView Redirect(String viewName) {
        ModelAndView view = new ModelAndView("redirect:"+viewName);
        return view;
    }
    protected ModelAndView View(String vieName) {
        ModelAndView view = new ModelAndView(vieName);
        return view;
    }

    protected ModelAndView View(String vieName, String dataName, Object data) {
        ModelAndView view = new ModelAndView(vieName);
        view.addObject(dataName, data);
        return view;
    }

}
