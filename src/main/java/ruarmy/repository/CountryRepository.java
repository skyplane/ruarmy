package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.City;
import ruarmy.domain.Country;

import java.util.List;

/**
 * Created by skyplane on 03.06.17.
 */
public interface CountryRepository extends JpaRepository<Country, Long> {

    List<Country> findByNameLike(String query);

}
