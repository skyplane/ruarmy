package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.City;

import java.util.List;

/**
 * Created by skyplane on 04.05.17.
 */
public interface CityRepository extends JpaRepository<City, Long> {

    List<City> findBySubjectCodeAndNameLike(Integer subjectCode, String name);


}
