package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.Subject;

import java.util.List;

/**
 * Created by skyplane on 04.05.17.
 */
public interface SubjectRepository extends JpaRepository<Subject, Long> {

    List<Subject> findByTypeAndNameLike(Integer type, String term);

}
