package ruarmy.enums;

/**
 * Created by skyplane on 08.05.17.
 */
public enum FamilyMemberType {

    MOTHER("FamilyMemberType.MOTHER"),
    FATHER("FamilyMemberType.FATHER"),
    STEPMOTHER("FamilyMemberType.STEPMOTHER"),
    STEPFATHER("FamilyMemberType.STEPFATHER"),
    GUARDIAN("FamilyMemberType.GUARDIAN"),
    BROTHER("FamilyMemberType.BROTHER"),
    SISTER("FamilyMemberType.SISTER"),
    WIFE("FamilyMemberType.WIFE"),
    SON("FamilyMemberType.SON"),
    DAUGHTER("FamilyMemberType.DAUGHTER");


    private String resourceKey;

    FamilyMemberType(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(FamilyMemberType role){
        for (int i=0; i<FamilyMemberType.values().length;i++){
            if (role==FamilyMemberType.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static FamilyMemberType getByInt(int i){
        return FamilyMemberType.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }
}
