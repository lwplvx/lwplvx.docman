

package lwplvx.docman.model;

/**
 * 用户信息
 *
 * @author lwp
 * @since 2016-2-20 23:40
 */
public class Documentfields extends DocModelBase {
    private int documentid;
    private String fieldname;
    private String fieldtypename;
    private String parametertype;
    private String defaultvalue;
    private Boolean isrequired;

    public int getDocumentid() {
        return documentid;
    }

    public void setDocumentid(int documentid) {
        this.documentid = documentid;
    }

    public String getFieldname() {
        return fieldname;
    }

    public void setFieldname(String fieldname) {
        this.fieldname = fieldname;
    }

    public String getFieldtypename() {
        return fieldtypename;
    }

    public void setFieldtypename(String fieldtypename) {
        this.fieldtypename = fieldtypename;
    }

    public String getDefaultvalue() {
        return defaultvalue;
    }

    public void setDefaultvalue(String defaultvalue) {
        this.defaultvalue = defaultvalue;
    }

    public Boolean getIsrequired() {
        return isrequired;
    }

    public void setIsrequired(Boolean isrequired) {
        this.isrequired = isrequired;
    }

    public String getParametertype() {
        return parametertype;
    }

    public void setParametertype(String parametertype) {
        this.parametertype = parametertype;
    }
}
