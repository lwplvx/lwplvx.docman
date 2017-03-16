

package lwplvx.docman.mapper;

import lwplvx.docman.model.Project;
import lwplvx.docman.util.MyMapper;

import java.util.List;

/**
 * @author lwp
 * @since 2016-02-20 23:38
 */
public interface ProjectMapper extends MyMapper<Project> {
    List<Project> selectByUserID(Integer userId);
    Project selectByProjectName(String projectName);
}
