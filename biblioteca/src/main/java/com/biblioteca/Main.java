package com.biblioteca;

import com.biblioteca.dao.UsuarioDAO;
import com.biblioteca.model.Usuario;

public class Main {

    public static void main(String[] args) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.save(new Usuario(null,"John", "joh@gmail.com", "123456"));
    }

}
