package br.com.guilherme.service;

import br.com.guilherme.model.CustomUserDetails;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.ArgumentMatchers.isA;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class CustomUserDetailsServiceTest {

    @InjectMocks
    private CustomUserDetailsService customUserDetailsService;

    @Mock
    private UserRepository userRepository;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    @DisplayName("Deve retornar um usuário")
    void deveRetornarUmUsuario() {
        String username = "gui@com";

        UserModel userModel = new UserModel();
        userModel.setEmail("gui@com");

        when(userRepository.findByEmail(eq(username))).thenReturn(userModel);

        UserDetails usuario = customUserDetailsService.loadUserByUsername(username);

        Assertions.assertEquals("gui@com", usuario.getUsername());

    }

    @Test
    @DisplayName("Deve lançar uma exceção quando não acha um usuário")
    void deveLancarUmaExcecaoQuandoNaoEncontrarUsuario() {
        String username = "gui@com";

        when(userRepository.findByEmail(eq(username))).thenReturn(null);

        Assertions.assertThrows(UsernameNotFoundException.class, () -> customUserDetailsService.loadUserByUsername(username));

    }

}
