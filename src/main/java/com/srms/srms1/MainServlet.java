package com.srms.srms1;

import com.srms.srms1.classes.ClassDAOImpl;
import com.srms.srms1.student.StudentDAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "base", urlPatterns = {"/","/dashboard", "/get-report","/login"})
public class MainServlet extends HttpServlet {

    ClassDAOImpl classDAO;
    StudentDAOImpl studentDAO;



    @Override
    public void init() throws ServletException {
        classDAO = new ClassDAOImpl();
        studentDAO = new StudentDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        switch (url) {
            case "/dashboard":
                showDashboard(req, resp);
                break;
            case "/get-report":
                showStudentReport(req, resp);
                break;
            case "/":
                showWelcome(req, resp);
                break;
            case "/login":
                showLogin(req, resp);
                break;
        }
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int countStudents = studentDAO.countStudents();
        req.setAttribute("studentsCount", countStudents);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/dashboard.jsp");
        dispatcher.forward(req, resp);
    }

    private void showStudentReport(HttpServletRequest rep, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = rep.getRequestDispatcher("/student-report.jsp");
        dispatcher.forward(rep, resp);
    }

    private void showWelcome(HttpServletRequest rep, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = rep.getRequestDispatcher("/index.jsp");
        dispatcher.forward(rep, resp);
    }

    private void showLogin(HttpServletRequest rep, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = rep.getRequestDispatcher("/login.jsp");
        dispatcher.forward(rep, resp);
    }

}
