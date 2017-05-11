package ruarmy.enums;

/**
 * Created by skyplane on 09.05.17.
 */
public enum SubjectType {

    OBLAST("SubjectType.OBLAST"),
    KRAI("SubjectType.KRAI"),
    RESPUBLICA("SubjectType.RESPUBLICA"),
    AUTONUMOUS_OKRUG("SubjectType.AUTONUMOUS_OKRUG");

    private String resourceKey;

    SubjectType(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(SubjectType role){
        for (int i=0; i<SubjectType.values().length;i++){
            if (role==SubjectType.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static SubjectType getByInt(int i){
        return SubjectType.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }
}