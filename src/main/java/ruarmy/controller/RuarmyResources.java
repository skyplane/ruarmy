package ruarmy.controller;

import java.util.ListResourceBundle;

/**
 * Created by skyplane on 06.05.17.
 */
public class RuarmyResources extends ListResourceBundle {
    public Object[][] getContents() {
        return new Object[][]{
                {"UserRole.ROLE_ADMIN", "Администратор"}, {"UserRole.ROLE_OFFICER", "Офицер"},{"UserRole.ROLE_CADET", "Курсант"},
                {"HelpKey", "Help"}, {"YesKey", "Yes"}, {"NoKey", "No"},};
    }
}
