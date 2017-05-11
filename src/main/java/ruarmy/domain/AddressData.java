package ruarmy.domain;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by skyplane on 08.05.17.
 */
@Entity(name = "addressData")
public class AddressData implements Serializable {

    @GenericGenerator(name = "generator", strategy = "foreign",
            parameters = @Parameter(name = "property", value = "cadet"))
    @Id
    @GeneratedValue(generator = "generator")
    @Column(unique = true, nullable = false)
    private Long id;

    @OneToOne
    @PrimaryKeyJoinColumn
    private Cadet cadet;

    public AddressData(Cadet cadet) {
        this.cadet = cadet;
    }

    @Basic
    String cityOfPlaceOfBirthType;

    @Basic
    String cityOfRegisteredAddressType;

    @Basic
    String cityOfActualAddressType;

    @Basic
    String streetOfRegisteredAddressType;

    @Basic
    String streetOfActualAddressType;

    @Basic
    String subjectOfPlaceOfBirth;

    @Basic
    String cityOfPlaceOfBirth;


    @Basic
    String subjectOfRegisteredAddress;

    @Basic
    String cityOfRegisteredAddress;

    @Basic
    String streetOfRegisteredAddress;

    @Basic
    String houseOfRegisteredAddress;

    @Basic
    String buildingOfRegisteredAddress;

    @Basic
    String apartmentOfRegisteredAddress;

    @Basic
    String indexOfRegisteredAddress;


    @Basic
    String subjectOfActualAddress;

    @Basic
    String cityOfActualAddress;

    @Basic
    String streetOfActualAddress;

    @Basic
    String houseOfActualAddress;

    @Basic
    String buildingOfActualAddress;

    @Basic
    String apartmentOfActualAddress;

    @Basic
    String indexOfActualAddress;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Cadet getCadet() {
        return cadet;
    }

    public void setCadet(Cadet cadet) {
        this.cadet = cadet;
    }

    public String getSubjectOfPlaceOfBirth() {
        return subjectOfPlaceOfBirth;
    }

    public void setSubjectOfPlaceOfBirth(String subjectOfPlaceOfBirth) {
        this.subjectOfPlaceOfBirth = subjectOfPlaceOfBirth;
    }

    public String getCityOfPlaceOfBirth() {
        return cityOfPlaceOfBirth;
    }

    public void setCityOfPlaceOfBirth(String cityOfPlaceOfBirth) {
        this.cityOfPlaceOfBirth = cityOfPlaceOfBirth;
    }

    public String getSubjectOfRegisteredAddress() {
        return subjectOfRegisteredAddress;
    }

    public void setSubjectOfRegisteredAddress(String subjectOfRegisteredAddress) {
        this.subjectOfRegisteredAddress = subjectOfRegisteredAddress;
    }

    public String getCityOfRegisteredAddress() {
        return cityOfRegisteredAddress;
    }

    public void setCityOfRegisteredAddress(String cityOfRegisteredAddress) {
        this.cityOfRegisteredAddress = cityOfRegisteredAddress;
    }

    public String getStreetOfRegisteredAddress() {
        return streetOfRegisteredAddress;
    }

    public void setStreetOfRegisteredAddress(String streetOfRegisteredAddress) {
        this.streetOfRegisteredAddress = streetOfRegisteredAddress;
    }

    public String getHouseOfRegisteredAddress() {
        return houseOfRegisteredAddress;
    }

    public void setHouseOfRegisteredAddress(String houseOfRegisteredAddress) {
        this.houseOfRegisteredAddress = houseOfRegisteredAddress;
    }

    public String getBuildingOfRegisteredAddress() {
        return buildingOfRegisteredAddress;
    }

    public void setBuildingOfRegisteredAddress(String buildingOfRegisteredAddress) {
        this.buildingOfRegisteredAddress = buildingOfRegisteredAddress;
    }

    public String getApartmentOfRegisteredAddress() {
        return apartmentOfRegisteredAddress;
    }

    public void setApartmentOfRegisteredAddress(String apartmentOfRegisteredAddress) {
        this.apartmentOfRegisteredAddress = apartmentOfRegisteredAddress;
    }

    public String getIndexOfRegisteredAddress() {
        return indexOfRegisteredAddress;
    }

    public void setIndexOfRegisteredAddress(String indexOfRegisteredAddress) {
        this.indexOfRegisteredAddress = indexOfRegisteredAddress;
    }

    public String getSubjectOfActualAddress() {
        return subjectOfActualAddress;
    }

    public void setSubjectOfActualAddress(String subjectOfActualAddress) {
        this.subjectOfActualAddress = subjectOfActualAddress;
    }

    public String getCityOfActualAddress() {
        return cityOfActualAddress;
    }

    public void setCityOfActualAddress(String cityOfActualAddress) {
        this.cityOfActualAddress = cityOfActualAddress;
    }

    public String getStreetOfActualAddress() {
        return streetOfActualAddress;
    }

    public void setStreetOfActualAddress(String streetOfActualAddress) {
        this.streetOfActualAddress = streetOfActualAddress;
    }

    public String getHouseOfActualAddress() {
        return houseOfActualAddress;
    }

    public void setHouseOfActualAddress(String houseOfActualAddress) {
        this.houseOfActualAddress = houseOfActualAddress;
    }

    public String getBuildingOfActualAddress() {
        return buildingOfActualAddress;
    }

    public void setBuildingOfActualAddress(String buildingOfActualAddress) {
        this.buildingOfActualAddress = buildingOfActualAddress;
    }

    public String getApartmentOfActualAddress() {
        return apartmentOfActualAddress;
    }

    public void setApartmentOfActualAddress(String apartmentOfActualAddress) {
        this.apartmentOfActualAddress = apartmentOfActualAddress;
    }

    public String getIndexOfActualAddress() {
        return indexOfActualAddress;
    }

    public void setIndexOfActualAddress(String indexOfActualAddress) {
        this.indexOfActualAddress = indexOfActualAddress;
    }

    public String getCityOfPlaceOfBirthType() {
        return cityOfPlaceOfBirthType;
    }

    public void setCityOfPlaceOfBirthType(String cityOfPlaceOfBirthType) {
        this.cityOfPlaceOfBirthType = cityOfPlaceOfBirthType;
    }

    public String getCityOfRegisteredAddressType() {
        return cityOfRegisteredAddressType;
    }

    public void setCityOfRegisteredAddressType(String cityOfRegisteredAddressType) {
        this.cityOfRegisteredAddressType = cityOfRegisteredAddressType;
    }

    public String getCityOfActualAddressType() {
        return cityOfActualAddressType;
    }

    public void setCityOfActualAddressType(String cityOfActualAddressType) {
        this.cityOfActualAddressType = cityOfActualAddressType;
    }

    public String getStreetOfRegisteredAddressType() {
        return streetOfRegisteredAddressType;
    }

    public void setStreetOfRegisteredAddressType(String streetOfRegisteredAddressType) {
        this.streetOfRegisteredAddressType = streetOfRegisteredAddressType;
    }

    public String getStreetOfActualAddressType() {
        return streetOfActualAddressType;
    }

    public void setStreetOfActualAddressType(String streetOfActualAddressType) {
        this.streetOfActualAddressType = streetOfActualAddressType;
    }
}
