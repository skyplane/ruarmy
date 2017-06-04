package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.Profile;
import ruarmy.domain.Skill;
import ruarmy.enums.AccessLevel;
import ruarmy.repository.ProfileRepository;
import ruarmy.repository.SkillRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by skyplane on 29.05.17.
 */
@Controller
@RequestMapping("/api/skill")
public class SkillController extends BaseController{

    @Autowired
    private SkillRepository skillsRepository;



    @RequestMapping(value = "/loadByFieldOfActivity", method = RequestMethod.GET)
    public void loadProfiles(
            @RequestParam(value = "fieldOfActivity", defaultValue = "1") Integer fieldOfActivity,
            HttpServletResponse response
    ) throws UnsupportedEncodingException {
        try {
            List<Skill> skills = new ArrayList<Skill>();

            for (Skill skill : skillsRepository.findByFieldOfActivityCode(fieldOfActivity)) {
                skills.add(skill);
            }

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();

            jsonWriter.name("data");
            jsonWriter.beginArray();
            for (Skill skill : skills) {
                jsonWriter.beginObject();
                jsonWriter.name("id").value(skill.getId());
                jsonWriter.name("name").value(skill.getName());
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



}
