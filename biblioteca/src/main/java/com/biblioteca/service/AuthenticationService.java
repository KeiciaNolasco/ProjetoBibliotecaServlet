package com.biblioteca.service;

import com.biblioteca.dao.UsuarioDAO;
import com.biblioteca.model.Usuario;

import java.util.List;

public class AuthenticationService {

    private UsuarioDAO usuarioDAO;

    public AuthenticationService(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public Usuario authenticate(String email, String senha) {
        List<Usuario> users = usuarioDAO.findAll();
        for (Usuario user : users) {
            if (user.getEmail().equals(email) && user.getSenha().equals(senha)) {
                return user;
            }
        }
        return null;
    }

    public void registerUser(Usuario usuario) {
        usuarioDAO.save(usuario);
    }

    public List<Usuario> getAllUsers() {
        return usuarioDAO.findAll();
    }

}