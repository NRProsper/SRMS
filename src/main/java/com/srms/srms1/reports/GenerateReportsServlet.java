package com.srms.srms1.reports;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@WebServlet(name = "report-forms", urlPatterns = {"/generate-reports", "/generate-reports/class-reports", "/generate-report/student-report"})
public class GenerateReportsServlet extends HttpServlet {

    GenerateReports generateReports;
    ClassDAOImpl classDAO;


    @Override
    public void init() throws ServletException {

        generateReports = new GenerateReports();
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
            case "/generate-reports":
                generateReportsPage(req, resp);
                break;
            case "/generate-reports/class-reports":
                generateReport(req, resp);
                break;
            case "/generate-report/student-report":
                getSingleReport(req, resp);
                break;
        }
    }


    public void generateReportsPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classes = classDAO.selectAllClasses();
        req.setAttribute("classes", classes);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/pages/marks/generateReports.jsp");
        dispatcher.forward(req, resp);
    }

    public void generateReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int classId = Integer.parseInt(req.getParameter("id"));


//        req.setAttribute("reports", reportList);
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/fragments/reportForm.jsp");
//        dispatcher.forward(req, resp);
        List<Map<String, Object>> reportList = generateReports.reportList(classId);
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(reportList);




        try(PrintWriter out = resp.getWriter()) {

            out.print(json);
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void getSingleReport(HttpServletRequest req, HttpServletResponse resp) throws JsonProcessingException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Map<String, Object>> reportList = generateReports.reportById(id);

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(reportList);

        try(PrintWriter out = resp.getWriter()) {
            out.print(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
