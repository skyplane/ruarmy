package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.RuarmyUtils;
import ruarmy.domain.*;
import ruarmy.enums.FamilyMemberType;
import ruarmy.repository.CadetRepository;
import ruarmy.repository.DivisionRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by skyplane on 02.05.17.
 */
@Controller
@RequestMapping("/api/cadet")
public class CadetController extends BaseController {

    @Autowired
    private CadetRepository cadetRepository;

    @Autowired
    private DivisionRepository divisionRepository;


    @RequestMapping(value = "/saveCadet", method = RequestMethod.POST)
    public void saveCadet(

            @RequestParam("addressData[cityOfPlaceOfBirthType]") String cityOfPlaceOfBirthType,
            @RequestParam("addressData[subjectOfPlaceOfBirth]") String subjectOfPlaceOfBirth,
            @RequestParam("addressData[cityOfPlaceOfBirth]") String cityOfPlaceOfBirth,

            @RequestParam("addressData[cityOfRegisteredAddressType]") String cityOfRegisteredAddressType,
            @RequestParam("addressData[streetOfRegisteredAddressType]") String streetOfRegisteredAddressType,
            @RequestParam("addressData[subjectOfRegisteredAddress]") String subjectOfRegisteredAddress,
            @RequestParam("addressData[cityOfRegisteredAddress]") String cityOfRegisteredAddress,
            @RequestParam("addressData[streetOfRegisteredAddress]") String streetOfRegisteredAddress,
            @RequestParam(value = "addressData[houseOfRegisteredAddress]", defaultValue = "") String houseOfRegisteredAddress,
            @RequestParam(value = "addressData[buildingOfRegisteredAddress]", defaultValue = "") String buildingOfRegisteredAddress,
            @RequestParam(value = "addressData[apartmentOfRegisteredAddress]", defaultValue = "") String apartmentOfRegisteredAddress,
            @RequestParam(value = "addressData[indexOfRegisteredAddress]", defaultValue = "") String indexOfRegisteredAddress,

            @RequestParam("addressData[cityOfActualAddressType]") String cityOfActualAddressType,
            @RequestParam("addressData[streetOfActualAddressType]") String streetOfActualAddressType,
            @RequestParam("addressData[subjectOfActualAddress]") String subjectOfActualAddress,
            @RequestParam("addressData[cityOfActualAddress]") String cityOfActualAddress,
            @RequestParam("addressData[streetOfActualAddress]") String streetOfActualAddress,
            @RequestParam(value = "addressData[houseOfActualAddress]", defaultValue = "") String houseOfActualAddress,
            @RequestParam(value = "addressData[buildingOfActualAddress]", defaultValue = "") String buildingOfActualAddress,
            @RequestParam(value = "addressData[apartmentOfActualAddress]", defaultValue = "") String apartmentOfActualAddress,
            @RequestParam(value = "addressData[indexOfActualAddress]", defaultValue = "") String indexOfActualAddress,

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

            @RequestParam(value = "fatherExist", defaultValue = "") Boolean fatherExist,
            @RequestParam(value = "motherExist", defaultValue = "") Boolean motherExist,
            @RequestParam(value = "hasInformationAboutParents", defaultValue = "") Boolean hasInformationAboutParents,

            @RequestParam("surname") String surname,
            @RequestParam("name") String name,
            @RequestParam("patronymic") String patronymic,
            @RequestParam("dateOfBirth") String dateOfBirth,
            @RequestParam("nationality") String nationality,

            @RequestParam("religion") String religion,
            @RequestParam("customReligion") String customReligion,

            @RequestParam("militaryRank") String militaryRank,

            @RequestParam("post") String post,

            @RequestParam("passportNumber") String passportNumber,
            @RequestParam("militaryIdNumber") String militaryIdNumber,

            @RequestParam("phone") String phone,

            @RequestParam("faculty") String faculty,
            @RequestParam("specialty") String specialty,
            @RequestParam("yearOfAdmission") Integer yearOfAdmission,

            @RequestParam("compositionOfFamily") String compositionOfFamily,

            @RequestParam(value = "withoutFather", defaultValue = "") String withoutFather,
            @RequestParam(value = "withoutFather", defaultValue = "") String withoutMother,

            @RequestParam("married") String married,
            @RequestParam("marrieds") String marrieds,

            @RequestParam("alcohol") String alcohol,
            @RequestParam("drugUse") String drugUse,

            @RequestParam(value = "chronicDiseases", defaultValue = "") String chronicDiseases,
            @RequestParam(value = "validityCategory", defaultValue = "") String validityCategory,

            @RequestParam(value = "scars", defaultValue = "") String scars,
            @RequestParam(value = "tattoo", defaultValue = "") String tattoo,
            @RequestParam(value = "abroad", defaultValue = "") String abroad,

            @RequestParam(value = "driversLicenses[]", defaultValue = "") String[] driversLicenses,

            @RequestParam(value = "division", defaultValue = "0") Long divisionId,

            @RequestParam(value = "skills[]", defaultValue = "") String[] skills,
            @RequestParam(value = "tripsAbroads_who[]", defaultValue = "") String[] tripsAbroads_who,
            @RequestParam(value = "tripsAbroads_firstName[]", defaultValue = "") String[] tripsAbroads_firstName,
            @RequestParam(value = "tripsAbroads_lastName[]", defaultValue = "") String[] tripsAbroads_lastName,
            @RequestParam(value = "tripsAbroads_patronymic[]", defaultValue = "") String[] tripsAbroads_patronymic,
            @RequestParam(value = "tripsAbroads_country[]", defaultValue = "") String[] tripsAbroads_country,
            @RequestParam(value = "tripsAbroads_doMaintainARelationship[]", defaultValue = "") String[] tripsAbroads_doMaintainARelationship,

            @RequestParam(value = "familyMembers_type[]", defaultValue = "0") Integer[] familyMembers_type,
            @RequestParam(value = "familyMembers_firstName[]", defaultValue = "") String[] familyMembers_firstName,
            @RequestParam(value = "familyMembers_lastName[]", defaultValue = "") String[] familyMembers_lastName,
            @RequestParam(value = "familyMembers_patronymic[]", defaultValue = "") String[] familyMembers_patronymic,
            @RequestParam(value = "familyMembers_dateOfBirth[]", defaultValue = "") String[] familyMembers_dateOfBirth,
            @RequestParam(value = "familyMembers_occupation[]", defaultValue = "") String[] familyMembers_occupation,
            @RequestParam(value = "familyMembers_phone[]", defaultValue = "") String[] familyMembers_phone,
            @RequestParam(value = "familyMembers_wasTreatedForAlcoholism[]", defaultValue = "") String[] familyMembers_wasTreatedForAlcoholism,
            @RequestParam(value = "familyMembers_wasTreatedForAddiction[]", defaultValue = "") String[] familyMembers_wasTreatedForAddiction,
            @RequestParam(value = "familyMembers_hasACriminalRecord[]", defaultValue = "") String[] familyMembers_hasACriminalRecord,
            @RequestParam(value = "familyMembers_hasAMentalIllness[]", defaultValue = "") String[] familyMembers_hasAMentalIllness,
            @RequestParam(value = "familyMembers_hasSuicideAttempts[]", defaultValue = "") String[] familyMembers_hasSuicideAttempts,
            @RequestParam(value = "familyMembers_hasADisability[]", defaultValue = "") String[] familyMembers_hasADisability,
            @RequestParam(value = "familyMembers_hasDied[]", defaultValue = "") String[] familyMembers_hasDied,
            @RequestParam(value = "familyMembers_isBroughtUpSeparately[]", defaultValue = "") String[] familyMembers_isBroughtUpSeparately,

            @RequestParam(value = "educations_institutionType[]", defaultValue = "") String[] educations_institutionType,
            @RequestParam(value = "educations_institutionName[]", defaultValue = "") String[] educations_institutionName,
            @RequestParam(value = "educations_specialty[]", defaultValue = "") String[] educations_specialty,
            @RequestParam(value = "educations_yearOfEnding[]", defaultValue = "") String[] educations_yearOfEnding,
            @RequestParam(value = "educations_unfinished[]", defaultValue = "") String[] educations_unfinished,
            @RequestParam(value = "educations_highAchiever[]", defaultValue = "") String[] educations_highAchiever,
            @RequestParam(value = "educations_redDiploma[]", defaultValue = "") String[] educations_redDiploma,

            @RequestParam(value = "foreignLanguages_language[]", defaultValue = "") String[] foreignLanguages_language,
            @RequestParam(value = "foreignLanguages_level[]", defaultValue = "") String[] foreignLanguages_level,

            HttpServletResponse response) throws UnsupportedEncodingException {

        Cadet cadet = new Cadet();

        try {

            Division division = divisionRepository.findOne(divisionId);

            cadet.setDivision(division);

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


            cadet.setConcussionsWereNot(concussionsWereNot);
            cadet.setTraumaticBrainInjuryWasNot(traumaticBrainInjuryWasNot);
            cadet.setTheNarcologWasNot(theNarcologWasNot);
            cadet.setThePsychiatristWasNot(thePsychiatristWasNot);
            cadet.setThoughtsOfSuicideDoesNotHave(thoughtsOfSuicideDoesNotHave);
            cadet.setAdministrativeOffenseDidNotCommit(administrativeOffenseDidNotCommit);
            cadet.setPoliceRecordDoesNotHave(policeRecordDoesNotHave);
            cadet.setCriminalLiabilityWasNotInvolved(criminalLiabilityWasNotInvolved);
            cadet.setRelativesAndFriendsAbroad(relativesAndFriendsAbroad);


            cadet.setFatherExist(fatherExist);
            cadet.setMotherExist(motherExist);
            cadet.setHasInformationAboutParents(hasInformationAboutParents);

            cadet.setSurname(surname);
            cadet.setName(name);
            cadet.setPatronymic(patronymic);
            cadet.setDateOfBirth(RuarmyUtils.SIMPLE_DATE_FORMAT.parse(dateOfBirth));
            cadet.setNationality(nationality);


            if ("10".equals(religion)) {
                cadet.setReligion(customReligion);
            } else {
                cadet.setReligion(religion);
            }

            cadet.setMilitaryRank(militaryRank);

            cadet.setPost(post);

            cadet.setPassportNumber(passportNumber);
            cadet.setMilitaryIdNumber(militaryIdNumber);

            cadet.setPhone(phone);


            cadet.setFaculty(faculty);
            cadet.setSpecialty(specialty);
            cadet.setYearOfAdmission(yearOfAdmission);

            cadet.setCompositionOfFamily(compositionOfFamily);

            cadet.setWithoutFather(withoutFather);
            cadet.setWithoutMother(withoutMother);
            cadet.setMarried(married);
            cadet.setMarrieds(marrieds);

            cadet.setAlcohol(alcohol);
            cadet.setDrugUse(drugUse);

            cadet.setChronicDiseases(chronicDiseases);
            cadet.setValidityCategory(validityCategory);

            cadet.setScars(scars);
            cadet.setTattoo(tattoo);
            cadet.setAbroad(abroad);

            String dlsStr = "";
            if (driversLicenses.length > 0) {
                for (String dl : driversLicenses) {
                    dlsStr += dl + "|";
                }
                cadet.setDrivingLicense(dlsStr.substring(0, dlsStr.length() - 1));
            }


            String skillsStr = "";
            if (skills.length > 0) {
                for (String skill : skills) {
                    skillsStr += skill + "|";
                }
                cadet.setSkills(skillsStr.substring(0, skillsStr.length() - 1));
            }


            for (int i = 0; i < tripsAbroads_who.length; i++) {
                TripsAbroad tripsAbroad = new TripsAbroad();
                tripsAbroad.setCadet(cadet);
                tripsAbroad.setWho(tripsAbroads_who[i]);
                tripsAbroad.setFirstName(tripsAbroads_firstName[i]);
                tripsAbroad.setLastName(tripsAbroads_lastName[i]);
                tripsAbroad.setPatronymic(tripsAbroads_patronymic[i]);
                tripsAbroad.setCountry(tripsAbroads_country[i]);
                tripsAbroad.setDoMaintainARelationship("true".equals(tripsAbroads_doMaintainARelationship[i]));
                cadet.getTripsAbroads().add(tripsAbroad);
            }

            for (int i = 0; i < familyMembers_firstName.length; i++) {
                FamilyMember familyMember = new FamilyMember();
                familyMember.setCadet(cadet);
                familyMember.setType(
                        FamilyMemberType.getByInt(familyMembers_type[i]-1)
                        );
                familyMember.setFirstName(familyMembers_firstName[i]);
                familyMember.setLastName(familyMembers_lastName[i]);
                familyMember.setPatronymic(familyMembers_patronymic[i]);
                familyMember.setDateOfBirth(RuarmyUtils.SIMPLE_DATE_FORMAT.parse(familyMembers_dateOfBirth[i]));
                familyMember.setOccupation(familyMembers_occupation[i]);
                familyMember.setPhone(familyMembers_phone[i]);
                familyMember.setWasTreatedForAlcoholism("true".equals(familyMembers_wasTreatedForAlcoholism[i]));
                familyMember.setWasTreatedForAddiction("true".equals(familyMembers_wasTreatedForAddiction[i]));
                familyMember.setHasACriminalRecord("true".equals(familyMembers_hasACriminalRecord[i]));
                familyMember.setHasAMentalIllness("true".equals(familyMembers_hasAMentalIllness[i]));
                familyMember.setHasSuicideAttempts("true".equals(familyMembers_hasSuicideAttempts[i]));
                familyMember.setHasADisability("true".equals(familyMembers_hasADisability[i]));
                familyMember.setHasDied("true".equals(familyMembers_hasDied[i]));
                familyMember.setBroughtUpSeparately("true".equals(familyMembers_isBroughtUpSeparately[i]));
                cadet.getFamilyMembers().add(familyMember);
            }


            for (int i = 0; i < educations_institutionType.length; i++) {
                Education education = new Education();
                education.setCadet(cadet);
                education.setInstitutionType(educations_institutionType[i]);
                education.setInstitutionName(educations_institutionName[i]);
                education.setSpeciality(educations_specialty[i]);
                education.setYearOfEnding(educations_yearOfEnding[i]);
                education.setUnfinished("true".equals(educations_unfinished[i]));
                education.setHighAchiever("true".equals(educations_highAchiever[i]));
                education.setRedDiploma("true".equals(educations_redDiploma[i]));
                cadet.getEducations().add(education);
            }

            for (int i = 0; i < foreignLanguages_language.length; i++) {
                ForeignLanguage foreignLanguage = new ForeignLanguage();
                foreignLanguage.setCadet(cadet);
                foreignLanguage.setLanguage(foreignLanguages_language[i]);
                foreignLanguage.setLevel(foreignLanguages_level[i]);
                cadet.getForeignLanguages().add(foreignLanguage);
            }


            cadetRepository.save(cadet);
            printSuccessStatus(response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

    @RequestMapping(value = "/loadCadets", method = RequestMethod.POST)
    public void loadCadets(HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            List<Cadet> cadets = new ArrayList<Cadet>();

            for (Cadet cadet : cadetRepository.findAll()) {
                cadets.add(cadet);
            }

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();

            jsonWriter.name("data");
            jsonWriter.beginArray();
            for (Cadet cadet : cadets) {
                jsonWriter.beginObject();
                jsonWriter.name("id").value(cadet.getId());
                jsonWriter.name("cursantId").value(cadet.getId());
                jsonWriter.name("fio").value(cadet.getName() + " " + cadet.getSurname() + " " + cadet.getPatronymic());
                jsonWriter.name("militaryRank").value(cadet.getMilitaryRank());
                jsonWriter.name("post").value(cadet.getPost());
                jsonWriter.name("division").value(cadet.getDivision() == null ? "" : cadet.getDivision().getName());
                jsonWriter.name("faculty").value(cadet.getFaculty());
                jsonWriter.name("speciality").value(cadet.getSpecialty());
                jsonWriter.name("nationality").value(cadet.getNationality());
                jsonWriter.name("religion").value(cadet.getReligion());

                String family = "";
                family += cadet.getCompositionOfFamily() + " " + cadet.getHasInformationAboutParents() + " " +
                        cadet.getWithoutFather() + " " + cadet.getWithoutMother() + " " +
                        cadet.getFatherExist() + " " + cadet.getMotherExist() + " " + cadet.getMarried();

                jsonWriter.name("family").value(family);
                jsonWriter.name("validityCategory").value(cadet.getValidityCategory());

                jsonWriter.name("actualAddress").value(cadet.getAddressData().getActualAddress());
                jsonWriter.name("registeredAddress").value(cadet.getAddressData().getRegisteredAddress());
                jsonWriter.name("placeOfBirth").value(cadet.getAddressData().getBirthAddress());
                jsonWriter.name("dateOfBirth").value(RuarmyUtils.SIMPLE_DATE_FORMAT.format(cadet.getDateOfBirth()));


                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/loadCadet", method = RequestMethod.POST)
    public void loadCadet(@RequestParam("cursantId") Long cursantId,
                          HttpServletResponse response) throws UnsupportedEncodingException {
        try {

            Cadet cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());


            jsonWriter.name("addressData");
            jsonWriter.beginObject();
            jsonWriter.name("birthData");
            jsonWriter.beginObject();
            jsonWriter.name("cityOfPlaceOfBirthType").value(nnl(cadet.getAddressData().getCityOfPlaceOfBirthType()));
            jsonWriter.name("cityOfPlaceOfBirth").value(nnl(cadet.getAddressData().getCityOfPlaceOfBirth()));
            jsonWriter.name("subjectOfPlaceOfBirth").value(nnl(cadet.getAddressData().getSubjectOfPlaceOfBirth()));
            jsonWriter.endObject();
            jsonWriter.name("registeredData");
            jsonWriter.beginObject();
            jsonWriter.name("cityOfRegisteredAddressType").value(nnl(cadet.getAddressData().getCityOfRegisteredAddressType()));
            jsonWriter.name("streetOfRegisteredAddressType").value(nnl(cadet.getAddressData().getStreetOfRegisteredAddressType()));
            jsonWriter.name("cityOfRegisteredAddress").value(nnl(cadet.getAddressData().getCityOfRegisteredAddress()));
            jsonWriter.name("streetOfRegisteredAddress").value(nnl(cadet.getAddressData().getStreetOfRegisteredAddress()));
            jsonWriter.name("subjectOfRegisteredAddress").value(nnl(cadet.getAddressData().getSubjectOfRegisteredAddress()));
            jsonWriter.name("houseOfRegisteredAddress").value(nnl(cadet.getAddressData().getHouseOfRegisteredAddress()));
            jsonWriter.name("buildingOfRegisteredAddress").value(nnl(cadet.getAddressData().getBuildingOfRegisteredAddress()));
            jsonWriter.name("apartmentOfRegisteredAddress").value(nnl(cadet.getAddressData().getApartmentOfRegisteredAddress()));
            jsonWriter.name("indexOfRegisteredAddress").value(nnl(cadet.getAddressData().getIndexOfRegisteredAddress()));
            jsonWriter.endObject();
            jsonWriter.name("actualData");
            jsonWriter.beginObject();
            jsonWriter.name("cityOfActualAddressType").value(nnl(cadet.getAddressData().getCityOfActualAddressType()));
            jsonWriter.name("streetOfActualAddressType").value(nnl(cadet.getAddressData().getStreetOfActualAddressType()));
            jsonWriter.name("cityOfActualAddress").value(nnl(cadet.getAddressData().getCityOfActualAddress()));
            jsonWriter.name("streetOfActualAddress").value(nnl(cadet.getAddressData().getStreetOfActualAddress()));
            jsonWriter.name("subjectOfActualAddress").value(nnl(cadet.getAddressData().getSubjectOfActualAddress()));
            jsonWriter.name("houseOfActualAddress").value(nnl(cadet.getAddressData().getHouseOfActualAddress()));
            jsonWriter.name("buildingOfActualAddress").value(nnl(cadet.getAddressData().getBuildingOfActualAddress()));
            jsonWriter.name("apartmentOfActualAddress").value(nnl(cadet.getAddressData().getApartmentOfActualAddress()));
            jsonWriter.name("indexOfActualAddress").value(nnl(cadet.getAddressData().getIndexOfActualAddress()));
            jsonWriter.endObject();
            jsonWriter.endObject();


            jsonWriter.name("health");
            jsonWriter.beginObject();
            jsonWriter.name("concussionsWereNot").value(nnl(cadet.getConcussionsWereNot()));
            jsonWriter.name("traumaticBrainInjuryWasNot").value(nnl(cadet.getTraumaticBrainInjuryWasNot()));
            jsonWriter.name("theNarcologWasNot").value(nnl(cadet.getTheNarcologWasNot()));
            jsonWriter.name("thePsychiatristWasNot").value(nnl(cadet.getThePsychiatristWasNot()));
            jsonWriter.name("alcohol").value(nnl(cadet.getAlcohol()));
            jsonWriter.name("drugUse").value(nnl(cadet.getDrugUse()));
            jsonWriter.name("chronicDiseases").value(nnl(cadet.getChronicDiseases()));
            jsonWriter.name("validityCategory").value(nnl(cadet.getValidityCategory()));
            jsonWriter.endObject();


            jsonWriter.name("behavior");
            jsonWriter.beginObject();
            jsonWriter.name("thoughtsOfSuicideDoesNotHave").value(nnl(cadet.getThoughtsOfSuicideDoesNotHave()));
            jsonWriter.name("administrativeOffenseDidNotCommit").value(nnl(cadet.getAdministrativeOffenseDidNotCommit()));
            jsonWriter.name("policeRecordDoesNotHave").value(nnl(cadet.getPoliceRecordDoesNotHave()));
            jsonWriter.name("criminalLiabilityWasNotInvolved").value(nnl(cadet.getCriminalLiabilityWasNotInvolved()));
            jsonWriter.name("relativesAndFriendsAbroad").value(nnl(cadet.getRelativesAndFriendsAbroad()));
            jsonWriter.endObject();


            jsonWriter.name("familyComposition");
            jsonWriter.beginObject();
            jsonWriter.name("fatherExist").value(nnl(cadet.getFatherExist()));
            jsonWriter.name("motherExist").value(nnl(cadet.getMotherExist()));
            jsonWriter.name("hasInformationAboutParents").value(nnl(cadet.getHasInformationAboutParents()));
            jsonWriter.name("withoutFather").value(nnl(cadet.getWithoutFather()));
            jsonWriter.name("withoutMother").value(nnl(cadet.getWithoutMother()));
            jsonWriter.name("married").value(nnl(cadet.getMarried()));
            jsonWriter.name("marrieds").value(nnl(cadet.getMarrieds()));
            jsonWriter.name("compositionOfFamily").value(nnl(cadet.getCompositionOfFamily()));
            jsonWriter.name("familyMembers");
            jsonWriter.beginArray();


            for (FamilyMember familyMember : cadet.getFamilyMembers()) {
                jsonWriter.beginObject();
                jsonWriter.name("firstName").value(nnl(familyMember.getFirstName()));
                jsonWriter.name("lastName").value(nnl(familyMember.getLastName()));
                jsonWriter.name("patronymic").value(nnl(familyMember.getPatronymic()));
                jsonWriter.name("dateOfBirth").value(nnl(RuarmyUtils.SIMPLE_DATE_FORMAT.format(familyMember.getDateOfBirth())));
                jsonWriter.name("occupation").value(nnl(familyMember.getOccupation()));
                jsonWriter.name("phone").value(nnl(familyMember.getPhone()));
                jsonWriter.name("wasTreatedForAlcoholism").value(nnl(familyMember.getWasTreatedForAlcoholism()));
                jsonWriter.name("wasTreatedForAddiction").value(nnl(familyMember.getWasTreatedForAddiction()));
                jsonWriter.name("hasACriminalRecord").value(nnl(familyMember.getHasACriminalRecord()));
                jsonWriter.name("hasAMentalIllness").value(nnl(familyMember.getHasAMentalIllness()));
                jsonWriter.name("hasSuicideAttempts").value(nnl(familyMember.getHasSuicideAttempts()));
                jsonWriter.name("hasADisability").value(nnl(familyMember.getHasADisability()));
                jsonWriter.name("hasDied").value(nnl(familyMember.getHasDied()));
                jsonWriter.name("broughtUpSeparately").value(nnl(familyMember.getBroughtUpSeparately()));
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();


            jsonWriter.name("totalInformation");
            jsonWriter.beginObject();
            jsonWriter.name("name").value(nnl(cadet.getName()));
            jsonWriter.name("patronymic").value(nnl(cadet.getPatronymic()));
            jsonWriter.name("surname").value(nnl(cadet.getSurname()));
            jsonWriter.name("dateOfBirth").value(nnl(RuarmyUtils.SIMPLE_DATE_FORMAT.format(cadet.getDateOfBirth())));
            jsonWriter.name("nationality").value(nnl(cadet.getNationality()));
            jsonWriter.name("religion").value(nnl(cadet.getReligion()));
            jsonWriter.name("militaryRank").value(nnl(cadet.getMilitaryRank()));
            jsonWriter.name("division");
            jsonWriter.beginObject();
            jsonWriter.name("id").value(nnl(cadet.getDivision().getId()));
            jsonWriter.name("name").value(nnl(cadet.getDivision().getName()));
            jsonWriter.endObject();
            jsonWriter.name("post").value(nnl(cadet.getPost()));
            jsonWriter.name("passportNumber").value(nnl(cadet.getPassportNumber()));
            jsonWriter.name("militaryIdNumber").value(nnl(cadet.getMilitaryIdNumber()));
            jsonWriter.name("phone").value(nnl(cadet.getPhone()));
            jsonWriter.endObject();


            jsonWriter.name("educationAndSkills");
            jsonWriter.beginObject();
            jsonWriter.name("faculty").value(nnl(cadet.getFaculty()));
            jsonWriter.name("specialty").value(nnl(cadet.getSpecialty()));
            jsonWriter.name("yearOfAdmission").value(nnl(cadet.getYearOfAdmission()));
            jsonWriter.name("phone").value(nnl(cadet.getPhone()));
            jsonWriter.name("familyMembers");
            jsonWriter.beginArray();
            for (Education education : cadet.getEducations()) {
                jsonWriter.beginObject();
                jsonWriter.name("institutionType").value(nnl(education.getInstitutionType()));
                jsonWriter.name("institutionName").value(nnl(education.getInstitutionName()));
                jsonWriter.name("speciality").value(nnl(education.getSpeciality()));
                jsonWriter.name("yearOfEnding").value(nnl(education.getYearOfEnding()));
                jsonWriter.name("unfinished").value(nnl(education.getUnfinished()));
                jsonWriter.name("highAchiever").value(nnl(education.getHighAchiever()));
                jsonWriter.name("redDiploma").value(nnl(education.getRedDiploma()));
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.name("skillsString").value(nnl(cadet.getSkills()));
            jsonWriter.name("driversLicensesString").value(nnl(cadet.getDrivingLicense()));
            jsonWriter.name("foreignLanguages");
            jsonWriter.beginArray();
            for (ForeignLanguage foreignLanguage : cadet.getForeignLanguages()) {
                jsonWriter.beginObject();
                jsonWriter.name("language").value(nnl(foreignLanguage.getLanguage()));
                jsonWriter.name("level").value(nnl(foreignLanguage.getLevel()));
                jsonWriter.endObject();
            }
            jsonWriter.endArray();
            jsonWriter.endObject();


            jsonWriter.name("tripsAbroad");
            jsonWriter.beginArray();
            for (TripsAbroad tripsAbroad : cadet.getTripsAbroads()) {
                jsonWriter.beginObject();
                jsonWriter.name("who").value(nnl(tripsAbroad.getWho()));
                jsonWriter.name("firstName").value(nnl(tripsAbroad.getFirstName()));
                jsonWriter.name("lastName").value(nnl(tripsAbroad.getLastName()));
                jsonWriter.name("patronymic").value(nnl(tripsAbroad.getPatronymic()));
                jsonWriter.name("country").value(nnl(tripsAbroad.getCountry()));
                jsonWriter.name("doMaintainARelationship").value(nnl(tripsAbroad.getDoMaintainARelationship()));
                jsonWriter.endObject();
            }
            jsonWriter.endArray();


            jsonWriter.name("additionally");
            jsonWriter.beginObject();
            jsonWriter.name("scars").value(nnl(cadet.getScars()));
            jsonWriter.name("tattoo").value(nnl(cadet.getTattoo()));
            jsonWriter.name("abroad").value(nnl(cadet.getAbroad()));
            jsonWriter.endObject();



            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}
