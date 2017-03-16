

package lwplvx.docman.model;

/**
 * 用户信息
 *
 * @author lwp
 * @since 2016-2-20 23:40
 */
public class CustomTypeFields extends DocModelBase {
    private int customTypeId;
    private String fieldName;
    private String fieldTypeName;
    private String defaultValue;



    public String setFieldName() {
        return fieldName;
    }

    public void getFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public int getCustomTypeId() {
        return customTypeId;
    }

    public void setCustomTypeId(int customTypeId) {
        this.customTypeId = customTypeId;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String getFieldTypeName() {
        return fieldTypeName;
    }

    public void setFieldTypeName(String fieldTypeName) {
        this.fieldTypeName = fieldTypeName;
    }
}
