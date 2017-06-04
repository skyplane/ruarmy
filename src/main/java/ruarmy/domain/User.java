package ruarmy.domain;

import org.springframework.data.annotation.Persistent;
import ruarmy.enums.UserRole;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by skyplane on 05.05.17.
 */
@Entity(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private String login;

    @Basic
    private String password;

    @ManyToOne
    private Profile profile;

    @Enumerated(EnumType.STRING)
    private UserRole role = UserRole.ROLE_CADET;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    Set<Division> divisions = new HashSet<Division>();


    public Set<Division> getDivisions() {
        return divisions;
    }

    public void setDivisions(Set<Division> divisions) {
        this.divisions = divisions;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }
}
