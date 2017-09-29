package ruarmy.controller;

import com.google.gson.stream.JsonWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.RuarmyUtils;
import ruarmy.domain.*;
import ruarmy.enums.*;
import ruarmy.repository.CadetRepository;
import ruarmy.repository.DivisionRepository;
import ruarmy.repository.SubjectRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
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

    @Autowired
    private SubjectRepository subjectRepository;

    RuarmyResources ruarmyResources = new RuarmyResources();

    @RequestMapping(value = "/saveCadet", method = RequestMethod.POST)
    public void saveCadet(

            @RequestParam("addressData[subjectOfPlaceOfBirthType]") Integer subjectOfPlaceOfBirthType,
            @RequestParam("addressData[subjectOfPlaceOfBirth]") String subjectOfPlaceOfBirth,
            @RequestParam("addressData[cityOfPlaceOfBirthType]") Integer cityOfPlaceOfBirthType,
            @RequestParam("addressData[cityOfPlaceOfBirth]") String cityOfPlaceOfBirth,

            @RequestParam("addressData[subjectOfRegisteredAddressType]") Integer subjectOfRegisteredAddressType,
            @RequestParam("addressData[subjectOfRegisteredAddress]") String subjectOfRegisteredAddress,
            @RequestParam("addressData[cityOfRegisteredAddressType]") Integer cityOfRegisteredAddressType,
            @RequestParam("addressData[cityOfRegisteredAddress]") String cityOfRegisteredAddress,
            @RequestParam("addressData[streetOfRegisteredAddressType]") Integer streetOfRegisteredAddressType,
            @RequestParam("addressData[streetOfRegisteredAddress]") String streetOfRegisteredAddress,
            @RequestParam(value = "addressData[houseOfRegisteredAddress]", defaultValue = "") String houseOfRegisteredAddress,
            @RequestParam(value = "addressData[buildingOfRegisteredAddress]", defaultValue = "") String buildingOfRegisteredAddress,
            @RequestParam(value = "addressData[apartmentOfRegisteredAddress]", defaultValue = "") String apartmentOfRegisteredAddress,
            @RequestParam(value = "addressData[indexOfRegisteredAddress]", defaultValue = "") String indexOfRegisteredAddress,

            @RequestParam("addressData[subjectOfActualAddressType]") Integer subjectOfActualAddressType,
            @RequestParam("addressData[subjectOfActualAddress]") String subjectOfActualAddress,
            @RequestParam("addressData[cityOfActualAddressType]") Integer cityOfActualAddressType,
            @RequestParam("addressData[cityOfActualAddress]") String cityOfActualAddress,
            @RequestParam("addressData[streetOfActualAddressType]") Integer streetOfActualAddressType,
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
            @RequestParam("speciality") String speciality,
            @RequestParam("yearOfAdmission") Integer yearOfAdmission,

            @RequestParam("compositionOfFamily") String compositionOfFamily,

            @RequestParam(value = "withoutFather", defaultValue = "") String withoutFather,
            @RequestParam(value = "withoutFather", defaultValue = "") String withoutMother,

            @RequestParam(value = "fatherExist", defaultValue = "") Boolean fatherExist,
            @RequestParam(value = "motherExist", defaultValue = "") Boolean motherExist,
            @RequestParam(value = "hasInformationAboutParents", defaultValue = "") Boolean hasInformationAboutParents,

            @RequestParam("married") String married,
            @RequestParam("marrieds") String marrieds,

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

            @RequestParam(value = "educations_institutionType[]", defaultValue = "") String[] educations_institutionType,
            @RequestParam(value = "educations_institutionName[]", defaultValue = "") String[] educations_institutionName,
            @RequestParam(value = "educations_speciality[]", defaultValue = "") String[] educations_speciality,
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
            cadet.getAddressData().setSubjectOfPlaceOfBirthType(subjectOfPlaceOfBirthType);
            cadet.getAddressData().setSubjectOfPlaceOfBirth(subjectOfPlaceOfBirth);
            cadet.getAddressData().setCityOfPlaceOfBirthType(cityOfPlaceOfBirthType);
            cadet.getAddressData().setCityOfPlaceOfBirth(cityOfPlaceOfBirth);

            cadet.getAddressData().setSubjectOfRegisteredAddressType(subjectOfRegisteredAddressType);
            cadet.getAddressData().setSubjectOfRegisteredAddress(subjectOfRegisteredAddress);
            cadet.getAddressData().setCityOfRegisteredAddressType(cityOfRegisteredAddressType);
            cadet.getAddressData().setCityOfRegisteredAddress(cityOfRegisteredAddress);
            cadet.getAddressData().setStreetOfRegisteredAddressType(streetOfRegisteredAddressType);
            cadet.getAddressData().setStreetOfRegisteredAddress(streetOfRegisteredAddress);
            cadet.getAddressData().setHouseOfRegisteredAddress(houseOfRegisteredAddress);
            cadet.getAddressData().setBuildingOfRegisteredAddress(buildingOfRegisteredAddress);
            cadet.getAddressData().setApartmentOfRegisteredAddress(apartmentOfRegisteredAddress);
            cadet.getAddressData().setIndexOfRegisteredAddress(indexOfRegisteredAddress);

            cadet.getAddressData().setSubjectOfActualAddressType(subjectOfActualAddressType);
            cadet.getAddressData().setSubjectOfActualAddress(subjectOfActualAddress);
            cadet.getAddressData().setCityOfActualAddressType(cityOfActualAddressType);
            cadet.getAddressData().setCityOfActualAddress(cityOfActualAddress);
            cadet.getAddressData().setStreetOfActualAddressType(streetOfActualAddressType);
            cadet.getAddressData().setStreetOfActualAddress(streetOfActualAddress);
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
            cadet.setSpeciality(speciality);
            cadet.setYearOfAdmission(yearOfAdmission);


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


            cadet.setCompositionOfFamily(compositionOfFamily);
            cadet.setFatherExist(fatherExist);
            cadet.setMotherExist(motherExist);
            cadet.setHasInformationAboutParents(hasInformationAboutParents);

            cadet.setWithoutFather(withoutFather);
            cadet.setWithoutMother(withoutMother);
            cadet.setMarried(married);
            cadet.setMarrieds(marrieds);

            for (int i = 0; i < familyMembers_firstName.length; i++) {
                FamilyMember familyMember = new FamilyMember();
                familyMember.setCadet(cadet);
                familyMember.setType(
                        FamilyMemberType.getByInt(familyMembers_type[i] - 1)
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
                education.setSpeciality(educations_speciality[i]);
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
                jsonWriter.name("speciality").value(cadet.getSpeciality());
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
            jsonWriter.name("subjectOfPlaceOfBirthType").value(nnl(cadet.getAddressData().getSubjectOfPlaceOfBirthType()));

            jsonWriter.name("subjectOfPlaceOfBirthTypeName").value(
                    ruarmyResources.getString(
                            SubjectType.getByInt(cadet.getAddressData().getSubjectOfPlaceOfBirthType() - 1).getResourceKey()
                    ));

            jsonWriter.name("subjectOfPlaceOfBirth").value(nnl(cadet.getAddressData().getSubjectOfPlaceOfBirth()));


            jsonWriter.name("cityOfPlaceOfBirthType").value(nnl(cadet.getAddressData().getCityOfPlaceOfBirthType()));

            jsonWriter.name("cityOfPlaceOfBirthTypeName").value(
                    ruarmyResources.getString(
                            CityType.getByInt(cadet.getAddressData().getCityOfPlaceOfBirthType() - 1).getResourceKey()
                    ));

            jsonWriter.name("cityOfPlaceOfBirth").value(nnl(cadet.getAddressData().getCityOfPlaceOfBirth()));

            jsonWriter.endObject();
            jsonWriter.name("registeredData");
            jsonWriter.beginObject();
            jsonWriter.name("subjectOfRegisteredAddressType").value(nnl(cadet.getAddressData().getSubjectOfRegisteredAddressType()));

            jsonWriter.name("subjectOfRegisteredAddressTypeName").value(
                    ruarmyResources.getString(
                            SubjectType.getByInt(cadet.getAddressData().getSubjectOfRegisteredAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("subjectOfRegisteredAddress").value(nnl(cadet.getAddressData().getSubjectOfRegisteredAddress()));
            jsonWriter.name("cityOfRegisteredAddressType").value(nnl(cadet.getAddressData().getCityOfRegisteredAddressType()));

            jsonWriter.name("cityOfRegisteredAddressTypeName").value(
                    ruarmyResources.getString(
                            CityType.getByInt(cadet.getAddressData().getCityOfRegisteredAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("cityOfRegisteredAddress").value(nnl(cadet.getAddressData().getCityOfRegisteredAddress()));
            jsonWriter.name("streetOfRegisteredAddressType").value(nnl(cadet.getAddressData().getStreetOfRegisteredAddressType()));

            jsonWriter.name("streetOfRegisteredAddressTypeName").value(
                    ruarmyResources.getString(
                            StreetType.getByInt(cadet.getAddressData().getStreetOfRegisteredAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("streetOfRegisteredAddress").value(nnl(cadet.getAddressData().getStreetOfRegisteredAddress()));
            jsonWriter.name("houseOfRegisteredAddress").value(nnl(cadet.getAddressData().getHouseOfRegisteredAddress()));
            jsonWriter.name("buildingOfRegisteredAddress").value(nnl(cadet.getAddressData().getBuildingOfRegisteredAddress()));
            jsonWriter.name("apartmentOfRegisteredAddress").value(nnl(cadet.getAddressData().getApartmentOfRegisteredAddress()));
            jsonWriter.name("indexOfRegisteredAddress").value(nnl(cadet.getAddressData().getIndexOfRegisteredAddress()));
            jsonWriter.endObject();
            jsonWriter.name("actualData");
            jsonWriter.beginObject();
            jsonWriter.name("subjectOfActualAddressType").value(nnl(cadet.getAddressData().getSubjectOfActualAddressType()));

            jsonWriter.name("subjectOfActualAddressTypeName").value(
                    ruarmyResources.getString(
                            SubjectType.getByInt(cadet.getAddressData().getSubjectOfActualAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("subjectOfActualAddress").value(nnl(cadet.getAddressData().getSubjectOfActualAddress()));
            jsonWriter.name("cityOfActualAddressType").value(nnl(cadet.getAddressData().getCityOfActualAddressType()));

            jsonWriter.name("cityOfActualAddressTypeName").value(
                    ruarmyResources.getString(
                            CityType.getByInt(cadet.getAddressData().getCityOfActualAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("cityOfActualAddress").value(nnl(cadet.getAddressData().getCityOfActualAddress()));
            jsonWriter.name("streetOfActualAddressType").value(nnl(cadet.getAddressData().getStreetOfActualAddressType()));

            jsonWriter.name("streetOfActualAddressTypeName").value(
                    ruarmyResources.getString(
                            StreetType.getByInt(cadet.getAddressData().getStreetOfActualAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("streetOfActualAddress").value(nnl(cadet.getAddressData().getStreetOfActualAddress()));
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
            jsonWriter.name("suicideAttemptsDidNotCommit").value(nnl(cadet.getSuicideAttemptsDidNotCommit()));
            jsonWriter.name("administrativeOffenseDidNotCommit").value(nnl(cadet.getAdministrativeOffenseDidNotCommit()));
            jsonWriter.name("policeRecordDoesNotHave").value(nnl(cadet.getPoliceRecordDoesNotHave()));
            jsonWriter.name("criminalLiabilityWasNotInvolved").value(nnl(cadet.getCriminalLiabilityWasNotInvolved()));
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
                jsonWriter.name("familyMemberType").value(String.valueOf(FamilyMemberType.getInt(familyMember.getType()) + 1));
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

            jsonWriter.name("religion");
            jsonWriter.beginObject();

            if ("1".equals(cadet.getReligion()) ||
                    "2".equals(cadet.getReligion()) ||
                    "3".equals(cadet.getReligion()) ||
                    "4".equals(cadet.getReligion()) ||
                    "5".equals(cadet.getReligion()) ||
                    "6".equals(cadet.getReligion()) ||
                    "7".equals(cadet.getReligion()) ||
                    "8".equals(cadet.getReligion()) ||
                    "9".equals(cadet.getReligion())
                    ) {
                jsonWriter.name("id").value(nnl(cadet.getReligion()));
                jsonWriter.name("name").value(
                        ruarmyResources.getString(
                                Religion.getByInt(Integer.valueOf(cadet.getReligion()) - 1).getResourceKey()
                        ));
            } else {
                jsonWriter.name("id").value("10");
                jsonWriter.name("name").value(cadet.getReligion());
            }

            jsonWriter.endObject();


            jsonWriter.name("militaryRank");
            jsonWriter.beginObject();
            jsonWriter.name("id").value(nnl(cadet.getMilitaryRank()));
            jsonWriter.name("name").value(
                    ruarmyResources.getString(
                            MilitaryRank.getByInt(Integer.valueOf(cadet.getMilitaryRank()) - 1).getResourceKey()
                    ));
            jsonWriter.endObject();

            jsonWriter.name("division");
            jsonWriter.beginObject();
            jsonWriter.name("id").value(nnl(cadet.getDivision().getId()));
            jsonWriter.name("name").value(nnl(cadet.getDivision().getName()));
            jsonWriter.endObject();
            jsonWriter.name("post").value(nnl(cadet.getPost()));
            jsonWriter.name("passportNumber").value(nnl(cadet.getPassportNumber()));
            jsonWriter.name("militaryIdNumber").value(nnl(cadet.getMilitaryIdNumber()));
            jsonWriter.name("phone").value(nnl(cadet.getPhone()));
            jsonWriter.name("faculty").value(nnl(cadet.getFaculty()));
            jsonWriter.name("speciality").value(nnl(cadet.getSpeciality()));
            jsonWriter.name("yearOfAdmission").value(nnl(cadet.getYearOfAdmission()));
            jsonWriter.endObject();


            jsonWriter.name("educationAndSkills");
            jsonWriter.beginObject();

            jsonWriter.name("educations");
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


            jsonWriter.name("skills");
            jsonWriter.beginArray();
            if (cadet.getSkills() != null)
                for (String s : cadet.getSkills().split("\\|")) {
                    jsonWriter.value(s);
                }
            jsonWriter.endArray();


            jsonWriter.name("driversLicenses");
            jsonWriter.beginArray();
            if (cadet.getDrivingLicense() != null)
                for (String s : cadet.getDrivingLicense().split("\\|")) {
                    jsonWriter.value(s);
                }
            jsonWriter.endArray();


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


    @RequestMapping(value = "/saveAndLoadTotalInformation", method = RequestMethod.POST)
    public void saveAndLoadTotalInformation(@RequestParam("id") Long cursantId,
                                            @RequestParam("name") String name,
                                            @RequestParam("surname") String surname,
                                            @RequestParam("patronymic") String patronymic,
                                            @RequestParam("dateOfBirth") String dateOfBirthOri,
                                            @RequestParam("nationality") String nationality,
                                            @RequestParam("religion[id]") Long religionId,
                                            @RequestParam("religion[name]") String religionName,
                                            @RequestParam("militaryRank[id]") Long militaryRankId,
                                            @RequestParam("militaryRank[name]") String militaryRankName,
                                            @RequestParam("division[id]") Long divisionId,
                                            @RequestParam("division[name]") String divisionName,
                                            @RequestParam("post") String post,
                                            @RequestParam("passportNumber") String passportNumber,
                                            @RequestParam("militaryIdNumber") String militaryIdNumber,
                                            @RequestParam("phone") String phone,
                                            @RequestParam("faculty") String faculty,
                                            @RequestParam("speciality") String speciality,
                                            @RequestParam("yearOfAdmission") Integer yearOfAdmission,
                                            HttpServletResponse response) throws UnsupportedEncodingException {
        try {


            Cadet cadet = cadetRepository.findOne(cursantId);

            Division division = divisionRepository.findOne(divisionId);
            cadet.setDivision(division);

            cadet.setSurname(surname);
            cadet.setName(name);
            cadet.setPatronymic(patronymic);
            cadet.setDateOfBirth(RuarmyUtils.SIMPLE_DATE_FORMAT.parse(dateOfBirthOri));
            cadet.setNationality(nationality);
            if (religionId.equals(10)) {
                cadet.setReligion(religionName);
            } else {
                cadet.setReligion(religionId.toString());
            }
            cadet.setMilitaryRank(militaryRankId.toString());
            cadet.setPost(post);
            cadet.setPassportNumber(passportNumber);
            cadet.setMilitaryIdNumber(militaryIdNumber);
            cadet.setPhone(phone);
            cadet.setFaculty(faculty);
            cadet.setSpeciality(speciality);
            cadet.setYearOfAdmission(yearOfAdmission);


            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

            jsonWriter.name("totalInformation");
            jsonWriter.beginObject();
            jsonWriter.name("name").value(nnl(cadet.getName()));
            jsonWriter.name("patronymic").value(nnl(cadet.getPatronymic()));
            jsonWriter.name("surname").value(nnl(cadet.getSurname()));
            jsonWriter.name("dateOfBirth").value(nnl(RuarmyUtils.SIMPLE_DATE_FORMAT.format(cadet.getDateOfBirth())));
            jsonWriter.name("nationality").value(nnl(cadet.getNationality()));

            jsonWriter.name("religion");
            jsonWriter.beginObject();

            if ("1".equals(cadet.getReligion()) ||
                    "2".equals(cadet.getReligion()) ||
                    "3".equals(cadet.getReligion()) ||
                    "4".equals(cadet.getReligion()) ||
                    "5".equals(cadet.getReligion()) ||
                    "6".equals(cadet.getReligion()) ||
                    "7".equals(cadet.getReligion()) ||
                    "8".equals(cadet.getReligion()) ||
                    "9".equals(cadet.getReligion())
                    ) {
                jsonWriter.name("id").value(nnl(cadet.getReligion()));
                jsonWriter.name("name").value(
                        ruarmyResources.getString(
                                Religion.getByInt(Integer.valueOf(cadet.getReligion()) - 1).getResourceKey()
                        ));
            } else {
                jsonWriter.name("id").value("10");
                jsonWriter.name("name").value(cadet.getReligion());
            }

            jsonWriter.endObject();


            jsonWriter.name("militaryRank");
            jsonWriter.beginObject();
            jsonWriter.name("id").value(nnl(cadet.getMilitaryRank()));
            jsonWriter.name("name").value(
                    ruarmyResources.getString(
                            MilitaryRank.getByInt(Integer.valueOf(cadet.getMilitaryRank()) - 1).getResourceKey()
                    ));
            jsonWriter.endObject();

            jsonWriter.name("division");
            jsonWriter.beginObject();
            jsonWriter.name("id").value(nnl(cadet.getDivision().getId()));
            jsonWriter.name("name").value(nnl(cadet.getDivision().getName()));
            jsonWriter.endObject();
            jsonWriter.name("post").value(nnl(cadet.getPost()));
            jsonWriter.name("passportNumber").value(nnl(cadet.getPassportNumber()));
            jsonWriter.name("militaryIdNumber").value(nnl(cadet.getMilitaryIdNumber()));
            jsonWriter.name("phone").value(nnl(cadet.getPhone()));


            jsonWriter.name("faculty").value(nnl(cadet.getFaculty()));
            jsonWriter.name("speciality").value(nnl(cadet.getSpeciality()));
            jsonWriter.name("yearOfAdmission").value(nnl(cadet.getYearOfAdmission()));

            jsonWriter.endObject();
            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException | ParseException e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/saveAndLoadEducationAndSkills", method = RequestMethod.POST)
    public void saveAndLoadEducationAndSkills(@RequestParam("id") Long cursantId,

                                              @RequestParam(value = "skills[]", defaultValue = "") String[] skills,
                                              @RequestParam(value = "driversLicenses[]", defaultValue = "") String[] driversLicenses,

                                              @RequestParam(value = "educations_institutionType[]", defaultValue = "") String[] educations_institutionType,
                                              @RequestParam(value = "educations_institutionName[]", defaultValue = "") String[] educations_institutionName,
                                              @RequestParam(value = "educations_speciality[]", defaultValue = "") String[] educations_speciality,
                                              @RequestParam(value = "educations_yearOfEnding[]", defaultValue = "") String[] educations_yearOfEnding,
                                              @RequestParam(value = "educations_unfinished[]", defaultValue = "") String[] educations_unfinished,
                                              @RequestParam(value = "educations_highAchiever[]", defaultValue = "") String[] educations_highAchiever,
                                              @RequestParam(value = "educations_redDiploma[]", defaultValue = "") String[] educations_redDiploma,

                                              @RequestParam(value = "foreignLanguages_language[]", defaultValue = "") String[] foreignLanguages_language,
                                              @RequestParam(value = "foreignLanguages_level[]", defaultValue = "") String[] foreignLanguages_level,

                                              HttpServletResponse response) throws UnsupportedEncodingException {
        try {


            Cadet cadet = cadetRepository.findOne(cursantId);

            cadet.setEducations(new ArrayList<>());
            for (int i = 0; i < educations_institutionType.length; i++) {
                Education education = new Education();
                education.setCadet(cadet);
                education.setInstitutionType(educations_institutionType[i]);
                education.setInstitutionName(educations_institutionName[i]);
                education.setSpeciality(educations_speciality[i].replace("||comma||",","));
                education.setYearOfEnding(educations_yearOfEnding[i]);
                education.setUnfinished("true".equals(educations_unfinished[i]));
                education.setHighAchiever("true".equals(educations_highAchiever[i]));
                education.setRedDiploma("true".equals(educations_redDiploma[i]));
                cadet.getEducations().add(education);
            }

            cadet.setForeignLanguages(new ArrayList<>());
            for (int i = 0; i < foreignLanguages_language.length; i++) {
                ForeignLanguage foreignLanguage = new ForeignLanguage();
                foreignLanguage.setCadet(cadet);
                foreignLanguage.setLanguage(foreignLanguages_language[i]);
                foreignLanguage.setLevel(foreignLanguages_level[i]);
                cadet.getForeignLanguages().add(foreignLanguage);
            }

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


            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

            jsonWriter.name("educationAndSkills");
            jsonWriter.beginObject();

            jsonWriter.name("educations");
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


            jsonWriter.name("skills");
            jsonWriter.beginArray();
            if (cadet.getSkills() != null)
                for (String s : cadet.getSkills().split("\\|")) {
                    jsonWriter.value(s);
                }
            jsonWriter.endArray();


            jsonWriter.name("driversLicenses");
            jsonWriter.beginArray();
            if (cadet.getDrivingLicense() != null)
                for (String s : cadet.getDrivingLicense().split("\\|")) {
                    jsonWriter.value(s);
                }
            jsonWriter.endArray();


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

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/saveAndLoadAddressData", method = RequestMethod.POST)
    public void saveAndLoadAddressData(@RequestParam("id") Long cursantId,

                                       @RequestParam("birthData[subjectOfPlaceOfBirthType]") Integer subjectOfPlaceOfBirthType,
                                       @RequestParam("birthData[subjectOfPlaceOfBirth]") String subjectOfPlaceOfBirth,
                                       @RequestParam("birthData[cityOfPlaceOfBirthType]") Integer cityOfPlaceOfBirthType,
                                       @RequestParam("birthData[cityOfPlaceOfBirth]") String cityOfPlaceOfBirth,

                                       @RequestParam("registeredData[subjectOfRegisteredAddressType]") Integer subjectOfRegisteredAddressType,
                                       @RequestParam("registeredData[subjectOfRegisteredAddress]") String subjectOfRegisteredAddress,
                                       @RequestParam("registeredData[cityOfRegisteredAddressType]") Integer cityOfRegisteredAddressType,
                                       @RequestParam("registeredData[cityOfRegisteredAddress]") String cityOfRegisteredAddress,
                                       @RequestParam("registeredData[streetOfRegisteredAddressType]") Integer streetOfRegisteredAddressType,
                                       @RequestParam("registeredData[streetOfRegisteredAddress]") String streetOfRegisteredAddress,
                                       @RequestParam(value = "registeredData[houseOfRegisteredAddress]", defaultValue = "") String houseOfRegisteredAddress,
                                       @RequestParam(value = "registeredData[buildingOfRegisteredAddress]", defaultValue = "") String buildingOfRegisteredAddress,
                                       @RequestParam(value = "registeredData[apartmentOfRegisteredAddress]", defaultValue = "") String apartmentOfRegisteredAddress,
                                       @RequestParam(value = "registeredData[indexOfRegisteredAddress]", defaultValue = "") String indexOfRegisteredAddress,

                                       @RequestParam("actualData[subjectOfActualAddressType]") Integer subjectOfActualAddressType,
                                       @RequestParam("actualData[subjectOfActualAddress]") String subjectOfActualAddress,
                                       @RequestParam("actualData[cityOfActualAddressType]") Integer cityOfActualAddressType,
                                       @RequestParam("actualData[cityOfActualAddress]") String cityOfActualAddress,
                                       @RequestParam("actualData[streetOfActualAddressType]") Integer streetOfActualAddressType,
                                       @RequestParam("actualData[streetOfActualAddress]") String streetOfActualAddress,
                                       @RequestParam(value = "actualData[houseOfActualAddress]", defaultValue = "") String houseOfActualAddress,
                                       @RequestParam(value = "actualData[buildingOfActualAddress]", defaultValue = "") String buildingOfActualAddress,
                                       @RequestParam(value = "actualData[apartmentOfActualAddress]", defaultValue = "") String apartmentOfActualAddress,
                                       @RequestParam(value = "actualData[indexOfActualAddress]", defaultValue = "") String indexOfActualAddress,

                                       HttpServletResponse response) throws UnsupportedEncodingException {
        try {


            Cadet cadet = cadetRepository.findOne(cursantId);

            cadet.getAddressData().setSubjectOfPlaceOfBirthType(subjectOfPlaceOfBirthType);
            cadet.getAddressData().setSubjectOfPlaceOfBirth(subjectOfPlaceOfBirth);
            cadet.getAddressData().setCityOfPlaceOfBirthType(cityOfPlaceOfBirthType);
            cadet.getAddressData().setCityOfPlaceOfBirth(cityOfPlaceOfBirth);

            cadet.getAddressData().setSubjectOfRegisteredAddressType(subjectOfRegisteredAddressType);
            cadet.getAddressData().setSubjectOfRegisteredAddress(subjectOfRegisteredAddress);
            cadet.getAddressData().setCityOfRegisteredAddressType(cityOfRegisteredAddressType);
            cadet.getAddressData().setCityOfRegisteredAddress(cityOfRegisteredAddress);
            cadet.getAddressData().setStreetOfRegisteredAddressType(streetOfRegisteredAddressType);
            cadet.getAddressData().setStreetOfRegisteredAddress(streetOfRegisteredAddress);
            cadet.getAddressData().setHouseOfRegisteredAddress(houseOfRegisteredAddress);
            cadet.getAddressData().setBuildingOfRegisteredAddress(buildingOfRegisteredAddress);
            cadet.getAddressData().setApartmentOfRegisteredAddress(apartmentOfRegisteredAddress);
            cadet.getAddressData().setIndexOfRegisteredAddress(indexOfRegisteredAddress);

            cadet.getAddressData().setSubjectOfActualAddressType(subjectOfActualAddressType);
            cadet.getAddressData().setSubjectOfActualAddress(subjectOfActualAddress);
            cadet.getAddressData().setCityOfActualAddressType(cityOfActualAddressType);
            cadet.getAddressData().setCityOfActualAddress(cityOfActualAddress);
            cadet.getAddressData().setStreetOfActualAddressType(streetOfActualAddressType);
            cadet.getAddressData().setStreetOfActualAddress(streetOfActualAddress);
            cadet.getAddressData().setHouseOfActualAddress(houseOfActualAddress);
            cadet.getAddressData().setBuildingOfActualAddress(buildingOfActualAddress);
            cadet.getAddressData().setApartmentOfActualAddress(apartmentOfActualAddress);
            cadet.getAddressData().setIndexOfActualAddress(indexOfActualAddress);


            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

            jsonWriter.name("addressData");
            jsonWriter.beginObject();
            jsonWriter.name("birthData");
            jsonWriter.beginObject();
            jsonWriter.name("subjectOfPlaceOfBirthType").value(nnl(cadet.getAddressData().getSubjectOfPlaceOfBirthType()));

            jsonWriter.name("subjectOfPlaceOfBirthTypeName").value(
                    ruarmyResources.getString(
                            SubjectType.getByInt(cadet.getAddressData().getSubjectOfPlaceOfBirthType() - 1).getResourceKey()
                    ));

            jsonWriter.name("subjectOfPlaceOfBirth").value(nnl(cadet.getAddressData().getSubjectOfPlaceOfBirth()));


            jsonWriter.name("cityOfPlaceOfBirthType").value(nnl(cadet.getAddressData().getCityOfPlaceOfBirthType()));

            jsonWriter.name("cityOfPlaceOfBirthTypeName").value(
                    ruarmyResources.getString(
                            CityType.getByInt(cadet.getAddressData().getCityOfPlaceOfBirthType() - 1).getResourceKey()
                    ));

            jsonWriter.name("cityOfPlaceOfBirth").value(nnl(cadet.getAddressData().getCityOfPlaceOfBirth()));

            jsonWriter.endObject();
            jsonWriter.name("registeredData");
            jsonWriter.beginObject();
            jsonWriter.name("subjectOfRegisteredAddressType").value(nnl(cadet.getAddressData().getSubjectOfRegisteredAddressType()));

            jsonWriter.name("subjectOfRegisteredAddressTypeName").value(
                    ruarmyResources.getString(
                            SubjectType.getByInt(cadet.getAddressData().getSubjectOfRegisteredAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("subjectOfRegisteredAddress").value(nnl(cadet.getAddressData().getSubjectOfRegisteredAddress()));
            jsonWriter.name("cityOfRegisteredAddressType").value(nnl(cadet.getAddressData().getCityOfRegisteredAddressType()));

            jsonWriter.name("cityOfRegisteredAddressTypeName").value(
                    ruarmyResources.getString(
                            CityType.getByInt(cadet.getAddressData().getCityOfRegisteredAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("cityOfRegisteredAddress").value(nnl(cadet.getAddressData().getCityOfRegisteredAddress()));
            jsonWriter.name("streetOfRegisteredAddressType").value(nnl(cadet.getAddressData().getStreetOfRegisteredAddressType()));

            jsonWriter.name("streetOfRegisteredAddressTypeName").value(
                    ruarmyResources.getString(
                            StreetType.getByInt(cadet.getAddressData().getStreetOfRegisteredAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("streetOfRegisteredAddress").value(nnl(cadet.getAddressData().getStreetOfRegisteredAddress()));
            jsonWriter.name("houseOfRegisteredAddress").value(nnl(cadet.getAddressData().getHouseOfRegisteredAddress()));
            jsonWriter.name("buildingOfRegisteredAddress").value(nnl(cadet.getAddressData().getBuildingOfRegisteredAddress()));
            jsonWriter.name("apartmentOfRegisteredAddress").value(nnl(cadet.getAddressData().getApartmentOfRegisteredAddress()));
            jsonWriter.name("indexOfRegisteredAddress").value(nnl(cadet.getAddressData().getIndexOfRegisteredAddress()));
            jsonWriter.endObject();
            jsonWriter.name("actualData");
            jsonWriter.beginObject();
            jsonWriter.name("subjectOfActualAddressType").value(nnl(cadet.getAddressData().getSubjectOfActualAddressType()));

            jsonWriter.name("subjectOfActualAddressTypeName").value(
                    ruarmyResources.getString(
                            SubjectType.getByInt(cadet.getAddressData().getSubjectOfActualAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("subjectOfActualAddress").value(nnl(cadet.getAddressData().getSubjectOfActualAddress()));
            jsonWriter.name("cityOfActualAddressType").value(nnl(cadet.getAddressData().getCityOfActualAddressType()));

            jsonWriter.name("cityOfActualAddressTypeName").value(
                    ruarmyResources.getString(
                            CityType.getByInt(cadet.getAddressData().getCityOfActualAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("cityOfActualAddress").value(nnl(cadet.getAddressData().getCityOfActualAddress()));
            jsonWriter.name("streetOfActualAddressType").value(nnl(cadet.getAddressData().getStreetOfActualAddressType()));

            jsonWriter.name("streetOfActualAddressTypeName").value(
                    ruarmyResources.getString(
                            StreetType.getByInt(cadet.getAddressData().getStreetOfActualAddressType() - 1).getResourceKey()
                    ));

            jsonWriter.name("streetOfActualAddress").value(nnl(cadet.getAddressData().getStreetOfActualAddress()));
            jsonWriter.name("houseOfActualAddress").value(nnl(cadet.getAddressData().getHouseOfActualAddress()));
            jsonWriter.name("buildingOfActualAddress").value(nnl(cadet.getAddressData().getBuildingOfActualAddress()));
            jsonWriter.name("apartmentOfActualAddress").value(nnl(cadet.getAddressData().getApartmentOfActualAddress()));
            jsonWriter.name("indexOfActualAddress").value(nnl(cadet.getAddressData().getIndexOfActualAddress()));
            jsonWriter.endObject();
            jsonWriter.endObject();

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/saveAndLoadFamilyComposition", method = RequestMethod.POST)
    public void saveAndLoadFamilyComposition(@RequestParam("id") Long cursantId,

                                             @RequestParam(value = "compositionOfFamily", defaultValue = "0") String compositionOfFamily,
                                             @RequestParam(value = "withoutFather", defaultValue = "") String withoutFather,
                                             @RequestParam(value = "withoutFather", defaultValue = "") String withoutMother,

                                             @RequestParam(value = "fatherExist", defaultValue = "") Boolean fatherExist,
                                             @RequestParam(value = "motherExist", defaultValue = "") Boolean motherExist,
                                             @RequestParam(value = "hasInformationAboutParents", defaultValue = "") Boolean hasInformationAboutParents,

                                             @RequestParam("married") String married,
                                             @RequestParam("marrieds") String marrieds,

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

                                             HttpServletResponse response) throws UnsupportedEncodingException {
        try {


            Cadet cadet = cadetRepository.findOne(cursantId);

            cadet.setCompositionOfFamily(compositionOfFamily);
            cadet.setFatherExist(fatherExist);
            cadet.setMotherExist(motherExist);
            cadet.setHasInformationAboutParents(hasInformationAboutParents);

            cadet.setWithoutFather(withoutFather);
            cadet.setWithoutMother(withoutMother);
            cadet.setMarried(married);
            cadet.setMarrieds(marrieds);

            cadet.setFamilyMembers(new ArrayList<>());

            for (int i = 0; i < familyMembers_firstName.length; i++) {
                FamilyMember familyMember = new FamilyMember();
                familyMember.setCadet(cadet);
                familyMember.setType(
                        FamilyMemberType.getByInt(familyMembers_type[i] - 1)
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

            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

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
                jsonWriter.name("familyMemberType").value(String.valueOf(FamilyMemberType.getInt(familyMember.getType()) + 1));
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

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException | ParseException e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/saveAndLoadHealth", method = RequestMethod.POST)
    public void saveAndLoadHealth(@RequestParam("id") Long cursantId,
                                             @RequestParam(value = "concussionsWereNot", defaultValue = "false") Boolean concussionsWereNot,
                                             @RequestParam(value = "traumaticBrainInjuryWasNot", defaultValue = "false") Boolean traumaticBrainInjuryWasNot,
                                             @RequestParam(value = "theNarcologWasNot", defaultValue = "false") Boolean theNarcologWasNot,
                                             @RequestParam(value = "thePsychiatristWasNot", defaultValue = "false") Boolean thePsychiatristWasNot,
                                             @RequestParam(value = "alcohol", defaultValue = "0") Integer alcohol,
                                             @RequestParam(value = "drugUse", defaultValue = "0") Integer drugUse,
                                             @RequestParam(value = "chronicDiseases", defaultValue = "") String chronicDiseases,
                                             @RequestParam(value = "validityCategory", defaultValue = "") String validityCategory,
                                             HttpServletResponse response) throws UnsupportedEncodingException {
        try {

            Cadet cadet = cadetRepository.findOne(cursantId);

            cadet.setConcussionsWereNot(concussionsWereNot);
            cadet.setTraumaticBrainInjuryWasNot(traumaticBrainInjuryWasNot);
            cadet.setTheNarcologWasNot(theNarcologWasNot);
            cadet.setThePsychiatristWasNot(thePsychiatristWasNot);
            cadet.setAlcohol(alcohol.toString());
            cadet.setDrugUse(drugUse.toString());

            cadet.setChronicDiseases(chronicDiseases);
            cadet.setValidityCategory(validityCategory);

            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

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

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException  e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/saveAndLoadBehavior", method = RequestMethod.POST)
    public void saveAndLoadBehavior(@RequestParam("id") Long cursantId,
                                             @RequestParam(value = "thoughtsOfSuicideDoesNotHave", defaultValue = "false") Boolean thoughtsOfSuicideDoesNotHave,
                                             @RequestParam(value = "suicideAttemptsDidNotCommit", defaultValue = "false") Boolean suicideAttemptsDidNotCommit,
                                             @RequestParam(value = "administrativeOffenseDidNotCommit", defaultValue = "false") Boolean administrativeOffenseDidNotCommit,
                                             @RequestParam(value = "policeRecordDoesNotHave", defaultValue = "false") Boolean policeRecordDoesNotHave,
                                             @RequestParam(value = "criminalLiabilityWasNotInvolved", defaultValue = "false") Boolean criminalLiabilityWasNotInvolved,
                                             HttpServletResponse response) throws UnsupportedEncodingException {
        try {

            Cadet cadet = cadetRepository.findOne(cursantId);

            cadet.setThoughtsOfSuicideDoesNotHave(thoughtsOfSuicideDoesNotHave);
            cadet.setSuicideAttemptsDidNotCommit(suicideAttemptsDidNotCommit);
            cadet.setAdministrativeOffenseDidNotCommit(administrativeOffenseDidNotCommit);
            cadet.setPoliceRecordDoesNotHave(policeRecordDoesNotHave);
            cadet.setCriminalLiabilityWasNotInvolved(criminalLiabilityWasNotInvolved);

            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

            jsonWriter.name("behavior");
            jsonWriter.beginObject();
            jsonWriter.name("thoughtsOfSuicideDoesNotHave").value(nnl(cadet.getThoughtsOfSuicideDoesNotHave()));
            jsonWriter.name("suicideAttemptsDidNotCommit").value(nnl(cadet.getSuicideAttemptsDidNotCommit()));
            jsonWriter.name("administrativeOffenseDidNotCommit").value(nnl(cadet.getAdministrativeOffenseDidNotCommit()));
            jsonWriter.name("policeRecordDoesNotHave").value(nnl(cadet.getPoliceRecordDoesNotHave()));
            jsonWriter.name("criminalLiabilityWasNotInvolved").value(nnl(cadet.getCriminalLiabilityWasNotInvolved()));
            jsonWriter.endObject();

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException  e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping(value = "/saveAndLoadTripsAbroad", method = RequestMethod.POST)
    public void saveAndLoadTripsAbroad(@RequestParam("id") Long cursantId,
                                   @RequestParam(value = "tripsAbroads_who[]", defaultValue = "") String[] tripsAbroads_who,
                                   @RequestParam(value = "tripsAbroads_firstName[]", defaultValue = "") String[] tripsAbroads_firstName,
                                   @RequestParam(value = "tripsAbroads_lastName[]", defaultValue = "") String[] tripsAbroads_lastName,
                                   @RequestParam(value = "tripsAbroads_patronymic[]", defaultValue = "") String[] tripsAbroads_patronymic,
                                   @RequestParam(value = "tripsAbroads_country[]", defaultValue = "") String[] tripsAbroads_country,
                                   @RequestParam(value = "tripsAbroads_doMaintainARelationship[]", defaultValue = "") String[] tripsAbroads_doMaintainARelationship,
                                   HttpServletResponse response) throws UnsupportedEncodingException {
        try {

            Cadet cadet = cadetRepository.findOne(cursantId);


            cadet.setTripsAbroads(new ArrayList<>());
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

            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

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

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException  e) {
            throw new RuntimeException(e);
        }
    }



    @RequestMapping(value = "/saveAndLoadAdditionally", method = RequestMethod.POST)
    public void saveAndLoadAdditionally(@RequestParam("id") Long cursantId,
                                        @RequestParam(value = "scars", defaultValue = "") String scars,
                                        @RequestParam(value = "tattoo", defaultValue = "") String tattoo,
                                        @RequestParam(value = "abroad", defaultValue = "") String abroad,
                                        HttpServletResponse response) throws UnsupportedEncodingException {
        try {
            Cadet cadet = cadetRepository.findOne(cursantId);

            cadet.setScars(scars);
            cadet.setTattoo(tattoo);
            cadet.setAbroad(abroad);

            cadetRepository.saveAndFlush(cadet);
            cadet = cadetRepository.findOne(cursantId);

            JsonWriter jsonWriter = getJsonWriter(response);
            jsonWriter.beginObject();
            jsonWriter.name("id").value(cadet.getId());

            jsonWriter.name("additionally");
            jsonWriter.beginObject();
            jsonWriter.name("scars").value(nnl(cadet.getScars()));
            jsonWriter.name("tattoo").value(nnl(cadet.getTattoo()));
            jsonWriter.name("abroad").value(nnl(cadet.getAbroad()));
            jsonWriter.endObject();

            jsonWriter.name("success").value(0);
            jsonWriter.endObject();
            closeJsonWriter(response, jsonWriter);
        } catch (IOException  e) {
            throw new RuntimeException(e);
        }
    }


}
