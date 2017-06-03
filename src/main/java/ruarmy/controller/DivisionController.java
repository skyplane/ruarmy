package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.Division;
import ruarmy.domain.User;
import ruarmy.enums.UserRole;
import ruarmy.repository.DivisionRepository;
import ruarmy.repository.UserRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by skyplane on 13.05.17.
 */
@Controller
@RequestMapping("/api/division")
public class DivisionController extends BaseController{


    @Autowired
    private DivisionRepository divisionRepository;


    @RequestMapping(value = "/loadDivisions", method = RequestMethod.POST)
    public void loadDivisions(HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            List<Division> divisions= new ArrayList<Division>();

            for (Division division : divisionRepository.findAll()){
                divisions.add(division);
            }

            Collections.sort(divisions, new Comparator<Division>() {
                public int compare(Division o1, Division o2) {
                    return o1.getName().compareTo(o2.getName());
                }
            });

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();

            jsonWriter.name("data");
            jsonWriter.beginArray();
            for (Division division : divisions) {
                jsonWriter.beginObject();
                jsonWriter.name("id").value(division.getId());
                jsonWriter.name("name").value(division.getName());
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



    @RequestMapping(value = "/saveDivision", method = RequestMethod.POST)
    public void saveDivision(
            @RequestParam(value = "id", defaultValue = "0") Long id,
            @RequestParam("name") String name,
            HttpServletResponse response) throws UnsupportedEncodingException {

        Division division = new Division();
        if (id != null && !id.equals(0L)) {
            division = divisionRepository.findOne(id);
        }

        division.setName(name);

        divisionRepository.save(division);

        printSuccessStatus(response);
    }


}
