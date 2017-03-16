

package lwplvx.docman.model;

import java.util.Date;

/**
 * 用户信息
 *
 * @author lwp
 * @since 2016-2-20 23:40
 */
public class CustomType extends DocModelBase {
    private String typeName;
    private String typeMode;

    private Date updateTime;

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeMode() {
        return typeMode;
    }

    public void setTypeMode(String typeMode) {
        this.typeMode = typeMode;
    }
}
