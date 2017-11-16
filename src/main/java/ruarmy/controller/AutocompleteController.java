package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.City;
import ruarmy.domain.Country;
import ruarmy.domain.Subject;
import ruarmy.annotation.Trottling;
import ruarmy.repository.CityRepository;
import ruarmy.repository.CountryRepository;
import ruarmy.repository.SubjectRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by skyplane on 04.05.17.
 */
@Controller
@RequestMapping("/api/autocomplete")
public class AutocompleteController  extends BaseController {

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private CityRepository cityRepository;


    @RequestMapping(value = "/countries", method = RequestMethod.GET)
    public void countries(@RequestParam("query") String query, HttpServletResponse response) throws UnsupportedEncodingException {
        List<Country> countries = countryRepository.findByNameLike( "%"+query+"%");
        try {
            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("query").value(query);
            jsonWriter.name("suggestions");
            jsonWriter.beginArray();
            for (Country country : countries){
                jsonWriter.beginObject();
                jsonWriter.name("value").value(country.getName());
                jsonWriter.name("data").value(country.getId());
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            ;
        }
    }


    @Trottling(ip="subjectByTerm")
    @RequestMapping(value = "/subjectByTerm", method = RequestMethod.GET)
    public void subjectByTerm(@RequestParam("type") Integer type, @RequestParam("query") String query, HttpServletResponse response) throws UnsupportedEncodingException {
        List<Subject> subjects = subjectRepository.findByTypeAndNameLike(type, "%"+query+"%");
        try {
            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("query").value(query);
            jsonWriter.name("suggestions");
            jsonWriter.beginArray();
            for (Subject subject : subjects){
                jsonWriter.beginObject();
                jsonWriter.name("value").value(subject.getName());
                jsonWriter.name("data").value(subject.getId());
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            ;
        }
    }


    @Trottling(ip="cityByTerm")
    @RequestMapping(value = "/cityByTerm", method = RequestMethod.GET)
    public void cityByTerm(@RequestParam("subjectId") Integer subjectId, @RequestParam("query") String query, HttpServletResponse response) throws UnsupportedEncodingException {
        List<City> cities = cityRepository.findBySubjectCodeAndNameLike(subjectId, "%"+query+"%");
        try {
            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("query").value(query);
            jsonWriter.name("suggestions");
            jsonWriter.beginArray();
            for (City city : cities){
                jsonWriter.beginObject();
                jsonWriter.name("value").value(city.getName());
                jsonWriter.name("data").value(city.getId());
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            ;
        }
    }




}
