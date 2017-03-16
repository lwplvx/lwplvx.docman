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

import lwplvx.docman.mapper.UserMapper;
import lwplvx.docman.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lwp
 * @since 2016-01-31 21:42
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<User> getAll(User User) {
        if (User.getPage() != null && User.getRows() != null) {
            PageHelper.startPage(User.getPage(), User.getRows());
        }
        return userMapper.selectAll();
    }

    public User getByUserName(String userName) {
        // return userMapper.selectByPrimaryKey(1);
        return userMapper.getByUserName(userName);
    }

    public User getById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public void deleteById(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    public void save(User country) {
        if (country.getId() != null) {
            userMapper.updateByPrimaryKey(country);
        } else {
            userMapper.insert(country);
        }
    }
}
