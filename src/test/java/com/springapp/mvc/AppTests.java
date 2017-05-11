package com.springapp.mvc;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ResourceBundle;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

//@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
@RunWith(SpringJUnit4ClassRunner.class)

public class AppTests {
/*    private MockMvc mockMvc;

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    protected WebApplicationContext wac;*/


    @Before
    public void setup() {
        //this.mockMvc = webAppContextSetup(this.wac).build();
    }

    @Test
    public void simple() throws Exception {

        ResourceBundle myResources = ResourceBundle.getBundle("resources");
        String string = myResources.getString("HelpKey");
        System.out.println("HelpKey: " + string);


/*        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("hello"));*/
    }
}
