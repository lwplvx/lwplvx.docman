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
import lwplvx.docman.mapper.DocumentMapper;
import lwplvx.docman.model.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author lwp
 * @since 2017-02-21 00:03
 */
@Service
public class DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    public List<Document> getAll(Document model) {
        if (model.getPage() != null && model.getRows() != null) {
            PageHelper.startPage(model.getPage(), model.getRows());
        }
        return documentMapper.selectAll();
    }
    public List<Document> getByAppId(Integer id) {
        return documentMapper.selectByAppId(id);
    }
    public Document getByDocName(String documentName,Integer appId) {
        HashMap map=new HashMap();
        map.put("documentName",documentName);
        map.put("appId",appId);
        return documentMapper.selectByDocumentName(map);
    }


    public Document getById(Integer id) {
        return documentMapper.selectByPrimaryKey(id);
    }

    public void deleteById(Integer id) {
        documentMapper.deleteByPrimaryKey(id);
    }

    public void save(Document model) {
        if (model.getId() != null) {
            documentMapper.updateByPrimaryKey(model);
        } else {
            documentMapper.insert(model);
        }
    }

    public void add(Document model) {
        documentMapper.insert(model);
    }
}
