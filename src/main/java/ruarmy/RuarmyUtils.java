package ruarmy;

import java.text.SimpleDateFormat;

/**
 * Created by skyplane on 06.05.17.
 */
public class RuarmyUtils {

    public static String nnl(String str) {
        return str == null ? "" : str;
    }


    public final static SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");

}
