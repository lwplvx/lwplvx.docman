

package lwplvx.docman.mapper;

import lwplvx.docman.model.User;
import lwplvx.docman.util.MyMapper;

/**
 * @author lwp_3nofxnp
 * @since 2016-01-22 22:17
 */
public interface UserMapper extends MyMapper<User> {
    User getByUserName(String userName);
}
