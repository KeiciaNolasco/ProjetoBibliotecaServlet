package com.biblioteca.controller;

import java.io.IOException;
import com.biblioteca.dao.LivroDAO;
import com.biblioteca.dao.UsuarioDAO;
import com.biblioteca.model.Livro;
import com.biblioteca.model.Usuario;
import com.biblioteca.service.AuthenticationService;
import com.biblioteca.service.LivroService;
import com.biblioteca.service.UsuarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/index", "/login", "/adminHome", "/register", "/livros", "/usuarios", "/salvarLivro", "/editarLivro", "/removerLivro"})
public class MainController extends HttpServlet {
    private LivroService livroService;
    private UsuarioService usuarioService;
    private AuthenticationService authService;

    @Override
    public void init() throws ServletException {
        livroService = new LivroService(new LivroDAO());
        usuarioService = new UsuarioService(new UsuarioDAO());
        authService = new AuthenticationService(new UsuarioDAO());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/login":
                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
                break;
            case "/adminHome":
                request.getRequestDispatcher("/admin/adminHome.jsp").forward(request, response);
                break;
            case "/livros":
                listarLivros(request, response);
                break;
            case "/usuarios":
                listarUsuarios(request, response);
                break;
            case "/editarLivro":
                editarLivroForm(request, response);
                break;
            case "/removerLivro":
                removerLivro(request, response);
                break;
            default:
                request.getRequestDispatcher("/common/home.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/register":
                registrarUsuario(request, response);
                break;
            case "/login":
                request.getRequestDispatcher("/admin/adminHome.jsp").forward(request, response);
                break;
            case "/salvarLivro":
                salvarLivro(request, response);
                break;
            case "/editarLivro":
                editarLivro(request, response);
                break;
            default:
                request.getRequestDispatcher("/common/home.jsp").forward(request, response);
                break;
        }
    }

    private void listarLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listaLivros", livroService.getAllLivros());
        request.getRequestDispatcher("/common/listBooks.jsp").forward(request, response);
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listaUsuarios", usuarioService.getAllUsuarios());
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

    private void salvarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Livro livro = new Livro(isbn, titulo, categoria, quantidade);
        livroService.saveLivro(livro);
        response.sendRedirect("livros");
    }

    private void editarLivroForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        Livro livro = livroService.getLivroById(isbn);
        request.setAttribute("livro", livro);
        request.getRequestDispatcher("/common/editBook.jsp").forward(request, response);
    }

    private void editarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Livro livro = new Livro(isbn, titulo, categoria, quantidade);
        livroService.updateLivro(livro);
        response.sendRedirect("livros");
    }

    private void removerLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        livroService.deleteLivro(isbn);
        response.sendRedirect("livros");
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario(nome, email, senha);
        authService.registerUser(usuario);
        response.sendRedirect("usuarios");
    }

    private void logarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = authService.authenticate(email, senha);
        if (usuario != null) {
            request.getSession().setAttribute("usuario", usuario);
            request.getRequestDispatcher("/admin/adminHome.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
        }
    }
}