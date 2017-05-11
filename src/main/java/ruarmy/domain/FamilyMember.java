package ruarmy.domain;

import ruarmy.enums.FamilyMemberType;
import ruarmy.enums.UserRole;

import javax.persistence.*;

/**
 * Created by skyplane on 08.05.17.
 */
@Entity(name = "familyMember")
public class FamilyMember {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    String text;

    @Enumerated(EnumType.STRING)
    private FamilyMemberType type;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public FamilyMemberType getType() {
        return type;
    }

    public void setType(FamilyMemberType type) {
        this.type = type;
    }
}
