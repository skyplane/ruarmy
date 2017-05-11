package ruarmy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.RuarmyUtils;
import ruarmy.domain.Cadet;
import ruarmy.domain.FamilyMember;
import ruarmy.enums.FamilyMemberType;
import ruarmy.repository.CadetRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by skyplane on 02.05.17.
 */
@Controller
@RequestMapping("/api/cadet")
public class CadetController extends BaseController {

    @Autowired
    private CadetRepository cadetRepository;


    @RequestMapping(value = "/saveCadet", method = RequestMethod.POST)
    public void saveSignal(
            @RequestParam("addressData[cityOfPlaceOfBirthType]") String cityOfPlaceOfBirthType,
            @RequestParam("addressData[cityOfRegisteredAddressType]") String cityOfRegisteredAddressType,
            @RequestParam("addressData[cityOfActualAddressType]") String cityOfActualAddressType,
            @RequestParam("addressData[streetOfRegisteredAddressType]") String streetOfRegisteredAddressType,
            @RequestParam("addressData[streetOfActualAddressType]") String streetOfActualAddressType,
            @RequestParam("addressData[subjectOfPlaceOfBirth]") String subjectOfPlaceOfBirth,
            @RequestParam("addressData[cityOfPlaceOfBirth]") String cityOfPlaceOfBirth,
            @RequestParam("addressData[subjectOfRegisteredAddress]") String subjectOfRegisteredAddress,
            @RequestParam("addressData[cityOfRegisteredAddress]") String cityOfRegisteredAddress,
            @RequestParam("addressData[streetOfRegisteredAddress]") String streetOfRegisteredAddress,
            @RequestParam("addressData[subjectOfActualAddress]") String subjectOfActualAddress,
            @RequestParam("addressData[cityOfActualAddress]") String cityOfActualAddress,
            @RequestParam("addressData[streetOfActualAddress]") String streetOfActualAddress,
            @RequestParam(value = "addressData[houseOfRegisteredAddress]", defaultValue = "") String houseOfRegisteredAddress,
            @RequestParam(value = "addressData[buildingOfRegisteredAddress]", defaultValue = "") String buildingOfRegisteredAddress,
            @RequestParam(value = "addressData[apartmentOfRegisteredAddress]", defaultValue = "") String apartmentOfRegisteredAddress,
            @RequestParam(value = "addressData[indexOfRegisteredAddress]", defaultValue = "") String indexOfRegisteredAddress,
            @RequestParam(value = "addressData[houseOfActualAddress]", defaultValue = "") String houseOfActualAddress,
            @RequestParam(value = "addressData[buildingOfActualAddress]", defaultValue = "") String buildingOfActualAddress,
            @RequestParam(value = "addressData[apartmentOfActualAddress]", defaultValue = "") String apartmentOfActualAddress,
            @RequestParam(value = "addressData[indexOfActualAddress]", defaultValue = "") String indexOfActualAddress,
            @RequestParam(value = "brothers[]", defaultValue ="") String[] brothers,
            @RequestParam(value = "sisters[]", defaultValue = "") String[] sisters,
            @RequestParam("concussionsWereNot") Boolean concussionsWereNot,
            @RequestParam("traumaticBrainInjuryWasNot") Boolean traumaticBrainInjuryWasNot,
            @RequestParam("theNarcologWasNot") Boolean theNarcologWasNot,
            @RequestParam("thePsychiatristWasNot") Boolean thePsychiatristWasNot,
            @RequestParam("thoughtsOfSuicideDoesNotHave") Boolean thoughtsOfSuicideDoesNotHave,
            @RequestParam("suicideAttemptsDidNotCommit") Boolean suicideAttemptsDidNotCommit,
            @RequestParam("administrativeOffenseDidNotCommit") Boolean administrativeOffenseDidNotCommit,
            @RequestParam("policeRecordDoesNotHave") Boolean policeRecordDoesNotHave,
            @RequestParam("criminalLiabilityWasNotInvolved") Boolean criminalLiabilityWasNotInvolved,
            @RequestParam("relativesAndFriendsAbroad") Boolean relativesAndFriendsAbroad,
            @RequestParam("faculty") String faculty,
            @RequestParam("specialty") String specialty,
            @RequestParam("yearOfAdmission") Integer yearOfAdmission,
            @RequestParam("surname") String surname,
            @RequestParam("name") String name,
            @RequestParam("militaryRank") String militaryRank,
            @RequestParam("patronymic") String patronymic,
            @RequestParam("dateOfBirth") String dateOfBirth,
            @RequestParam("passportNumber") String passportNumber,
            @RequestParam("militaryIdNumber") String militaryIdNumber,
            @RequestParam("nationality") String nationality,
            @RequestParam("religion") String religion,
            @RequestParam("customReligion") String customReligion,
            @RequestParam("phone") String phone,
            @RequestParam("unit") String unit,
            @RequestParam("post") String post,
            @RequestParam("education") String education,
            @RequestParam("skills") String skills,
            @RequestParam("drivingLicense") String drivingLicense,
            @RequestParam("compositionOfFamily") String compositionOfFamily,
            @RequestParam(value = "father", defaultValue = "") String father,
            @RequestParam(value = "mother", defaultValue = "") String mother,
            @RequestParam("alcohol") String alcohol,
            @RequestParam("drugUse") String drugUse,
            @RequestParam(value = "chronicDiseases", defaultValue = "") String chronicDiseases,
            @RequestParam(value = "validityCategory", defaultValue = "") String validityCategory,
            @RequestParam(value = "scars", defaultValue = "") String scars,
            @RequestParam(value = "tattoo", defaultValue = "") String tattoo,
            @RequestParam(value = "abroad", defaultValue = "") String abroad,
            HttpServletResponse response) throws UnsupportedEncodingException {


        Cadet cadet = new Cadet();

        try {

            cadet.getAddressData().setCityOfPlaceOfBirthType(cityOfPlaceOfBirthType);
            cadet.getAddressData().setCityOfRegisteredAddressType(cityOfRegisteredAddressType);
            cadet.getAddressData().setCityOfActualAddressType(cityOfActualAddressType);
            cadet.getAddressData().setStreetOfRegisteredAddressType(streetOfRegisteredAddressType);
            cadet.getAddressData().setStreetOfActualAddressType(streetOfActualAddressType);

            cadet.getAddressData().setCityOfPlaceOfBirth(cityOfPlaceOfBirth);
            cadet.getAddressData().setCityOfRegisteredAddress(cityOfRegisteredAddress);
            cadet.getAddressData().setCityOfActualAddress(cityOfActualAddress);

            cadet.getAddressData().setStreetOfRegisteredAddress(streetOfRegisteredAddress);
            cadet.getAddressData().setStreetOfActualAddress(streetOfActualAddress);

            cadet.getAddressData().setSubjectOfPlaceOfBirth(subjectOfPlaceOfBirth);
            cadet.getAddressData().setSubjectOfRegisteredAddress(subjectOfRegisteredAddress);
            cadet.getAddressData().setSubjectOfActualAddress(subjectOfActualAddress);
            cadet.getAddressData().setHouseOfRegisteredAddress(houseOfRegisteredAddress);
            cadet.getAddressData().setBuildingOfRegisteredAddress(buildingOfRegisteredAddress);
            cadet.getAddressData().setApartmentOfRegisteredAddress(apartmentOfRegisteredAddress);
            cadet.getAddressData().setIndexOfRegisteredAddress(indexOfRegisteredAddress);

            cadet.getAddressData().setHouseOfActualAddress(houseOfActualAddress);
            cadet.getAddressData().setBuildingOfActualAddress(buildingOfActualAddress);
            cadet.getAddressData().setApartmentOfActualAddress(apartmentOfActualAddress);
            cadet.getAddressData().setIndexOfActualAddress(indexOfActualAddress);

            for (String brother : brothers) {
                FamilyMember familyMember = new FamilyMember();
                familyMember.setType(FamilyMemberType.BROTHER);
                familyMember.setText(brother);
                cadet.getFamilyMembers().add(familyMember);
            }
            for (String sister : sisters) {
                FamilyMember familyMember = new FamilyMember();
                familyMember.setType(FamilyMemberType.SISTER);
                familyMember.setText(sister);
                cadet.getFamilyMembers().add(familyMember);
            }

            cadet.setConcussionsWereNot(concussionsWereNot);
            cadet.setTraumaticBrainInjuryWasNot(traumaticBrainInjuryWasNot);
            cadet.setTheNarcologWasNot(theNarcologWasNot);
            cadet.setThePsychiatristWasNot(thePsychiatristWasNot);
            cadet.setThoughtsOfSuicideDoesNotHave(thoughtsOfSuicideDoesNotHave);
            cadet.setSuicideAttemptsDidNotCommit(suicideAttemptsDidNotCommit);
            cadet.setAdministrativeOffenseDidNotCommit(administrativeOffenseDidNotCommit);
            cadet.setPoliceRecordDoesNotHave(policeRecordDoesNotHave);
            cadet.setCriminalLiabilityWasNotInvolved(criminalLiabilityWasNotInvolved);
            cadet.setRelativesAndFriendsAbroad(relativesAndFriendsAbroad);

            cadet.setFaculty(faculty);
            cadet.setSpecialty(specialty);
            cadet.setYearOfAdmission(yearOfAdmission);

            cadet.setSurname(surname);
            cadet.setName(name);
            cadet.setMilitaryRank(militaryRank);
            cadet.setPatronymic(patronymic);
            cadet.setDateOfBirth(RuarmyUtils.SIMPLE_DATE_FORMAT.parse(dateOfBirth));

            cadet.setPassportNumber(passportNumber);
            cadet.setMilitaryIdNumber(militaryIdNumber);
            cadet.setNationality(nationality);

            if ("10".equals(religion)) {
                cadet.setReligion(customReligion);
            } else {
                cadet.setReligion(religion);
            }

            cadet.setPhone(phone);
            cadet.setUnit(unit);
            cadet.setPost(post);
            cadet.setEducation(education);
            cadet.setSkills(skills);
            cadet.setDrivingLicense(drivingLicense);
            cadet.setCompositionOfFamily(compositionOfFamily);
            cadet.setFather(father);
            cadet.setMother(mother);
            cadet.setAlcohol(alcohol);
            cadet.setDrugUse(drugUse);
            cadet.setChronicDiseases(chronicDiseases);

            cadet.setValidityCategory(validityCategory);
            cadet.setScars(scars);
            cadet.setTattoo(tattoo);
            cadet.setAbroad(abroad);

            cadetRepository.save(cadet);
            printSuccessStatus(response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

}
