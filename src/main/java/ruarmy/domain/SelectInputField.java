package ruarmy.domain;

import java.util.ArrayList;
import java.util.List;

public class SelectInputField {

	public static String emailRegexp = "^[-a-z0-9!#$%&'*+/=?^_`{|}~]+(?:\\.[-a-z0-9!#$%&'*+/=?^_`{|}~]+)*@(?:[a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\\.)*(?:aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z][a-z])$";


	static String[] emails = new String[]{"rss.kvs@gmail.com", "vladimir@gmail.com"};


	public static List<String> getEmailsByTerm(String term){
		List<String> res = new ArrayList<String>();
		for (String email : emails){
			if (email.toLowerCase().contains(term.toLowerCase()))
				res.add(email);
		}
		return res;
	}

}
