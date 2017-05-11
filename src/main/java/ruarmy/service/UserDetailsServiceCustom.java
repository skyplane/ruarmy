package ruarmy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import ruarmy.domain.User;
import ruarmy.repository.UserRepository;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by skyplane on 05.05.17.
 */
public class UserDetailsServiceCustom implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;


    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{

        final User user = userRepository.findFirst1ByLoginOrderByIdDesc(username);
        if (user == null) {
            throw new UsernameNotFoundException(String.format("User %s is not found", username));
        }
        return createUserDetails(user);
    }

    private UserDetails createUserDetails(final User user) {
        // create new user details instance
        final UserDetailsImpl details = new UserDetailsImpl(user);

        final List<GrantedAuthority> authorities = new LinkedList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(user.getRole().name()));
        details.getAuthorities().addAll(authorities);

        return details;
    }

}
