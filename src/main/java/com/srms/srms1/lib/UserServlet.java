package com.srms.srms1.lib;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "user", urlPatterns = {"/login/user"})
public class UserServlet extends HttpServlet {

    UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if(url.equals("/login/user")) {
            checkUser(req, resp);
        }
    }


    public void checkUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userName = req.getParameter("user");
        String password = req.getParameter("password");
        User user = userDAO.getUser(userName, password);

        if(user.getUname().equals(userName) && user.getPassword().equals(password)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", user);

            resp.sendRedirect(req.getContextPath() + "/dashboard");
        }else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }


    }
}
