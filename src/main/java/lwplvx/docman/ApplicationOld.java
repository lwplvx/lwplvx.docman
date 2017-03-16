package lwplvx.docman;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import lwplvx.docman.util.MyMapper;

/**
 * @author lwp
 * @since 2015-12-12 18:22
 */
@Controller
@EnableWebMvc
@SpringBootApplication
@MapperScan(basePackages = "lwplvx.docman.mapper", markerInterface = MyMapper.class)
public class ApplicationOld extends WebMvcConfigurerAdapter {

//    public static void main(String[] args) {
//        SpringApplication.run(Application.class, args);
//    }
//
//    @RequestMapping("/")
//    String home() {
//        return "lwplvx.docman";//"redirect:countries";
//    }
}
