package lwplvx.docman.util;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

/**
 * Created by lwplvx on 2017/5/17.
 */
public class JSONConvert<T> {
     /*
        // Convert object to JSON string
        String Json =  mapper.writeValueAsString(student1);
        System.out.println("Change Object to JSON String: " + Json);
        Student student2 = mapper.readValue(Json, Student.class);
        System.out.println(student2);
        */

    private static ObjectMapper mapper = new ObjectMapper();

    public static String ObjectToString(Object obj){
        String json = null;
        try {
            json = mapper.writeValueAsString(obj);
            System.out.println("ObjectToString:"+json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    public static <T> T StringToObject(String Json, Class<T> tClass)  {
        T obj = null;
        try {
            obj = mapper.readValue(Json, tClass);
            System.out.println("StringToObject:"+obj);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return obj;
    }
}
