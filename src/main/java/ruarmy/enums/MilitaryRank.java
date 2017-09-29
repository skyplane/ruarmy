package ruarmy.enums;

/**
 * Created by skyplane on 19.09.17.
 */
public enum MilitaryRank {

    RYADOVOY("MilitaryRank.RYADOVOY"),
    YEFREYTOR("MilitaryRank.YEFREYTOR"),
    MLADSHIY_SERZHANT("MilitaryRank.MLADSHIY_SERZHANT"),
    SERZHANT("MilitaryRank.SERZHANT"),
    STARSHIY_SERZHANT("MilitaryRank.STARSHIY_SERZHANT");

    private String resourceKey;

    MilitaryRank(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(MilitaryRank role){
        for (int i=0; i<MilitaryRank.values().length;i++){
            if (role==MilitaryRank.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static MilitaryRank getByInt(int i){
        return MilitaryRank.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }
}
