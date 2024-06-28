package com.srms.srms1.student;

import com.srms.srms1.classes.Class;
import com.srms.srms1.classes.ClassDAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet (name = "student-servlet", urlPatterns = {"/register-student", "/students", "/register-student/add", "/students-by-id"})
public class StudentServlet extends HttpServlet {

    ClassDAOImpl classDAO;
    StudentDAOImpl studentDAO;


    @Override
    public void init() throws ServletException {
        classDAO = new ClassDAOImpl();
        studentDAO = new StudentDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        switch (url) {
            case "/register-student":
                registerStudent(req, resp);
                break;
            case "/students":
                viewAllStudents(req, resp);
                break;
            case "/register-student/add":
                addStudent(req, resp);
                break;
            case "/students-by-id":
                viewStudentById(req, resp);
                break;
        }
    }


    public void viewAllStudents(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classes = classDAO.selectAllClasses();
        req.setAttribute("classes", classes);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/students/viewStudents.jsp");
        dispatcher.forward(req, resp);
    }

    public void viewStudentById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Student> students = studentDAO.selectStudentsByClass(id);
        req.setAttribute("students", students);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/studentList.jsp");
        dispatcher.forward(req, resp);


    }

    public void registerStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classes = classDAO.selectAllClasses();
        req.setAttribute("classes", classes);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/students/registerStudent.jsp");
        dispatcher.forward(req, resp);
    }

    public void addStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String bdate = req.getParameter("bdate");
        String sex = req.getParameter("sex");
        String nationality = req.getParameter("nationality");
        String province = req.getParameter("province");
        String district = req.getParameter("district");
        String sector = req.getParameter("sector");
        String cell = req.getParameter("cell");
        String village = req.getParameter("village");
        int class_id = Integer.parseInt(req.getParameter("class"));
        String study_mode = req.getParameter("sdmode");
        String religion = req.getParameter("religion");

        studentDAO.insertStudent(new Student.Builder(fname, lname, bdate, sex, nationality, province, district, sector, cell, village, class_id, study_mode).email(email).religion(religion).build());

        try(PrintWriter out = resp.getWriter()) {
            out.print("Success");
        }


    }

}
