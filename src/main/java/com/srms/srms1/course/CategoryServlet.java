package com.srms.srms1.course;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "course-category", urlPatterns = {"/course-category", "/course-category/add", "/course-category/update", "/course-category/delete"})
public class CategoryServlet extends HttpServlet {

    private CategoryDAOImpl categoryDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        switch (url) {
            case "/course-category/add":
                addCategory(req, resp);
                break;
            case "/course-category/update":
                updateCategory(req, resp);
                break;
            case "/course-category/delete":
                deleteCategory(req, resp);
                break;
            case "/course-category":
                listCategories(req, resp);
                break;
        }

    }

    public void addCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("category");
        System.out.println(title);
        Category newCategory = new Category(title);
        categoryDAO.insertCategory(newCategory);
//        reloadTable(req, resp);
//        listCategories(req, resp);
        resp.sendRedirect(req.getContextPath()+"/course-category");
    }

    public void listCategories(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List <Category> courseCats = categoryDAO.selectAllCategories();
        req.setAttribute("categories", courseCats);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/courses/courseCategory.jsp");
        dispatcher.forward(req, resp);
    }

    public void updateCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("category");
        categoryDAO.updateCategory(id, title);
//        listCategories(req, resp);
        resp.sendRedirect(req.getContextPath()+"/course-category");
    }

    public void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        categoryDAO.deleteCategory(id);
        reloadTable(req, resp);
    }

    public void reloadTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryDAO.selectAllCategories();
        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/categoriesTable.jsp");
        dispatcher.forward(req, resp);
    }


}
