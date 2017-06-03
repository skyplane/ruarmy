package ruarmy.domain;

import javax.persistence.*;

/**
 * Created by skyplane on 13.05.17.
 */
@Entity(name = "division")
public class Division {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String name;



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
}
