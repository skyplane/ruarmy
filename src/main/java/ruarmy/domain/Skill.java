package ruarmy.domain;

import javax.persistence.*;

/**
 * Created by skyplane on 29.05.17.
 */
@Entity(name = "skill")
public class Skill {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private String name;

    @Basic
    private Integer fieldOfActivityCode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getFieldOfActivityCode() {
        return fieldOfActivityCode;
    }

    public void setFieldOfActivityCode(Integer fieldOfActivityCode) {
        this.fieldOfActivityCode = fieldOfActivityCode;
    }
}
