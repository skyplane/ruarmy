package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.Profile;
import ruarmy.domain.User;
import ruarmy.enums.AccessLevel;
import ruarmy.enums.UserRole;
import ruarmy.repository.ProfileRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by skyplane on 11.05.17.
 */
@Controller
@RequestMapping("/api/profile")
public class ProfileController extends BaseController {


    @Autowired
    private ProfileRepository profileRepository;


    @RequestMapping(value = "/saveProfile", method = RequestMethod.POST)
    public void saveUser(
            @RequestParam(value = "id", defaultValue = "0") Long id,
            @RequestParam("profileName") String profileName,
            @RequestParam(value = "faculty", defaultValue = "READ") AccessLevel faculty,
            @RequestParam(value = "specialty", defaultValue = "READ") AccessLevel specialty,
            @RequestParam(value = "yearOfAdmission", defaultValue = "READ") AccessLevel yearOfAdmission,
            @RequestParam(value = "militaryRank", defaultValue = "READ") AccessLevel militaryRank,
            @RequestParam(value = "surname", defaultValue = "READ") AccessLevel surname,
            @RequestParam(value = "name", defaultValue = "READ") AccessLevel name,
            @RequestParam(value = "patronymic", defaultValue = "READ") AccessLevel patronymic,
            @RequestParam(value = "dateOfBirth", defaultValue = "READ") AccessLevel dateOfBirth,
            @RequestParam(value = "passportNumber", defaultValue = "READ") AccessLevel passportNumber,
            @RequestParam(value = "militaryIdNumber", defaultValue = "READ") AccessLevel militaryIdNumber,
            @RequestParam(value = "nationality", defaultValue = "READ") AccessLevel nationality,
            @RequestParam(value = "religion", defaultValue = "READ") AccessLevel religion,
            @RequestParam(value = "phone", defaultValue = "READ") AccessLevel phone,
            @RequestParam(value = "unit", defaultValue = "READ") AccessLevel unit,
            @RequestParam(value = "post", defaultValue = "READ") AccessLevel post,
            @RequestParam(value = "education", defaultValue = "READ") AccessLevel education,
            @RequestParam(value = "skills", defaultValue = "READ") AccessLevel skills,
            @RequestParam(value = "drivingLicense", defaultValue = "READ") AccessLevel drivingLicense,
            @RequestParam(value = "compositionOfFamily", defaultValue = "READ") AccessLevel compositionOfFamily,
            @RequestParam(value = "concussionsWereNot", defaultValue = "READ") AccessLevel concussionsWereNot,
            @RequestParam(value = "traumaticBrainInjuryWasNot", defaultValue = "READ") AccessLevel traumaticBrainInjuryWasNot,
            @RequestParam(value = "theNarcologWasNot", defaultValue = "READ") AccessLevel theNarcologWasNot,
            @RequestParam(value = "thePsychiatristWasNot", defaultValue = "READ") AccessLevel thePsychiatristWasNot,
            @RequestParam(value = "alcohol", defaultValue = "READ") AccessLevel alcohol,
            @RequestParam(value = "drugUse", defaultValue = "READ") AccessLevel drugUse,
            @RequestParam(value = "chronicDiseases", defaultValue = "READ") AccessLevel chronicDiseases,
            @RequestParam(value = "validityCategory", defaultValue = "READ") AccessLevel validityCategory,
            @RequestParam(value = "thoughtsOfSuicideDoesNotHave", defaultValue = "READ") AccessLevel thoughtsOfSuicideDoesNotHave,
            @RequestParam(value = "suicideAttemptsDidNotCommit", defaultValue = "READ") AccessLevel suicideAttemptsDidNotCommit,
            @RequestParam(value = "administrativeOffenseDidNotCommit", defaultValue = "READ") AccessLevel administrativeOffenseDidNotCommit,
            @RequestParam(value = "policeRecordDoesNotHave", defaultValue = "READ") AccessLevel policeRecordDoesNotHave,
            @RequestParam(value = "criminalLiabilityWasNotInvolved", defaultValue = "READ") AccessLevel criminalLiabilityWasNotInvolved,
            @RequestParam(value = "scars", defaultValue = "READ") AccessLevel scars,
            @RequestParam(value = "tattoo", defaultValue = "READ") AccessLevel tattoo,
            @RequestParam(value = "abroad", defaultValue = "READ") AccessLevel abroad,
            @RequestParam(value = "relativesAndFriendsAbroad", defaultValue = "READ") AccessLevel relativesAndFriendsAbroad,
            @RequestParam(value = "addressData", defaultValue = "READ") AccessLevel addressData,
            HttpServletResponse response) throws UnsupportedEncodingException {

        Profile profile = new Profile();
        if (id != null && !id.equals(0L)) {
            profile = profileRepository.findOne(id);
        }

        profile.setProfileName(profileName);

        profile.setFaculty(faculty);
        profile.setSpecialty(specialty);
        profile.setYearOfAdmission(yearOfAdmission);
        profile.setMilitaryRank(militaryRank);
        profile.setSurname(surname);
        profile.setName(name);
        profile.setPatronymic(patronymic);
        profile.setDateOfBirth(dateOfBirth);
        profile.setPassportNumber(passportNumber);
        profile.setMilitaryIdNumber(militaryIdNumber);
        profile.setNationality(nationality);
        profile.setReligion(religion);
        profile.setPhone(phone);
        profile.setUnit(unit);
        profile.setPost(post);
        profile.setEducation(education);
        profile.setSkills(skills);
        profile.setDrivingLicense(drivingLicense);
        profile.setCompositionOfFamily(compositionOfFamily);
        profile.setConcussionsWereNot(concussionsWereNot);
        profile.setTraumaticBrainInjuryWasNot(traumaticBrainInjuryWasNot);
        profile.setTheNarcologWasNot(theNarcologWasNot);
        profile.setThePsychiatristWasNot(thePsychiatristWasNot);
        profile.setAlcohol(alcohol);
        profile.setDrugUse(drugUse);
        profile.setChronicDiseases(chronicDiseases);
        profile.setValidityCategory(validityCategory);
        profile.setThoughtsOfSuicideDoesNotHave(thoughtsOfSuicideDoesNotHave);
        profile.setSuicideAttemptsDidNotCommit(suicideAttemptsDidNotCommit);
        profile.setAdministrativeOffenseDidNotCommit(administrativeOffenseDidNotCommit);
        profile.setPoliceRecordDoesNotHave(policeRecordDoesNotHave);
        profile.setCriminalLiabilityWasNotInvolved(criminalLiabilityWasNotInvolved);
        profile.setScars(scars);
        profile.setTattoo(tattoo);
        profile.setAbroad(abroad);
        profile.setRelativesAndFriendsAbroad(relativesAndFriendsAbroad);
        profile.setAddressData(addressData);


        profileRepository.save(profile);

        printSuccessStatus(response);
    }


    @RequestMapping(value = "/loadProfiles", method = RequestMethod.POST)
    public void loadProfiles(HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            List<Profile> profiles = new ArrayList<Profile>();

            for (Profile profile : profileRepository.findAll()) {
                profiles.add(profile);
            }

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();

            jsonWriter.name("data");
            jsonWriter.beginArray();
            for (Profile profile : profiles) {
                jsonWriter.beginObject();
                jsonWriter.name("id").value(profile.getId());
                jsonWriter.name("profileName").value(profile.getProfileName());
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/loadProfileById", method = RequestMethod.GET)
    public void loadProfileById(@RequestParam(value = "id", defaultValue = "0") Long id, HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            Profile profile = new Profile();
            if (id != null && !id.equals(0L)) {
                profile = profileRepository.findOne(id);
            }

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(profile.getId());
            jsonWriter.name("profileName").value(profile.getProfileName());

            jsonWriter.name("faculty").value(profile.getFaculty().getValue());
            jsonWriter.name("specialty").value(profile.getSpecialty().getValue());
            jsonWriter.name("yearOfAdmission").value(profile.getYearOfAdmission().getValue());
            jsonWriter.name("militaryRank").value(profile.getMilitaryRank().getValue());
            jsonWriter.name("surname").value(profile.getSurname().getValue());
            jsonWriter.name("name").value(profile.getName().getValue());
            jsonWriter.name("patronymic").value(profile.getPatronymic().getValue());
            jsonWriter.name("dateOfBirth").value(profile.getDateOfBirth().getValue());
            jsonWriter.name("passportNumber").value(profile.getPassportNumber().getValue());
            jsonWriter.name("militaryIdNumber").value(profile.getMilitaryIdNumber().getValue());
            jsonWriter.name("nationality").value(profile.getNationality().getValue());
            jsonWriter.name("religion").value(profile.getReligion().getValue());
            jsonWriter.name("phone").value(profile.getPhone().getValue());
            jsonWriter.name("unit").value(profile.getUnit().getValue());
            jsonWriter.name("post").value(profile.getPost().getValue());
            jsonWriter.name("education").value(profile.getEducation().getValue());
            jsonWriter.name("skills").value(profile.getSkills().getValue());
            jsonWriter.name("drivingLicense").value(profile.getDrivingLicense().getValue());
            jsonWriter.name("compositionOfFamily").value(profile.getCompositionOfFamily().getValue());
            jsonWriter.name("concussionsWereNot").value(profile.getConcussionsWereNot().getValue());
            jsonWriter.name("traumaticBrainInjuryWasNot").value(profile.getTraumaticBrainInjuryWasNot().getValue());
            jsonWriter.name("theNarcologWasNot").value(profile.getTheNarcologWasNot().getValue());
            jsonWriter.name("thePsychiatristWasNot").value(profile.getThePsychiatristWasNot().getValue());
            jsonWriter.name("alcohol").value(profile.getAlcohol().getValue());
            jsonWriter.name("drugUse").value(profile.getDrugUse().getValue());
            jsonWriter.name("chronicDiseases").value(profile.getChronicDiseases().getValue());
            jsonWriter.name("validityCategory").value(profile.getValidityCategory().getValue());
            jsonWriter.name("thoughtsOfSuicideDoesNotHave").value(profile.getThoughtsOfSuicideDoesNotHave().getValue());
            jsonWriter.name("suicideAttemptsDidNotCommit").value(profile.getSuicideAttemptsDidNotCommit().getValue());
            jsonWriter.name("administrativeOffenseDidNotCommit").value(profile.getAdministrativeOffenseDidNotCommit().getValue());
            jsonWriter.name("policeRecordDoesNotHave").value(profile.getPoliceRecordDoesNotHave().getValue());
            jsonWriter.name("criminalLiabilityWasNotInvolved").value(profile.getCriminalLiabilityWasNotInvolved().getValue());
            jsonWriter.name("scars").value(profile.getScars().getValue());
            jsonWriter.name("tattoo").value(profile.getTattoo().getValue());
            jsonWriter.name("abroad").value(profile.getAbroad().getValue());
            jsonWriter.name("relativesAndFriendsAbroad").value(profile.getRelativesAndFriendsAbroad().getValue());
            jsonWriter.name("addressData").value(profile.getAddressData().getValue());
            jsonWriter.endObject();

            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
