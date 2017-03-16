

package lwplvx.docman.model;

import java.util.Date;

/**
 * 用户信息
 *
 * @author lwp
 * @since 2016-2-20 23:40
 */
public class DocModelBase extends BaseEntity {
    private int userid;
    private String describes;
    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

}
