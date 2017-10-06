package ruarmy.domain;

import ruarmy.enums.FamilyMemberType;
import ruarmy.enums.UserRole;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by skyplane on 08.05.17.
 */
@Entity(name = "familyMember")
public class FamilyMember {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String lastName;

    @Basic
    String firstName;

    @Basic
    String patronymic;

    @Basic
    Date dateOfBirth;

    @Basic
    String occupation;

    @Basic
    String phone;

    @Basic
    Boolean wasTreatedForAlcoholism;

    @Basic
    Boolean wasTreatedForAddiction;

    @Basic
    Boolean hasACriminalRecord;

    @Basic
    Boolean hasAMentalIllness;

    @Basic
    Boolean hasSuicideAttempts;

    @Basic
    Boolean hasADisability;

    @Basic
    Boolean hasDied;

    @Basic
    Boolean isBroughtUpSeparately;


    @Basic
    String hasDiedCause;

    @Basic
    String hasDiedPlace;

    @Basic
    Integer hasDiedYear;

    @Basic
    String hasAMentalIllnessName;

    @Basic
    String hasACriminalRecordDetails;


    @Enumerated(EnumType.STRING)
    private FamilyMemberType type;

    @ManyToOne
    private Cadet cadet;

    public Cadet getCadet() {
        return cadet;
    }

    public void setCadet(Cadet cadet) {
        this.cadet = cadet;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public FamilyMemberType getType() {
        return type;
    }

    public void setType(FamilyMemberType type) {
        this.type = type;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getWasTreatedForAlcoholism() {
        return wasTreatedForAlcoholism;
    }

    public void setWasTreatedForAlcoholism(Boolean wasTreatedForAlcoholism) {
        this.wasTreatedForAlcoholism = wasTreatedForAlcoholism;
    }

    public Boolean getWasTreatedForAddiction() {
        return wasTreatedForAddiction;
    }

    public void setWasTreatedForAddiction(Boolean wasTreatedForAddiction) {
        this.wasTreatedForAddiction = wasTreatedForAddiction;
    }

    public Boolean getHasACriminalRecord() {
        return hasACriminalRecord;
    }

    public void setHasACriminalRecord(Boolean hasACriminalRecord) {
        this.hasACriminalRecord = hasACriminalRecord;
    }

    public Boolean getHasAMentalIllness() {
        return hasAMentalIllness;
    }

    public void setHasAMentalIllness(Boolean hasAMentalIllness) {
        this.hasAMentalIllness = hasAMentalIllness;
    }

    public Boolean getHasSuicideAttempts() {
        return hasSuicideAttempts;
    }

    public void setHasSuicideAttempts(Boolean hasSuicideAttempts) {
        this.hasSuicideAttempts = hasSuicideAttempts;
    }

    public Boolean getHasADisability() {
        return hasADisability;
    }

    public void setHasADisability(Boolean hasADisability) {
        this.hasADisability = hasADisability;
    }

    public Boolean getHasDied() {
        return hasDied;
    }

    public void setHasDied(Boolean hasDied) {
        this.hasDied = hasDied;
    }

    public Boolean getBroughtUpSeparately() {
        return isBroughtUpSeparately;
    }

    public void setBroughtUpSeparately(Boolean broughtUpSeparately) {
        isBroughtUpSeparately = broughtUpSeparately;
    }

    public String getHasDiedCause() {
        return hasDiedCause;
    }

    public void setHasDiedCause(String hasDiedCause) {
        this.hasDiedCause = hasDiedCause;
    }

    public String getHasDiedPlace() {
        return hasDiedPlace;
    }

    public void setHasDiedPlace(String hasDiedPlace) {
        this.hasDiedPlace = hasDiedPlace;
    }

    public Integer getHasDiedYear() {
        return hasDiedYear;
    }

    public void setHasDiedYear(Integer hasDiedYear) {
        this.hasDiedYear = hasDiedYear;
    }

    public String getHasAMentalIllnessName() {
        return hasAMentalIllnessName;
    }

    public void setHasAMentalIllnessName(String hasAMentalIllnessName) {
        this.hasAMentalIllnessName = hasAMentalIllnessName;
    }

    public String getHasACriminalRecordDetails() {
        return hasACriminalRecordDetails;
    }

    public void setHasACriminalRecordDetails(String hasACriminalRecordDetails) {
        this.hasACriminalRecordDetails = hasACriminalRecordDetails;
    }
}
