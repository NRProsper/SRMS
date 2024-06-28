package com.srms.srms1.marks;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.srms.srms1.classes.Class;
import com.srms.srms1.classes.ClassDAOImpl;
import com.srms.srms1.course.CourseDAOImpl;
import com.srms.srms1.student.Student;
import com.srms.srms1.student.StudentDAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@WebServlet(name = "marks-servlet", urlPatterns = {"/marks-entry", "/marks-entry/getStudents", "/marks-entry/getMarks"})
public class MarksServlet extends HttpServlet {

    CourseDAOImpl courseDAO;
    ClassDAOImpl classDAO;
    StudentDAOImpl studentDAO;
    MarksDAOImpl marksDAO;

    @Override
    public void init() throws ServletException {
        courseDAO = new CourseDAOImpl();
        classDAO = new ClassDAOImpl();
        studentDAO = new StudentDAOImpl();
        marksDAO = new MarksDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();

        switch (url) {
            case "/marks-entry":
                marksEntry(req, resp);
                break;
            case "/marks-entry/getStudents":
                getStudentsFill(req, resp);
                break;
            case "/marks-entry/getMarks":
                getMarks(req, resp);
                break;
        }


    }


    public void marksEntry(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classes = classDAO.selectAllClasses();

        req.setAttribute("classes", classes);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/marks/marksEntry.jsp");
        dispatcher.forward(req, resp);
    }

    public void getStudentsFill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Student> students = studentDAO.selectStudentsByClass(id);
        req.setAttribute("students", students);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/marksEntryTable.jsp");
        dispatcher.forward(req, resp);
    }

    public void getMarks(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        List<Marks> marksList = new ArrayList<>();


        ObjectMapper objectMapper = new ObjectMapper();
        Marks[] marksArray = objectMapper.readValue(req.getReader(), Marks[].class);
        marksList.addAll(Arrays.asList(marksArray));

        marksDAO.insertMarks(marksList);

        try (PrintWriter out = resp.getWriter()) {

            out.print("Success");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }


    }

}
