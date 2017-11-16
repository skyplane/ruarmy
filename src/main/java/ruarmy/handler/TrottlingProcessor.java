package ruarmy.handler;

import org.aspectj.lang.annotation.Before;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import ruarmy.annotation.Trottling;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListSet;

/**
 * Created by skyplane on 16.11.17.
 */
@Component
@org.aspectj.lang.annotation.Aspect
public class TrottlingProcessor {

    Map<String, ConcurrentSkipListSet<Date>> map = new ConcurrentHashMap<>();

    @Before("@annotation(ruarmy.annotation.Trottling) && @annotation(trottling)")
    public void before(Trottling trottling){

        if (map.get(trottling.ip())==null) map.put(trottling.ip(), new ConcurrentSkipListSet<>());

        ConcurrentSkipListSet list = map.get(trottling.ip());

        int i = 0;

        for (i = list.size(); i > 0; i--) {
            if (((Date)list.toArray()[i-1]).getTime() < (new Date().getTime() - trottling.period()*1000)) {
                break;
            }
        }

        ConcurrentSkipListSet toRemove = new ConcurrentSkipListSet();

        if (i<list.size())
            for (int i1 = 0; i1 < i; i1++) {
                toRemove.add(list.toArray()[i1]);
            }

        list.removeAll(toRemove);

        if (list.size() < trottling.count()) {
            list.add(new Date());
            map.put(trottling.ip(), list);
        } else {
            throw new AccessDeniedException("403 returned");
        }

    }



}
