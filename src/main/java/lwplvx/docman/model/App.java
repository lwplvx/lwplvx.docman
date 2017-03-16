

package lwplvx.docman.model;

/**
 * 用户信息
 *
 * @author lwp
 * @since 2016-2-20 23:40
 */
public class App extends DocModelBase {
    private int projectId;
    private String appName;



    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }


    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

}
