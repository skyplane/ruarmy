package ruarmy.controller;

import java.util.ListResourceBundle;

/**
 * Created by skyplane on 06.05.17.
 */
public class RuarmyResources extends ListResourceBundle {
    public Object[][] getContents() {
        return new Object[][]{
                {"UserRole.ROLE_ADMIN", "Администратор"}, {"UserRole.ROLE_OFFICER", "Офицер"},{"UserRole.ROLE_CADET", "Курсант"},
                {"HelpKey", "Help"}, {"YesKey", "Yes"}, {"NoKey", "No"},


                {"MilitaryRank.RYADOVOY", "рядовой"},
                {"MilitaryRank.YEFREYTOR", "ефрейтор"},
                {"MilitaryRank.MLADSHIY_SERZHANT", "мл. сержант"},
                {"MilitaryRank.SERZHANT", "сержант"},
                {"MilitaryRank.STARSHIY_SERZHANT", "ст. сержант"},

                {"Religion.ORTHODOX", "православный"},
                {"Religion.MUSLIM", "мусульманин"},
                {"Religion.JEW", "иудей"},
                {"Religion.ATHEIST", "атеист"},
                {"Religion.CATHOLIC", "католик"},
                {"Religion.BUDDIST", "буддист"},


                {"SubjectType.OBLAST", "об. "},
                {"SubjectType.KRAI", "кр. "},
                {"SubjectType.RESPUBLICA", "респ. "},
                {"SubjectType.AUTONUMOUS_OKRUG", "авт. окр. "},


                {"CityType.CITY", "г. "},
                {"CityType.PGT", "пгт "},
                {"CityType.POSELOK", "пос. "},
                {"CityType.SELO", "село "},
                {"CityType.DEREVNYA", "дер. "},
                {"CityType.STANICA", "станица "},
                {"CityType.HUTOR", "хутор "},

                {"StreetType.ULICA", "ул. "},
                {"StreetType.PEREULOK", "пер. "},
                {"StreetType.PROSPECT", "просп. "},
                {"StreetType.MIKRORAYON", "мкрн "},
                {"StreetType.SHOSSE", "шоссе "},
                {"StreetType.PLOSHAD", "пл. "},
                {"StreetType.BULVAR", "бульвар "},
                {"StreetType.PROEZD", "проезд "},
                {"StreetType.VCH", "в.ч. "}





        };
    }
}
