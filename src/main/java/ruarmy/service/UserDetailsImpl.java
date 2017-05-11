package ruarmy.service;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ruarmy.domain.User;

import java.util.Collection;
import java.util.LinkedList;

/**
 * Created by skyplane on 05.05.17.
 */
public class UserDetailsImpl  implements UserDetails {
    private LinkedList<GrantedAuthority> grantedAuthorities = new LinkedList<GrantedAuthority>();
    private User user;

    public UserDetailsImpl(User user) {
        this.user = user;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        return grantedAuthorities;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getLogin();
    }

    public String getRoleName() {
        return user.getRole().getResourceKey();
    }


    public Long getId() {
        return user.getId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
