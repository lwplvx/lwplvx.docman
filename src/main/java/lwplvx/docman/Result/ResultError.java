package lwplvx.docman.Result;

public class ResultError extends ResultBase {

    public ResultError(String errorMessage)
    {
        setErrorCode(500);
        setErrorMessage(errorMessage);
    }
}
