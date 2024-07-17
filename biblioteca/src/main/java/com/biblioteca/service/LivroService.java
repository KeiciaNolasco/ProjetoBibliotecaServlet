package com.biblioteca.service;

import com.biblioteca.dao.LivroDAO;
import com.biblioteca.model.Livro;

import java.util.List;

public class LivroService {

    private LivroDAO livroDAO;

    public LivroService(LivroDAO livroDAO) {
        this.livroDAO = livroDAO;
    }

    public void saveLivro(Livro livro) {
        livroDAO.save(livro);
    }

    public List<Livro> getAllLivros() {
        return livroDAO.findAll();
    }

    public Livro getLivroById(String isbn) {
        return livroDAO.findById(isbn);
    }

    public void updateLivro(Livro livro) {
        livroDAO.update(livro);
    }

    public void deleteLivro(String isbn) {
        livroDAO.deleteById(isbn);
    }
}