package ruarmy.enums;

/**
 * Created by skyplane on 19.09.17.
 */
public enum Religion  {

    WHITE("Religion.WHITE"),
    ORTHODOX("Religion.ORTHODOX"),
    MUSLIM("Religion.MUSLIM"),
    JEW("Religion.JEW"),
    ATHEIST("Religion.ATHEIST"),
    CATHOLIC("Religion.CATHOLIC"),
    BUDDIST("Religion.BUDDIST");

    private String resourceKey;

    Religion(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(Religion role){
        for (int i=0; i<Religion.values().length;i++){
            if (role==Religion.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static Religion getByInt(int i){
        return Religion.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }
}
