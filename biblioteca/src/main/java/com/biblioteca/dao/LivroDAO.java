package com.biblioteca.dao;

import com.biblioteca.model.Livro;

public class LivroDAO extends GenericDAO<Livro, String> {

    public LivroDAO() {
        super(Livro.class);
    }

}
