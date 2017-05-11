package ruarmy.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by skyplane on 02.05.17.
 */

@Entity(name = "cadet")
public class Cadet {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String faculty;

    @Basic
    String specialty;

    @Basic
    Integer yearOfAdmission;

    @Basic
    String militaryRank;
    @Basic
    String surname;
    @Basic
    String name;
    @Basic
    String patronymic;
    @Basic
    Date dateOfBirth;
    @Basic
    String passportNumber;
    @Basic
    String militaryIdNumber;
    @Basic
    String nationality;
    @Basic
    String religion;
    @Basic
    String phone;
    @Basic
    String unit;
    @Basic
    String post;

    @Basic
    String education;
    @Basic
    String skills;
    @Basic
    String drivingLicense;
    @Basic
    String compositionOfFamily;


    @Basic
    String father;
    @Basic
    String mother;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cadet")
    @OrderBy("id")
    List<FamilyMember> familyMembers = new ArrayList<>();

    public List<FamilyMember> getFamilyMembers() {
        return familyMembers;
    }

    public void setFamilyMembers(List<FamilyMember> familyMembers) {
        this.familyMembers = familyMembers;
    }

    @Basic
    Boolean concussionsWereNot;
    @Basic
    Boolean traumaticBrainInjuryWasNot;
    @Basic
    Boolean theNarcologWasNot;
    @Basic
    Boolean thePsychiatristWasNot;
    @Basic
    String alcohol;
    @Basic
    String drugUse;
    @Basic
    String chronicDiseases;
    @Basic
    String validityCategory;
    @Basic
    Boolean thoughtsOfSuicideDoesNotHave;
    @Basic
    Boolean suicideAttemptsDidNotCommit;
    @Basic
    Boolean administrativeOffenseDidNotCommit;
    @Basic
    Boolean policeRecordDoesNotHave;
    @Basic
    Boolean criminalLiabilityWasNotInvolved;
    @Basic
    String scars;
    @Basic
    String tattoo;
    @Basic
    String abroad;
    @Basic
    Boolean relativesAndFriendsAbroad;


    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "cadet")
    private AddressData addressData = new AddressData(this);


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public AddressData getAddressData() {
        return addressData;
    }

    public void setAddressData(AddressData addressData) {
        this.addressData = addressData;
        addressData.setCadet(this);
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getMilitaryRank() {
        return militaryRank;
    }

    public void setMilitaryRank(String militaryRank) {
        this.militaryRank = militaryRank;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }


    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public String getMilitaryIdNumber() {
        return militaryIdNumber;
    }

    public void setMilitaryIdNumber(String militaryIdNumber) {
        this.militaryIdNumber = militaryIdNumber;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getDrivingLicense() {
        return drivingLicense;
    }

    public void setDrivingLicense(String drivingLicense) {
        this.drivingLicense = drivingLicense;
    }

    public String getCompositionOfFamily() {
        return compositionOfFamily;
    }

    public void setCompositionOfFamily(String compositionOfFamily) {
        this.compositionOfFamily = compositionOfFamily;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }

    public String getMother() {
        return mother;
    }

    public void setMother(String mother) {
        this.mother = mother;
    }


    public Boolean getConcussionsWereNot() {
        return concussionsWereNot;
    }

    public void setConcussionsWereNot(Boolean concussionsWereNot) {
        this.concussionsWereNot = concussionsWereNot;
    }

    public Boolean getTraumaticBrainInjuryWasNot() {
        return traumaticBrainInjuryWasNot;
    }

    public void setTraumaticBrainInjuryWasNot(Boolean traumaticBrainInjuryWasNot) {
        this.traumaticBrainInjuryWasNot = traumaticBrainInjuryWasNot;
    }

    public Boolean getTheNarcologWasNot() {
        return theNarcologWasNot;
    }

    public void setTheNarcologWasNot(Boolean theNarcologWasNot) {
        this.theNarcologWasNot = theNarcologWasNot;
    }

    public Boolean getThePsychiatristWasNot() {
        return thePsychiatristWasNot;
    }

    public void setThePsychiatristWasNot(Boolean thePsychiatristWasNot) {
        this.thePsychiatristWasNot = thePsychiatristWasNot;
    }

    public String getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(String alcohol) {
        this.alcohol = alcohol;
    }

    public String getDrugUse() {
        return drugUse;
    }

    public void setDrugUse(String drugUse) {
        this.drugUse = drugUse;
    }

    public String getChronicDiseases() {
        return chronicDiseases;
    }

    public void setChronicDiseases(String chronicDiseases) {
        this.chronicDiseases = chronicDiseases;
    }

    public String getValidityCategory() {
        return validityCategory;
    }

    public void setValidityCategory(String validityCategory) {
        this.validityCategory = validityCategory;
    }

    public Boolean getThoughtsOfSuicideDoesNotHave() {
        return thoughtsOfSuicideDoesNotHave;
    }

    public void setThoughtsOfSuicideDoesNotHave(Boolean thoughtsOfSuicideDoesNotHave) {
        this.thoughtsOfSuicideDoesNotHave = thoughtsOfSuicideDoesNotHave;
    }

    public Boolean getSuicideAttemptsDidNotCommit() {
        return suicideAttemptsDidNotCommit;
    }

    public void setSuicideAttemptsDidNotCommit(Boolean suicideAttemptsDidNotCommit) {
        this.suicideAttemptsDidNotCommit = suicideAttemptsDidNotCommit;
    }

    public Boolean getAdministrativeOffenseDidNotCommit() {
        return administrativeOffenseDidNotCommit;
    }

    public void setAdministrativeOffenseDidNotCommit(Boolean administrativeOffenseDidNotCommit) {
        this.administrativeOffenseDidNotCommit = administrativeOffenseDidNotCommit;
    }

    public Boolean getPoliceRecordDoesNotHave() {
        return policeRecordDoesNotHave;
    }

    public void setPoliceRecordDoesNotHave(Boolean policeRecordDoesNotHave) {
        this.policeRecordDoesNotHave = policeRecordDoesNotHave;
    }

    public Boolean getCriminalLiabilityWasNotInvolved() {
        return criminalLiabilityWasNotInvolved;
    }

    public void setCriminalLiabilityWasNotInvolved(Boolean criminalLiabilityWasNotInvolved) {
        this.criminalLiabilityWasNotInvolved = criminalLiabilityWasNotInvolved;
    }

    public String getScars() {
        return scars;
    }

    public void setScars(String scars) {
        this.scars = scars;
    }

    public String getTattoo() {
        return tattoo;
    }

    public void setTattoo(String tattoo) {
        this.tattoo = tattoo;
    }

    public String getAbroad() {
        return abroad;
    }

    public void setAbroad(String abroad) {
        this.abroad = abroad;
    }

    public Boolean getRelativesAndFriendsAbroad() {
        return relativesAndFriendsAbroad;
    }

    public void setRelativesAndFriendsAbroad(Boolean relativesAndFriendsAbroad) {
        this.relativesAndFriendsAbroad = relativesAndFriendsAbroad;
    }

    public Integer getYearOfAdmission() {
        return yearOfAdmission;
    }

    public void setYearOfAdmission(Integer yearOfAdmission) {
        this.yearOfAdmission = yearOfAdmission;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
