package com.srms.srms1.staff;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "staff-servlet", urlPatterns = {"/staff-list", "/staff-list/add", "/staff-list/delete", "/generate-staff-cards"})
public class StaffServlet extends HttpServlet {

    StaffDAOImpl staffDAO;

    @Override
    public void init() throws ServletException {
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
            case "/staff-list":
                listAllStaff(req, resp);
                break;
            case "/staff-list/add":
                addStaff(req, resp);
                break;
            case "/staff-list/delete":
                deleteStaff(req, resp);
                break;
            case "/generate-staff-cards":
                generateStaffCards(req, resp);
                break;
        }

    }


    public void addStaff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        String city = req.getParameter("city");
        String address = req.getParameter("address");

        Staff newStaff = new Staff.Builder(fname, lname, phone, email, country).city(city).address(address).build();

        staffDAO.insertStaff(newStaff);
        listAllStaff(req, resp);

    }

    public void listAllStaff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Staff> staffList = staffDAO.selectAllStaff();
        req.setAttribute("staffList", staffList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/staff/staff-list.jsp");
        dispatcher.forward(req, resp);
    }

    public void deleteStaff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        staffDAO.deleteStaff(id);
        reloadTable(req, resp);
    }

    public void reloadTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Staff> staffList = staffDAO.selectAllStaff();
        req.setAttribute("staffList", staffList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/staffTable.jsp");
        dispatcher.forward(req, resp);
    }

    public void generateStaffCards(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Staff> staffList = staffDAO.selectAllStaff();
        req.setAttribute("staffList", staffList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/staff/generateStaffCards.jsp");
        dispatcher.forward(req, resp);

    }

}
