package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.AddressData;
import ruarmy.domain.Division;
import ruarmy.domain.Profile;
import ruarmy.domain.User;
import ruarmy.enums.UserRole;
import ruarmy.repository.DivisionRepository;
import ruarmy.repository.ProfileRepository;
import ruarmy.repository.UserRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * Created by skyplane on 06.05.17.
 */
@Controller
@RequestMapping("/api/user")
public class UserController  extends BaseController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private DivisionRepository divisionRepository;


    @Autowired
    ShaPasswordEncoder passwordEncoder;


    RuarmyResources ruarmyResources = new RuarmyResources();


    @RequestMapping(value = "/loadUserRoles", method = RequestMethod.POST)
    public void loadUserRoles(HttpServletResponse response) throws UnsupportedEncodingException {

        try {
            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();

            jsonWriter.name("data");
            jsonWriter.beginArray();
            for (UserRole userRole : UserRole.values()) {
                jsonWriter.beginObject();
                jsonWriter.name("key").value(userRole.getResourceKey());
                jsonWriter.name("value").value(ruarmyResources.getString(userRole.getResourceKey()));
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/loadUsers", method = RequestMethod.POST)
    public void loadUsers(HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            List<User> users= new ArrayList<User>();

            for (User user : userRepository.findAll()){
                users.add(user);
            }

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();

            jsonWriter.name("data");
            jsonWriter.beginArray();
            for (User user : users) {
                jsonWriter.beginObject();
                jsonWriter.name("id").value(user.getId());
                jsonWriter.name("login").value(user.getLogin());
                jsonWriter.name("password").value(user.getPassword());
                jsonWriter.name("role").value(ruarmyResources.getString(user.getRole().getResourceKey()));

                jsonWriter.name("profile");
                jsonWriter.beginObject();
                if (user.getProfile()!=null){
                    jsonWriter.name("id").value(user.getProfile().getId());
                    jsonWriter.name("profileName").value(user.getProfile().getProfileName());
                } else {
                    jsonWriter.name("id").value("");
                    jsonWriter.name("profileName").value("");
                }
                jsonWriter.endObject();

                jsonWriter.name("divisions");
                jsonWriter.beginArray();
                for (Division division : user.getDivisions()){
                    jsonWriter.beginObject();
                    jsonWriter.name("id").value(division.getId());
                    jsonWriter.name("name").value(division.getName());
                    jsonWriter.endObject();
                }
                jsonWriter.endArray();

                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public void saveUser(
            @RequestParam("user[id]") Long id,
            @RequestParam("user[login]") String login,
            @RequestParam("user[password]") String password,
            @RequestParam("user[role]") String role,
            @RequestParam(value = "divisions[]",  defaultValue = "") Long[] divisionIds,
            @RequestParam(value = "profile",  defaultValue = "") Long profileId,
            HttpServletResponse response) throws UnsupportedEncodingException {

        User user = new User();
        if (id != null) {
            user = userRepository.findOne(id);
        }

        if (profileId!=null){
            Profile profile = profileRepository.findOne(profileId);
            user.setProfile(profile);
        }

        if (divisionIds!=null){
            HashSet<Division> divisions = new HashSet<>();
            for (Long divisionId : divisionIds){
                Division division = divisionRepository.findOne(divisionId);
                divisions.add(division);
            }
            user.setDivisions(divisions);
        }

        user.setLogin(login);

        if (!password.equals(user.getPassword())) {
            user.setPassword(
                    passwordEncoder.encodePassword(password, null)
            );
        }
        for (UserRole roleItem : UserRole.values()) {
            if (roleItem.getResourceKey().equals(role)) {
                user.setRole(roleItem);
            }
        }

        userRepository.save(user);

        printSuccessStatus(response);
    }



    @RequestMapping(value = "/loadUserById", method = RequestMethod.GET)
    public void loadUserById(@RequestParam(value = "id", defaultValue = "0") Long id, HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            User user = new User();
            if (id != null && !id.equals(0L)) {
                user = userRepository.findOne(id);
            }

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(user.getId());
            jsonWriter.name("login").value(user.getLogin());
            jsonWriter.name("password").value(user.getPassword());

            jsonWriter.name("role").value(ruarmyResources.getString(user.getRole().getResourceKey()));

            jsonWriter.name("profile");
            jsonWriter.beginObject();
            if (user.getProfile()!=null){
                jsonWriter.name("id").value(user.getProfile().getId());
                jsonWriter.name("profileName").value(user.getProfile().getProfileName());
            } else {
                jsonWriter.name("id").value("");
                jsonWriter.name("profileName").value("");
            }
            jsonWriter.endObject();

            jsonWriter.name("divisions");
            jsonWriter.beginArray();
            for (Division division : user.getDivisions()){
                jsonWriter.value(division.getId());
                //jsonWriter.beginObject();
             //   jsonWriter.name("id").value(division.getId());
              //  jsonWriter.name("name").value(division.getName());
              //  jsonWriter.endObject();
            }
            jsonWriter.endArray();



            jsonWriter.endObject();

            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



}
