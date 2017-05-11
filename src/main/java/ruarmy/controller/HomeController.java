package ruarmy.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.servlet.ModelAndView;
import ruarmy.repository.DataRowRepository;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ruarmy.domain.DataRow;
import ruarmy.domain.SelectInputField;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class HomeController {

    @Autowired
    private Logger logger;

    @Autowired
    private DataRowRepository dataRowRepository;

    @RequestMapping(value = "/getAutompleteFields")
    public
    @ResponseBody
    String getAutompleteFields(HttpServletRequest request) {
        String res = null;
        try {

            String term = request.getParameter("term").toString();
            JSONArray data = new JSONArray();

            for (String item : SelectInputField.getEmailsByTerm(term)) {
                data.put(item);
            }
            res = data.toString();

        } catch (Exception e) {
            logger.log(Level.SEVERE, "autocomplete fields load error", e);
        }
        return res;
    }

    private String JSONFromDataRow(DataRow dataRow) throws JSONException {
        JSONObject row = new JSONObject();
        row.put("DT_RowId", "row_" + dataRow.getId());
        row.put("time", dataRow.getTextField());
        row.put("email", dataRow.getSelectField());
        JSONObject res = new JSONObject();
        res.put("row", row);
        return res.toString();
    }

    @RequestMapping(value = "/getData")
    public
    @ResponseBody
    String getData(HttpServletRequest request) {
        String res = null;
        try {

            String action = request.getParameter("action");

            if ("create".equals(action)) {
                DataRow dataRow = new DataRow();
                dataRow.setSelectField(request.getParameter("data[email]"));
                dataRow.setTextField(new Date().toString());
                dataRowRepository.saveAndFlush(dataRow);
                logger.info("created dataRow (id=" + dataRow.getId() + ")");
                return JSONFromDataRow(dataRow);
            } else if ("edit".equals(action)) {
                String id = request.getParameter("id");
                DataRow dataRow = dataRowRepository.findOne(Long.parseLong(id.replace("row_", "")));
                dataRow.setSelectField(request.getParameter("data[email]"));
                dataRowRepository.saveAndFlush(dataRow);
                logger.info("updated dataRow (id=" + dataRow.getId() + ")");
                return JSONFromDataRow(dataRow);
            } else if ("remove".equals(action)) {
                for (String idStr : request.getParameterValues("id[]")) {
                    Long id = Long.parseLong(idStr.replace("row_", ""));
                    dataRowRepository.delete(id);
                    logger.info("deleted dataRow (id=" + id + ")");
                }
                return "[]";
            }

            JSONArray data = new JSONArray();

            for (DataRow dataRow : dataRowRepository.findAll()) {
                JSONObject row = new JSONObject();
                row.put("DT_RowId", "row_" + dataRow.getId());
                row.put("time", dataRow.getTextField());
                row.put("email", dataRow.getSelectField());
                data.put(row);
            }

            JSONObject resJSON = new JSONObject();
            resJSON.put("data", data);

            logger.info("load catalog");

            res = resJSON.toString();

        } catch (Exception e) {
            logger.log(Level.SEVERE, "get data for catalog error", e);
        }
        return res;

    }

   @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
      // User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

       ModelAndView model = new ModelAndView();
       model.addObject("title", "Spring Security Hello World");
       model.addObject("message", "This is welcome page!");

       if (request.isUserInRole("ROLE_ADMIN")) {
           model.setViewName("admin");
       } else if (request.isUserInRole("ROLE_OFFICER")) {
           model.setViewName("officer");
       } else if (request.isUserInRole("ROLE_CADET")) {
           model.setViewName("cadet");
       }
       return model;

    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        return "login";
    }



}