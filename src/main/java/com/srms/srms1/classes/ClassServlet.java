package com.srms.srms1.classes;

import com.srms.srms1.staff.Staff;
import com.srms.srms1.staff.StaffDAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "studentServlet", urlPatterns = {"/classes", "/classes/add"})
public class ClassServlet extends HttpServlet {

    ClassDAOImpl classDAO;
    StaffDAOImpl staffDAO;

    @Override
    public void init() throws ServletException {
        classDAO = new ClassDAOImpl();
        staffDAO = new StaffDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        switch (url) {
            case "/classes":
                listClasses(req, resp);
                break;
            case "/classes/add":
                insertClass(req, resp);
                break;
        }
    }

    public void insertClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String faculty = req.getParameter("faculty");
        String level = req.getParameter("level");
        int mentor_id = Integer.parseInt(req.getParameter("mentor"));

        Class newClass = new Class(type, faculty, level, mentor_id);
        classDAO.insertClass(newClass);
        listClasses(req, resp);

    }

    public void listClasses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classes = classDAO.selectAllClasses();
        List<Staff> staffList = staffDAO.selectAllStaff();
        req.setAttribute("staffList", staffList);
        req.setAttribute("classes", classes);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/classes/classes.jsp");
        dispatcher.forward(req, resp);
    }

}