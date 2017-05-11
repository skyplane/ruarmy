package ruarmy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ruarmy.domain.Cadet;
import ruarmy.repository.CadetRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by skyplane on 02.05.17.
 */
@Controller
@RequestMapping("/api/cadet")
public class CadetController extends BaseController {

    @Autowired
    private CadetRepository cadetRepository;


    @RequestMapping(value = "/saveCadet", method = RequestMethod.GET)
    public void saveSignal(@RequestParam("fio") String fio, HttpServletResponse response) throws UnsupportedEncodingException {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        Cadet cadet = new Cadet();


        cadetRepository.save(cadet);

        printSuccessStatus(response);
    }

}
