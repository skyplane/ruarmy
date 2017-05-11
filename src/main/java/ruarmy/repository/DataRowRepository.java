package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.DataRow;

public interface DataRowRepository extends JpaRepository<DataRow, Long> {

}