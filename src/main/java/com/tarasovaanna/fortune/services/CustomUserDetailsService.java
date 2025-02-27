package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.models.Role;
import com.tarasovaanna.fortune.repositories.RoleRepository;
import com.tarasovaanna.fortune.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.Collections;
import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<MyUser> userOptional = userRepository.findByEmail(email);
        if (userOptional.isPresent()) {
            MyUser user = userOptional.get();
            Role userRole = user.getRole();
            if (userRole == null) {
                throw new UsernameNotFoundException("User has no roles");
            }
            GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + userRole.getName());
            System.out.println("User roles: " + authority);

            return new org.springframework.security.core.userdetails.User(
                    user.getEmail(),
                    user.getPassword(),
                    Collections.singletonList(authority)
            );
        } else {
            throw new UsernameNotFoundException("User not found");
        }
    }
}
