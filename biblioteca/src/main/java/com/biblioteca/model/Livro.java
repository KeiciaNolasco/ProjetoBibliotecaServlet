package com.biblioteca.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Objects;

@Entity
@Table(name = "livros")
public class Livro {

    @Id
    @Column(unique=true, name="ISBN", nullable=false)
    private String isbn;

    @Column(name="Título", nullable=false, length=50)
    private String titulo;

    @Column(name="Categoria")
    private String categoria;

    @Column(name="Quantidade", nullable=false)
    private Integer quantidade;


    public Livro() {
    }

    public Livro(String isbn) {
        this.isbn = isbn;
    }

    public Livro(String isbn, String titulo, String categoria, Integer quantidade) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.categoria = categoria;
        this.quantidade = quantidade;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Livro livro = (Livro) o;
        return Objects.equals(isbn, livro.isbn);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(isbn);
    }

}