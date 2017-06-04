package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.City;
import ruarmy.domain.Skill;

import java.util.List;

/**
 * Created by skyplane on 29.05.17.
 */
public interface SkillRepository  extends JpaRepository<Skill, Long> {

    List<Skill> findByFieldOfActivityCode(Integer fieldOfActivityCode);


}
