package ruarmy.enums;

/**
 * Created by skyplane on 21.09.17.
 */
public enum StreetType  {

    ULICA("StreetType.ULICA"),
    PEREULOK("StreetType.PEREULOK"),
    PROSPECT("StreetType.PROSPECT"),
    MIKRORAYON("StreetType.MIKRORAYON"),
    SHOSSE("StreetType.SHOSSE"),
    PLOSHAD("StreetType.PLOSHAD"),
    BULVAR("StreetType.BULVAR"),
    PROEZD("StreetType.PROEZD"),
    VCH("StreetType.VCH");

    private String resourceKey;

    StreetType(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(StreetType role){
        for (int i=0; i<StreetType.values().length;i++){
            if (role==StreetType.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static StreetType getByInt(int i){
        return StreetType.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }
}