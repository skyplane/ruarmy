package ruarmy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ruarmy.domain.User;

/**
 * Created by skyplane on 05.05.17.
 */
public interface UserRepository  extends JpaRepository<User, Long> {

    User findFirst1ByLoginOrderByIdDesc(String login);

}
