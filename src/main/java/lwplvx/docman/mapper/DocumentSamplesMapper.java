

package lwplvx.docman.mapper;

import lwplvx.docman.model.Documentfields;
import lwplvx.docman.model.Documentsamples;
import lwplvx.docman.util.MyMapper;

import java.util.HashMap;
import java.util.List;

/**
 * @author lwp
 * @since 2016-02-20 23:38
 */
public interface DocumentSamplesMapper extends MyMapper<Documentsamples> {
      List<Documentsamples> selectByDocumentId(HashMap map) ;
}
