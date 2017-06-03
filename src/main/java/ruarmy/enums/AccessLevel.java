package ruarmy.enums;

import java.util.Arrays;

/**
 * Created by skyplane on 08.05.17.
 */
public enum AccessLevel {

    DENIED("AccessLevel.DENIED"),
    READ("AccessLevel.READ"),
    WRITE("AccessLevel.WRITE");

    private String resourceKey;

    AccessLevel(String resourceKey) {
        this.resourceKey = resourceKey;
    }

    public static int getInt(AccessLevel role) {
        for (int i = 0; i < AccessLevel.values().length; i++) {
            if (role == AccessLevel.values()[i]) {
                return i;
            }
        }
        return 0;
    }

    public static AccessLevel fromValue(String value) {
        for (AccessLevel accessLevel : values()) {
            if (accessLevel.getResourceKey().replace("AccessLevel.","").equalsIgnoreCase(value)) {
                return accessLevel;
            }
        }
        throw new IllegalArgumentException("Unknown enum type " + value + ", Allowed values are " + Arrays.toString(values()));
    }


    public static AccessLevel getByInt(int i) {
        return AccessLevel.values()[i];
    }

    public String getResourceKey() {
        return this.resourceKey;
    }


    public String getValue() {
        return this.resourceKey.replace("AccessLevel.","");
    }


}
