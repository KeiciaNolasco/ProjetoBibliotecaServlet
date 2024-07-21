package com.library.controller;

import java.io.IOException;

import com.library.dao.BookDAO;
import com.library.dao.UserDAO;
import com.library.model.Book;
import com.library.model.User;
import com.library.service.AuthenticationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {
        "/about", "/footer", "/home", "/listBooks", "/login", "/navbar", "/register", "/logout",
        "/adminAbout", "/adminAddBook", "/adminEditBook", "/adminFooter", "/adminHome", "/adminListBooks", "/AdminLogout", "/adminNavbar", "/adminRemoveBook"
})

public class MainController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BookDAO bookDAO;
    private UserDAO userDAO;
    private AuthenticationService authService;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
        userDAO = new UserDAO();
        authService = new AuthenticationService(new UserDAO());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/login":
                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
                break;
            case "/logout":
                logoutUser(request, response);
                break;
            case "/adminHome":
                request.getRequestDispatcher("/admin/adminHome.jsp").forward(request, response);
                break;
            case "/register":
                request.getRequestDispatcher("/common/register.jsp").forward(request, response);
                break;
            case "/listBooks":
                request.getRequestDispatcher("/common/listBooks.jsp").forward(request, response);
                break;
            case "/adminListBooks":
                request.getRequestDispatcher("/admin/adminListBooks.jsp").forward(request, response);
                break;
            case "/adminAddBooks":
                request.getRequestDispatcher("/admin/adminAddBook.jsp").forward(request, response);
                break;
            case "/adminEditBook":
                showEditBookForm(request, response);
                break;
            case "/adminRemoveBook":
                showRemoveBookForm(request, response);
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
                listBooks(request, response);
                break;
            case "/adminListBooks":
                adminListBooks(request, response);
                break;
            case "/adminAddBook":
                addBook(request, response);
                break;
            case "/adminEditBook":
                editBook(request, response);
                break;
            case "/adminRemoveBook":
                removeBook(request, response);
                break;
            default:
                request.getRequestDispatcher("/common/home.jsp").forward(request, response);
                break;
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/common/listBooks.jsp").forward(request, response);
    }

    private void adminListBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/adminListBooks.jsp").forward(request, response);
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        Book existingBook = bookDAO.findById(isbn);
        if (existingBook == null) {
            Book book = new Book(isbn, title, category, quantity, image);
            bookDAO.save(book);
            response.sendRedirect("/admin/adminListBooks.jsp");
        } else {
            request.setAttribute("errorMessage", "A book with this ISBN already exists.");
            request.getRequestDispatcher("/admin/adminAddBook.jsp").forward(request, response);
        }

    }

    private void showEditBookForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        request.setAttribute("isbn", isbn);
        request.setAttribute("title", title);
        request.setAttribute("category", category);
        request.setAttribute("quantity", quantity);
        request.setAttribute("image", image);

        request.getRequestDispatcher("/admin/adminEditBook.jsp").forward(request, response);
    }


    private void editBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        Book book = new Book(isbn, title, category, quantity, image);
        bookDAO.update(book);
        response.sendRedirect(request.getContextPath() + "/admin/adminListBooks.jsp");
    }

    private void showRemoveBookForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        request.setAttribute("isbn", isbn);
        request.setAttribute("title", title);
        request.setAttribute("category", category);
        request.setAttribute("quantity", quantity);
        request.setAttribute("image", image);

        request.getRequestDispatcher("/admin/adminRemoveBook.jsp").forward(request, response);
    }

    private void removeBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        bookDAO.deleteById(isbn);
        response.sendRedirect(request.getContextPath() + "/admin/adminListBooks.jsp");
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

    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/common/home.jsp");
    }
}