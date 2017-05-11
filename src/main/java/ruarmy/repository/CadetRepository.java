package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.Cadet;

/**
 * Created by skyplane on 02.05.17.
 */
public interface CadetRepository extends JpaRepository<Cadet, Long> {
}
