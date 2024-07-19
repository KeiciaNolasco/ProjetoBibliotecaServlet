package com.library.controller;

import java.io.IOException;
import java.util.List;

import com.library.dao.BookDAO;
import com.library.dao.UserDAO;
import com.library.model.Book;
import com.library.model.User;
import com.library.service.AuthenticationService;
import com.library.service.BookService;
import com.library.service.UserService;
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
            case "/register":
                request.getRequestDispatcher("/common/register.jsp").forward(request, response);
                break;
            case "/listBooks":
                listBooks(request, response, "/common/listBooks.jsp");
                break;
            case "/adminListBooks":
                listBooks(request, response, "/admin/adminListBooks.jsp");
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
                registerUser(request, response);
                break;
            case "/login":
                loginUser(request, response);
                break;
            case "/listBooks":
                listBooks(request, response, "/common/listBooks.jsp");
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

    private void listBooks(HttpServletRequest request, HttpServletResponse response, String jspPath) throws ServletException, IOException {
        List<Book> books = bookService.findAll();
        request.setAttribute("listBooks", books);
        request.getRequestDispatcher(jspPath).forward(request, response);
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listUsers", userService.findAll());
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

    private void salvarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("title");
        String categoria = request.getParameter("category");
        Integer quantidade = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        Book book = new Book(isbn, titulo, categoria, quantidade, image);
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
        Integer quantidade = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        Book book = new Book(isbn, titulo, categoria, quantidade, image);
        bookService.update(book);
        response.sendRedirect("books");
    }

    private void removerLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        bookService.delete(isbn);
        response.sendRedirect("books");
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(name, email, password);
        authService.registerUser(user);
        response.sendRedirect("/common/login.jsp");
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = authService.authenticate(email, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("/admin/adminHome.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("/common/login.jsp").forward(request, response);
        }
    }
}