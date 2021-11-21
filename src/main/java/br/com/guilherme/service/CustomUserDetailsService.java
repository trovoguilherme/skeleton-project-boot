package br.com.guilherme.service;

import br.com.guilherme.model.CustomUserDetails;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserModel userModel = userRepo.findByEmail(username);
		if (userModel == null) {
			throw new UsernameNotFoundException("User not found");
		}
		return new CustomUserDetails(userModel);
	}

}
