package com.srms.srms1.course;

import com.srms.srms1.classes.Class;
import com.srms.srms1.classes.ClassDAOImpl;
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

@WebServlet(name = "add_course", urlPatterns = {"/add-course", "/add-course/add", "/add-course/delete", "/add-course/update", "/manage-course","/add-to-class"})
public class CourseServlet extends HttpServlet {

    private CourseDAOImpl courseDAO;
    private CategoryDAOImpl courseCatDAO;
    private ClassDAOImpl classDAO;
    private StaffDAOImpl staffDAO;

    @Override
    public void init() throws ServletException {
        courseDAO = new CourseDAOImpl();
        courseCatDAO = new CategoryDAOImpl();
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
            case "/add-course":
                listCourses(req, resp);
                break;
            case "/add-course/add":
                insertCourse(req, resp);
                break;
            case "/add-course/delete":
                deleteCourse(req, resp);
                break;
            case "/add-course/update":
                updateCourse(req, resp);
                break;
            case "/add-to-class":
                addToClass(req, resp);
                break;
            default:
                showErrorPage(req, resp);
                break;
        }



    }

    public void insertCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String code = req.getParameter("code");
        int category = Integer.parseInt(req.getParameter("category"));
        int credits = Integer.parseInt(req.getParameter("credits"));
        int max_points = Integer.parseInt(req.getParameter("max-points"));

        Course newCourse = new Course(title, code, category, credits, max_points);
        courseDAO.insertCourse(newCourse);
//        reloadCourses(req, resp);

        resp.sendRedirect(req.getContextPath() + "/add-course");

    }

    public void listCourses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List <Course> courses = courseDAO.selectAllCourse();
        List <Category> categories = courseCatDAO.selectAllCategories();
        List<Class> classes  = classDAO.selectAllClasses();
        List<Staff> staffList = staffDAO.selectAllStaff();
        req.setAttribute("staffList", staffList);
        req.setAttribute("classes", classes);
        req.setAttribute("courses", courses);
        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/courses/courseCreate.jsp");
        dispatcher.forward(req, resp);
    }

    public void updateCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String code = req.getParameter("code");
        int category = Integer.parseInt(req.getParameter("category"));
        int credits = Integer.parseInt(req.getParameter("credits"));
        int max = Integer.parseInt(req.getParameter("max-points"));

        courseDAO.updateCourse(id, title, code, category, credits, max);
        resp.sendRedirect(req.getContextPath() + "/add-course");

    }

    public void deleteCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        courseDAO.deleteCourse(id);
        reloadCourses(req, resp);
    }

    private void reloadCourses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Course> courses = courseDAO.selectAllCourse();
        req.setAttribute("courses", courses);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/coursesTable.jsp");
        dispatcher.forward(req, resp);
    }

    private void addToClass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int classId = Integer.parseInt(req.getParameter("class_id"));
        int courseId = Integer.parseInt(req.getParameter("course_id"));
        int staffId = Integer.parseInt(req.getParameter("staff_id"));

        courseDAO.addToClass(classId, courseId, staffId);
        resp.sendRedirect(req.getContextPath() + "/add-course");


    }

    private void showErrorPage(HttpServletRequest rep, HttpServletResponse resp) {
    }


}