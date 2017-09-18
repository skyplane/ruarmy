package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

@Controller
public class BaseController {



    protected JsonWriter getJsonWriter(HttpServletResponse response) throws IOException{
        OutputStreamWriter os;
        try {
            os = new OutputStreamWriter(response.getOutputStream(), "UTF-8");
        } catch (UnsupportedEncodingException uee) {
            os = new OutputStreamWriter(response.getOutputStream());
        }
        return new JsonWriter(os);
    }

    protected void closeJsonWriter(HttpServletResponse response, JsonWriter jsonWriter)  throws IOException{
        try {
            jsonWriter.close();
            response.getOutputStream().flush();
            response.getOutputStream().close();
        } catch (IOException ioe) {
            throw new RuntimeException(ioe);
        }
    }







    protected void printSuccessStatus(HttpServletResponse response) {
        try {
            OutputStreamWriter os = new OutputStreamWriter(response.getOutputStream());
            JsonWriter jsonWriter = new JsonWriter(os);
            jsonWriter.beginObject();
            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            jsonWriter.close();
        } catch (IOException ioe) {

        }
    }


    String nnl(Object obj){
        if (obj == null)
            return "";
        else
            return obj.toString();
    }

 /*   @RequestMapping(value = {"/", "/welcome**"}, method = RequestMethod.GET)
    public ModelAndView welcomePage() {

        User user = null;
        try {
            user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        } catch (Exception e) {
            ModelAndView model = new ModelAndView();
            model.setViewName("login");
            return model;
        }

        TimeZone.setDefault(TimeZone.getTimeZone("GMT+7:00"));

        String role = "";
        for (GrantedAuthority grantedAuthority : user.getAuthorities()) {
            role = grantedAuthority.getAuthority();
        }

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Hello World");
        model.addObject("message", "This is welcome page!");

        if ("ROLE_ADMIN".equals(role)) {
            model.setViewName("admin");
        } else if ("ROLE_USER".equals(role)) {
            model.setViewName("user");
        }
        return model;

    }

    @RequestMapping("/logout")
    public String showLoggedout(){
        return "logout";
    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Hello World");
        model.addObject("message", "This is protected page - Admin Page!");
        model.setViewName("admin");

        return model;

    }


    @RequestMapping(value = "/dba**", method = RequestMethod.GET)
    public ModelAndView dbaPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Hello World");
        model.addObject("message", "This is protected page - Database Page!");
        model.setViewName("admin");

        return model;

    }*/


}