

package lwplvx.docman.mapper;

import lwplvx.docman.model.App;
import lwplvx.docman.util.MyMapper;

import java.util.HashMap;
import java.util.List;

/**
 * @author lwp
 * @since 2016-02-20 23:38
 */
public interface AppMapper extends MyMapper<App> {
     List<App> selectByProjectId(Integer projectId);
     App selectByAppName(HashMap map);

}
