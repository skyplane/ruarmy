package ruarmy.handler;

import org.aspectj.lang.annotation.Before;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import ruarmy.annotation.Trottling;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.stream.Collectors;

/**
 * Created by skyplane on 16.11.17.
 */
@Component
@org.aspectj.lang.annotation.Aspect
public class TrottlingProcessor {

    Map<String, ConcurrentSkipListSet<Date>> map = new ConcurrentHashMap<>();

    @Before("@annotation(ruarmy.annotation.Trottling) && @annotation(trottling)")
    public void before(Trottling trottling){
        for (String ip : map.keySet()) {
            List<Date> toRemove = new ArrayList<>();
            for (int i = 0; i < map.get(ip).size(); i++) {
                Date time = (Date) map.get(ip).toArray()[i];
                if (time.getTime() < (new Date().getTime() - trottling.period() * 1000))
                toRemove.add(time);
            }
            map.get(ip).removeAll(toRemove);
            if (map.get(ip).size()==0)
                map.remove(ip);
        }

        if (map.get(trottling.ip())==null)
            map.put(trottling.ip(), new ConcurrentSkipListSet<>());
        ConcurrentSkipListSet list = map.get(trottling.ip());

        if (list.size() < trottling.count()) {
            list.add(new Date());
        } else {
            throw new AccessDeniedException("403 returned");
        }
    }
}
