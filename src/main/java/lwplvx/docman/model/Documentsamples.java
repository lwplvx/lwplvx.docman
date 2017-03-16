

package lwplvx.docman.model;

/**
 * 用户信息
 *
 * @author lwp
 * @since 2016-3-13 14:49
 */
public class Documentsamples extends DocModelBase {
    private int documentid;
    private String title;
    private String content;
    private String sampletype;


    public int getDocumentid() {
        return documentid;
    }

    public void setDocumentid(int documentid) {
        this.documentid = documentid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSampletype() {
        return sampletype;
    }

    public void setSampletype(String sampletype) {
        this.sampletype = sampletype;
    }
}
