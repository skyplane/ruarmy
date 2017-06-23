package ruarmy.domain;

import javax.persistence.*;

/**
 * Created by skyplane on 14.06.17.
 */
@Entity(name = "foreignLanguage")
public class ForeignLanguage {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String language;

    @Basic
    String level;

    @ManyToOne
    private Cadet cadet;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }


    public Cadet getCadet() {
        return cadet;
    }

    public void setCadet(Cadet cadet) {
        this.cadet = cadet;
    }
}
