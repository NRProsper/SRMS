package com.srms.srms1.classes;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "manage-course", urlPatterns = {"/manage-courses", "/manage-course/getCourses", "/manage-course/classCoursesJSON"})
public class ManageCourseServlet extends HttpServlet {

    ClassCourseDAOImpl classCourseDAO;
    ClassDAOImpl classDAO;

    @Override
    public void init() throws ServletException {
        classCourseDAO = new ClassCourseDAOImpl();
        classDAO = new ClassDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
       switch (url) {
           case "/manage-courses":
               manageCourses(req, resp);
               break;
           case "/manage-course/getCourses":
               getClassCourses(req, resp);
               break;
           case "/manage-course/classCoursesJSON":
               getClassCoursesJSON(req, resp);
               break;
       }
    }

    public void manageCourses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int class_id = Integer.parseInt(req.getParameter("class_id"));
//        List<ClassCourse> classCourses = classCourseDAO.selectClassCourses();
        List<Class> classList = classDAO.selectAllClasses();
        req.setAttribute("classList", classList);
//        req.setAttribute("classCourses", classCourses);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/courses/manageCourses.jsp");
        dispatcher.forward(req, resp);
    }

    public void getClassCourses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int class_id = Integer.parseInt(req.getParameter("class_id"));
        List<ClassCourse> classCourses = classCourseDAO.selectClassCourseById(class_id);
        req.setAttribute("classCourses", classCourses);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/classCourseTable.jsp");
        dispatcher.forward(req, resp);

    }

    public void getClassCoursesJSON(HttpServletRequest req, HttpServletResponse resp) throws JsonProcessingException {
        int id = Integer.parseInt(req.getParameter("id"));
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        List<ClassCourse> classCourses = classCourseDAO.selectClassCourseById(id);

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(classCourses);

        try(PrintWriter out = resp.getWriter()) {

            out.print(json);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }



}
