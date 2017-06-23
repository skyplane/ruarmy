package ruarmy.domain;

import javax.persistence.*;

/**
 * Created by skyplane on 14.06.17.
 */
@Entity(name = "tripsAbroad")
public class TripsAbroad {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String who;

    @Basic
    String firstName;

    @Basic
    String lastName;

    @Basic
    String patronymic;

    @Basic
    String country;

    @Basic
    Boolean doMaintainARelationship;

    @ManyToOne
    private Cadet cadet;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWho() {
        return who;
    }

    public void setWho(String who) {
        this.who = who;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Boolean getDoMaintainARelationship() {
        return doMaintainARelationship;
    }

    public void setDoMaintainARelationship(Boolean doMaintainARelationship) {
        this.doMaintainARelationship = doMaintainARelationship;
    }

    public Cadet getCadet() {
        return cadet;
    }

    public void setCadet(Cadet cadet) {
        this.cadet = cadet;
    }
}
