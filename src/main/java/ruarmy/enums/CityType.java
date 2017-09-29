package ruarmy.enums;

/**
 * Created by skyplane on 21.09.17.
 */
public enum CityType  {

    CITY("CityType.CITY"),
    PGT("CityType.PGT"),
    POSELOK("CityType.POSELOK"),
    SELO("CityType.SELO"),
    DEREVNYA("CityType.DEREVNYA"),
    STANICA("CityType.STANICA"),
    HUTOR("CityType.HUTOR");

    private String resourceKey;

    CityType(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(CityType role){
        for (int i=0; i<CityType.values().length;i++){
            if (role==CityType.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static CityType getByInt(int i){
        return CityType.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }
}