package web.servlet;

import entity.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth")
public class AuthorizationServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/auth.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        boolean saving = Boolean.parseBoolean(req.getParameter("saving"));
        User byUsername = userService.findByUsername(username);
        if (byUsername != null){
            if (byUsername.getPassword().equals(password)) {
                req.setAttribute("auth", byUsername.getName());
                if (saving){
                    req.getSession().setAttribute("user", byUsername);
                }
            } else {
                req.setAttribute("authFail", "Error");
            }
        } else {
            req.setAttribute("authFail", "Error");
        }
        getServletContext().getRequestDispatcher("/auth.jsp").forward(req, resp);
    }
}
