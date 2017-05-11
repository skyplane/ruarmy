package ruarmy.domain;

import ruarmy.enums.UserRole;

import javax.persistence.*;

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

    @Enumerated(EnumType.STRING)
    private UserRole role = UserRole.ROLE_CADET;



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


}
