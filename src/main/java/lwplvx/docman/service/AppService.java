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

package lwplvx.docman.service;

import com.github.pagehelper.PageHelper;
import lwplvx.docman.mapper.AppMapper;
import lwplvx.docman.model.App;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author lwp
 * @since 2017-02-21 00:03
 */
@Service
public class AppService {

    @Autowired
    private AppMapper appMapper;

    public List<App> getAll(App model) {
        if (model.getPage() != null && model.getRows() != null) {
            PageHelper.startPage(model.getPage(), model.getRows());
        }
        return appMapper.selectAll();
    }
    public List<App> getByProjectId(Integer id) {

        return appMapper.selectByProjectId(id);
    }
    public App getByAppName(String appName,Integer projectId) {
        HashMap map=new HashMap();
        map.put("appName", appName);
        map.put("projectId", projectId);
        return appMapper.selectByAppName(map);
    }


    public App getById(Integer id) {
        return appMapper.selectByPrimaryKey(id);
    }

    public void deleteById(Integer id) {
        appMapper.deleteByPrimaryKey(id);
    }

    public void save(App model) {
        if (model.getId() != null) {
            appMapper.updateByPrimaryKey(model);
        } else {
            appMapper.insert(model);
        }
    }
}
