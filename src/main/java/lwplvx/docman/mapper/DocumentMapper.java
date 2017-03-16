
package lwplvx.docman.mapper;

import lwplvx.docman.model.Document;
import lwplvx.docman.util.MyMapper;

import java.util.HashMap;
import java.util.List;

/**
 * @author lwp
 * @since 2016-02-20 23:38
 */
public interface DocumentMapper extends MyMapper<Document> {
    List<Document> selectByAppId(Integer appId);

    Document selectByDocumentName(HashMap map);
}
