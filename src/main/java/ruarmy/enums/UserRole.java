package ruarmy.enums;

/**
 * Created by skyplane on 04.05.17.
 */
public enum UserRole {

    ROLE_ADMIN("UserRole.ROLE_ADMIN"),
    ROLE_OFFICER("UserRole.ROLE_OFFICER"),
    ROLE_CADET("UserRole.ROLE_CADET");

    private String resourceKey;

    UserRole(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(UserRole role){
        for (int i=0; i<UserRole.values().length;i++){
            if (role==UserRole.values()[i]){
                return i;
            }
        }
        return 0;
    }

    public static UserRole getByInt(int i){
        return UserRole.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }

}
