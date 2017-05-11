package ruarmy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.Cadet;
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


    @RequestMapping(value = "/saveCadet", method = RequestMethod.GET)
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
            @RequestParam("addressData[houseOfRegisteredAddress]") String houseOfRegisteredAddress,
            @RequestParam("addressData[buildingOfRegisteredAddress]") String buildingOfRegisteredAddress,
            @RequestParam("addressData[apartmentOfRegisteredAddress]") String apartmentOfRegisteredAddress,
            @RequestParam("addressData[indexOfRegisteredAddress]") String indexOfRegisteredAddress,
            @RequestParam("addressData[houseOfActualAddress]") String houseOfActualAddress,
            @RequestParam("addressData[buildingOfActualAddress]") String buildingOfActualAddress,
            @RequestParam("addressData[apartmentOfActualAddress]") String apartmentOfActualAddress,
            @RequestParam("addressData[indexOfActualAddress]") String indexOfActualAddress,
            @RequestParam("brothers[]") String[] brothers,
            @RequestParam("sisters[]") String[] sisters,
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
            @RequestParam("father") String father,
            @RequestParam("mother") String mother,
            @RequestParam("alcohol") String alcohol,
            @RequestParam("drugUse") String drugUse,
            @RequestParam("chronicDiseases") String chronicDiseases,
            @RequestParam("validityCategory") String validityCategory,
            @RequestParam("scars") String scars,
            @RequestParam("tattoo") String tattoo,
            @RequestParam("abroad") String abroad,
                           HttpServletResponse response) throws UnsupportedEncodingException {


        Cadet cadet = new Cadet();


        cadetRepository.save(cadet);

        printSuccessStatus(response);
    }

}
