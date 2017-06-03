package ruarmy.domain;

import ruarmy.enums.AccessLevel;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by skyplane on 08.05.17.
 */
@Entity(name = "profile")
public class Profile {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String profileName;


    @Enumerated(EnumType.STRING)
    AccessLevel faculty;
    @Enumerated(EnumType.STRING)
    AccessLevel specialty;
    @Enumerated(EnumType.STRING)
    AccessLevel yearOfAdmission;
    @Enumerated(EnumType.STRING)
    AccessLevel militaryRank;
    @Enumerated(EnumType.STRING)
    AccessLevel surname;
    @Enumerated(EnumType.STRING)
    AccessLevel name;
    @Enumerated(EnumType.STRING)
    AccessLevel patronymic;
    @Enumerated(EnumType.STRING)
    AccessLevel dateOfBirth;
    @Enumerated(EnumType.STRING)
    AccessLevel passportNumber;
    @Enumerated(EnumType.STRING)
    AccessLevel militaryIdNumber;
    @Enumerated(EnumType.STRING)
    AccessLevel nationality;
    @Enumerated(EnumType.STRING)
    AccessLevel religion;
    @Enumerated(EnumType.STRING)
    AccessLevel phone;
    @Enumerated(EnumType.STRING)
    AccessLevel unit;
    @Enumerated(EnumType.STRING)
    AccessLevel post;
    @Enumerated(EnumType.STRING)
    AccessLevel education;
    @Enumerated(EnumType.STRING)
    AccessLevel skills;
    @Enumerated(EnumType.STRING)
    AccessLevel drivingLicense;
    @Enumerated(EnumType.STRING)
    AccessLevel compositionOfFamily;
    @Enumerated(EnumType.STRING)
    AccessLevel concussionsWereNot;
    @Enumerated(EnumType.STRING)
    AccessLevel traumaticBrainInjuryWasNot;
    @Enumerated(EnumType.STRING)
    AccessLevel theNarcologWasNot;
    @Enumerated(EnumType.STRING)
    AccessLevel thePsychiatristWasNot;
    @Enumerated(EnumType.STRING)
    AccessLevel alcohol;
    @Enumerated(EnumType.STRING)
    AccessLevel drugUse;
    @Enumerated(EnumType.STRING)
    AccessLevel chronicDiseases;
    @Enumerated(EnumType.STRING)
    AccessLevel validityCategory;
    @Enumerated(EnumType.STRING)
    AccessLevel thoughtsOfSuicideDoesNotHave;
    @Enumerated(EnumType.STRING)
    AccessLevel suicideAttemptsDidNotCommit;
    @Enumerated(EnumType.STRING)
    AccessLevel administrativeOffenseDidNotCommit;
    @Enumerated(EnumType.STRING)
    AccessLevel policeRecordDoesNotHave;
    @Enumerated(EnumType.STRING)
    AccessLevel criminalLiabilityWasNotInvolved;
    @Enumerated(EnumType.STRING)
    AccessLevel scars;
    @Enumerated(EnumType.STRING)
    AccessLevel tattoo;
    @Enumerated(EnumType.STRING)
    AccessLevel abroad;
    @Enumerated(EnumType.STRING)
    AccessLevel relativesAndFriendsAbroad;
    @Enumerated(EnumType.STRING)
    AccessLevel addressData;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProfileName() {
        return profileName;
    }

    public void setProfileName(String profileName) {
        this.profileName = profileName;
    }

    public AccessLevel getFaculty() {
        return faculty;
    }

    public void setFaculty(AccessLevel faculty) {
        this.faculty = faculty;
    }

    public AccessLevel getSpecialty() {
        return specialty;
    }

    public void setSpecialty(AccessLevel specialty) {
        this.specialty = specialty;
    }

    public AccessLevel getYearOfAdmission() {
        return yearOfAdmission;
    }

    public void setYearOfAdmission(AccessLevel yearOfAdmission) {
        this.yearOfAdmission = yearOfAdmission;
    }

    public AccessLevel getMilitaryRank() {
        return militaryRank;
    }

    public void setMilitaryRank(AccessLevel militaryRank) {
        this.militaryRank = militaryRank;
    }

    public AccessLevel getSurname() {
        return surname;
    }

    public void setSurname(AccessLevel surname) {
        this.surname = surname;
    }

    public AccessLevel getName() {
        return name;
    }

    public void setName(AccessLevel name) {
        this.name = name;
    }

    public AccessLevel getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(AccessLevel patronymic) {
        this.patronymic = patronymic;
    }

    public AccessLevel getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(AccessLevel dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public AccessLevel getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(AccessLevel passportNumber) {
        this.passportNumber = passportNumber;
    }

    public AccessLevel getMilitaryIdNumber() {
        return militaryIdNumber;
    }

    public void setMilitaryIdNumber(AccessLevel militaryIdNumber) {
        this.militaryIdNumber = militaryIdNumber;
    }

    public AccessLevel getNationality() {
        return nationality;
    }

    public void setNationality(AccessLevel nationality) {
        this.nationality = nationality;
    }

    public AccessLevel getReligion() {
        return religion;
    }

    public void setReligion(AccessLevel religion) {
        this.religion = religion;
    }

    public AccessLevel getPhone() {
        return phone;
    }

    public void setPhone(AccessLevel phone) {
        this.phone = phone;
    }

    public AccessLevel getUnit() {
        return unit;
    }

    public void setUnit(AccessLevel unit) {
        this.unit = unit;
    }

    public AccessLevel getPost() {
        return post;
    }

    public void setPost(AccessLevel post) {
        this.post = post;
    }

    public AccessLevel getEducation() {
        return education;
    }

    public void setEducation(AccessLevel education) {
        this.education = education;
    }

    public AccessLevel getSkills() {
        return skills;
    }

    public void setSkills(AccessLevel skills) {
        this.skills = skills;
    }

    public AccessLevel getDrivingLicense() {
        return drivingLicense;
    }

    public void setDrivingLicense(AccessLevel drivingLicense) {
        this.drivingLicense = drivingLicense;
    }

    public AccessLevel getCompositionOfFamily() {
        return compositionOfFamily;
    }

    public void setCompositionOfFamily(AccessLevel compositionOfFamily) {
        this.compositionOfFamily = compositionOfFamily;
    }


    public AccessLevel getConcussionsWereNot() {
        return concussionsWereNot;
    }

    public void setConcussionsWereNot(AccessLevel concussionsWereNot) {
        this.concussionsWereNot = concussionsWereNot;
    }

    public AccessLevel getTraumaticBrainInjuryWasNot() {
        return traumaticBrainInjuryWasNot;
    }

    public void setTraumaticBrainInjuryWasNot(AccessLevel traumaticBrainInjuryWasNot) {
        this.traumaticBrainInjuryWasNot = traumaticBrainInjuryWasNot;
    }

    public AccessLevel getTheNarcologWasNot() {
        return theNarcologWasNot;
    }

    public void setTheNarcologWasNot(AccessLevel theNarcologWasNot) {
        this.theNarcologWasNot = theNarcologWasNot;
    }

    public AccessLevel getThePsychiatristWasNot() {
        return thePsychiatristWasNot;
    }

    public void setThePsychiatristWasNot(AccessLevel thePsychiatristWasNot) {
        this.thePsychiatristWasNot = thePsychiatristWasNot;
    }

    public AccessLevel getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(AccessLevel alcohol) {
        this.alcohol = alcohol;
    }

    public AccessLevel getDrugUse() {
        return drugUse;
    }

    public void setDrugUse(AccessLevel drugUse) {
        this.drugUse = drugUse;
    }

    public AccessLevel getChronicDiseases() {
        return chronicDiseases;
    }

    public void setChronicDiseases(AccessLevel chronicDiseases) {
        this.chronicDiseases = chronicDiseases;
    }

    public AccessLevel getValidityCategory() {
        return validityCategory;
    }

    public void setValidityCategory(AccessLevel validityCategory) {
        this.validityCategory = validityCategory;
    }

    public AccessLevel getThoughtsOfSuicideDoesNotHave() {
        return thoughtsOfSuicideDoesNotHave;
    }

    public void setThoughtsOfSuicideDoesNotHave(AccessLevel thoughtsOfSuicideDoesNotHave) {
        this.thoughtsOfSuicideDoesNotHave = thoughtsOfSuicideDoesNotHave;
    }

    public AccessLevel getSuicideAttemptsDidNotCommit() {
        return suicideAttemptsDidNotCommit;
    }

    public void setSuicideAttemptsDidNotCommit(AccessLevel suicideAttemptsDidNotCommit) {
        this.suicideAttemptsDidNotCommit = suicideAttemptsDidNotCommit;
    }

    public AccessLevel getAdministrativeOffenseDidNotCommit() {
        return administrativeOffenseDidNotCommit;
    }

    public void setAdministrativeOffenseDidNotCommit(AccessLevel administrativeOffenseDidNotCommit) {
        this.administrativeOffenseDidNotCommit = administrativeOffenseDidNotCommit;
    }

    public AccessLevel getPoliceRecordDoesNotHave() {
        return policeRecordDoesNotHave;
    }

    public void setPoliceRecordDoesNotHave(AccessLevel policeRecordDoesNotHave) {
        this.policeRecordDoesNotHave = policeRecordDoesNotHave;
    }

    public AccessLevel getCriminalLiabilityWasNotInvolved() {
        return criminalLiabilityWasNotInvolved;
    }

    public void setCriminalLiabilityWasNotInvolved(AccessLevel criminalLiabilityWasNotInvolved) {
        this.criminalLiabilityWasNotInvolved = criminalLiabilityWasNotInvolved;
    }

    public AccessLevel getScars() {
        return scars;
    }

    public void setScars(AccessLevel scars) {
        this.scars = scars;
    }

    public AccessLevel getTattoo() {
        return tattoo;
    }

    public void setTattoo(AccessLevel tattoo) {
        this.tattoo = tattoo;
    }

    public AccessLevel getAbroad() {
        return abroad;
    }

    public void setAbroad(AccessLevel abroad) {
        this.abroad = abroad;
    }

    public AccessLevel getRelativesAndFriendsAbroad() {
        return relativesAndFriendsAbroad;
    }

    public void setRelativesAndFriendsAbroad(AccessLevel relativesAndFriendsAbroad) {
        this.relativesAndFriendsAbroad = relativesAndFriendsAbroad;
    }

    public AccessLevel getAddressData() {
        return addressData;
    }

    public void setAddressData(AccessLevel addressData) {
        this.addressData = addressData;
    }
}
