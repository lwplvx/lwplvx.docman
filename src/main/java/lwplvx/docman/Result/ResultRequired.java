package lwplvx.docman.Result;

/**
 * Created by lwplvx on 2017/2/19.
 */
public class ResultRequired extends  ResultBase{
    //field is required
    public ResultRequired(String fieldName)
    {
        setErrorCode(501);
        setErrorMessage("field "+fieldName+" is required");
    }
}
