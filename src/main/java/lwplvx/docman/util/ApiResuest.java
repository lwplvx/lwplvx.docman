package lwplvx.docman.util;

/**
 * Created by lwplvx on 2017/5/17.
 */
public class ApiResuest {
    //private static final String serverPath = "http://localhost:8899/Hornetslock/";
    private static final String serverPath = "http://192.168.3.201/Hornetslock/api/";
    //private static final String serverPath = "http://gateway.hornetslock.com/gw/";
    private static   String testAccess_token = "6ee11dbc-82d8-435b-8c60-e2c9277d3627";

    public static String getUrl(String path) {
        return serverPath + path;
    }

    public static String getTestAccess_token() {
        return testAccess_token;
    }

    public static void setTestAccess_token(String testAccess_token) {
        ApiResuest.testAccess_token = testAccess_token;
    }
}
