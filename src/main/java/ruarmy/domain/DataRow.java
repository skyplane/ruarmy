package ruarmy.domain;

import javax.persistence.*;

@Entity(name = "catalog")
public class DataRow {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private String textField;

    @Basic
    private String selectField;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public String getSelectField() {
		return selectField;
	}

	public void setSelectField(String selectField) {
		this.selectField = selectField;
	}
}
