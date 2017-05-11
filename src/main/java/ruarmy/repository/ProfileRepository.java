package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.AddressData;

/**
 * Created by skyplane on 08.05.17.
 */
public interface ProfileRepository extends JpaRepository<AddressData, Long> {

}
