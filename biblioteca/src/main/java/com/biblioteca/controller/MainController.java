package com.biblioteca.controller;

import java.io.IOException;
import com.biblioteca.dao.BookDAO;
import com.biblioteca.dao.UserDAO;
import com.biblioteca.model.Book;
import com.biblioteca.model.User;
import com.biblioteca.service.AuthenticationService;
import com.biblioteca.service.BookService;
import com.biblioteca.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {
        "/about", "/footer", "/home", "/listBooks", "/login", "/navbar", "/register",
        "/adminAbout", "/adminAddBook", "/adminEditBook", "/adminFooter", "/adminHome", "/adminListBooks", "/AdminLogout", "/adminNavbar", "/adminRemoveBook"
})

public class MainController extends HttpServlet {

    private BookService bookService;
    private UserService userService;
    private AuthenticationService authService;

    @Override
    public void init() throws ServletException {
        bookService = new BookService(new BookDAO());
        userService = new UserService(new UserDAO());
        authService = new AuthenticationService(new UserDAO());
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
            case "/books":
                listarLivros(request, response);
                break;
            case "/users":
                listarUsuarios(request, response);
                break;
            case "/editBook":
                editarLivroForm(request, response);
                break;
            case "/removeBook":
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
            case "/addBook":
                salvarLivro(request, response);
                break;
            case "/editBook":
                editarLivro(request, response);
                break;
            default:
                request.getRequestDispatcher("/common/home.jsp").forward(request, response);
                break;
        }
    }

    private void listarLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listBooks", bookService.findAll());
        request.getRequestDispatcher("/common/adminListBooks.jsp").forward(request, response);
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listUsers", userService.findAll());
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

    private void salvarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("title");
        String categoria = request.getParameter("category");
        int quantidade = Integer.parseInt(request.getParameter("quantity"));

        Book book = new Book(isbn, titulo, categoria, quantidade);
        bookService.save(book);
        response.sendRedirect("books");
    }

    private void editarLivroForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        Book book = bookService.findById(isbn);
        request.setAttribute("book", book);
        request.getRequestDispatcher("/common/adminEditBook.jsp").forward(request, response);
    }

    private void editarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("title");
        String categoria = request.getParameter("category");
        int quantidade = Integer.parseInt(request.getParameter("quantity"));

        Book book = new Book(isbn, titulo, categoria, quantidade);
        bookService.update(book);
        response.sendRedirect("books");
    }

    private void removerLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        bookService.delete(isbn);
        response.sendRedirect("books");
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("name");
        String email = request.getParameter("email");
        String senha = request.getParameter("password");

        User user = new User(nome, email, senha);
        authService.registerUser(user);
        response.sendRedirect("users");
    }

    private void logarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("password");

        User user = authService.authenticate(email, senha);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("/admin/adminHome.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
        }
    }
}