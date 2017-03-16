

package lwplvx.docman.mapper;

import lwplvx.docman.model.Documentfields;
import lwplvx.docman.util.MyMapper;

import java.util.HashMap;
import java.util.List;

/**
 * @author lwp
 * @since 2016-02-20 23:38
 */
public interface DocumentFieldsMapper extends MyMapper<Documentfields> {
      List<Documentfields> selectByDocumentId(HashMap map) ;
}
