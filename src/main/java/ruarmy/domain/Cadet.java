package ruarmy.domain;

import javax.persistence.*;

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
    String yearOfAdmission;

    @Basic
    String militaryRank;
    @Basic
    String surname;
    @Basic
    String name;
    @Basic
    String patronymic;
    @Basic
    String dateOfBirth;
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


    @Basic
    Boolean concussionsWereNot;
    @Basic
    Boolean traumaticBrainInjuryWasNot;
    @Basic
    Boolean theNarcologWasNot;
    @Basic
    Boolean faculThePsychiatristWasNotty;
    @Basic
    String alcohol;
    @Basic
    String drugUse;
    @Basic
    String chronicDiseases;
    @Basic
    String categoryDate;
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
    String relativesAndFriendsAbroad;



    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "cadet")
    private AddressData addressData;




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

}
