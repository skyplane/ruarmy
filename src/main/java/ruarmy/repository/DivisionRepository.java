package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.Division;
import ruarmy.domain.Profile;

import java.util.List;

/**
 * Created by skyplane on 13.05.17.
 */
public interface DivisionRepository extends JpaRepository<Division, Long> {


}
