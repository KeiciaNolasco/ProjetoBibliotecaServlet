package com.biblioteca.service;

import com.biblioteca.dao.UsuarioDAO;
import com.biblioteca.model.Usuario;

import java.util.List;

public class UsuarioService {

    private UsuarioDAO usuarioDAO;

    public UsuarioService(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public void saveUsuario(Usuario usuario) {
        usuarioDAO.save(usuario);
    }

    public List<Usuario> getAllUsuarios() {
        return usuarioDAO.findAll();
    }

    public Usuario getUsuarioById(Integer id) {
        return usuarioDAO.findById(id);
    }

    public void updateUsuario(Usuario usuario) {
        usuarioDAO.update(usuario);
    }

    public void deleteUsuario(Integer id) {
        usuarioDAO.deleteById(id);
    }
}