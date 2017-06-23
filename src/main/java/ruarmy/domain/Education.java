package ruarmy.domain;

import javax.persistence.*;

/**
 * Created by skyplane on 14.06.17.
 */
@Entity(name = "education")
public class Education {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String institutionType;

    @Basic
    String institutionName;

    @Basic
    String specialty;

    @Basic
    String yearOfEnding;

    @Basic
    Boolean unfinished;

    @Basic
    Boolean highAchiever;

    @Basic
    Boolean redDiploma;

    @ManyToOne
    private Cadet cadet;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInstitutionType() {
        return institutionType;
    }

    public void setInstitutionType(String institutionType) {
        this.institutionType = institutionType;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getYearOfEnding() {
        return yearOfEnding;
    }

    public void setYearOfEnding(String yearOfEnding) {
        this.yearOfEnding = yearOfEnding;
    }

    public Boolean getUnfinished() {
        return unfinished;
    }

    public void setUnfinished(Boolean unfinished) {
        this.unfinished = unfinished;
    }

    public Boolean getHighAchiever() {
        return highAchiever;
    }

    public void setHighAchiever(Boolean highAchiever) {
        this.highAchiever = highAchiever;
    }

    public Boolean getRedDiploma() {
        return redDiploma;
    }

    public void setRedDiploma(Boolean redDiploma) {
        this.redDiploma = redDiploma;
    }

    public Cadet getCadet() {
        return cadet;
    }

    public void setCadet(Cadet cadet) {
        this.cadet = cadet;
    }
}
