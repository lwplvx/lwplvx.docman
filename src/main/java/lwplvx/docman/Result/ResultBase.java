package lwplvx.docman.Result;

import lwplvx.docman.model.BaseEntity;

public class ResultBase {

	  int errorCode=200;
      String  errorMessage="OK";
    BaseEntity data=null;

    public int getErrorCode()
    {
      return   errorCode;
    }
    public String getErrorMessage()
    {
        return   errorMessage;
    }
    public BaseEntity getData()
    {
        return data;
    }
    public void setErrorCode(int errorCode)
    {
        this.errorCode=errorCode;
    }
    public void setErrorMessage(String errorMessage)
    {
        this.errorMessage=errorMessage;
    }
    public void setData(BaseEntity data)
    {
        this.data=data;
    }
}
