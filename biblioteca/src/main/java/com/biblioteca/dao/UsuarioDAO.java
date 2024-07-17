package com.biblioteca.dao;

import com.biblioteca.model.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario, Integer> {

    public UsuarioDAO() {
        super(Usuario.class);
    }

}
