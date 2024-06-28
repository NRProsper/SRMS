<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <c:if test="${not empty students}">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h3>Enter the Marks</h3>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </div>
                <div class="card-body">
                    <table>
                        <thead>
                        <tr>
                            <th>Reg No</th>
                            <th>Names</th>
                            <th>CAT Marks</th>
                            <th>Exam Marks</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}">
                        <tr>
                                <td>
                                    <c:out value="${student.reg_no}" />
                                    <input type="hidden" value="${student.reg_no}" class="stud_id">
                                </td>
                                <td>
                                    <c:out value="${student.fname} ${student.lname}"/>
                                </td>
                                <td>
                                    <input type="text" name="cat" class="form-control cat" required>
                                </td>
                                <td>
                                    <input type="text" name="exam" class="form-control exam" required>
                                </td>
                        </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="card-footer text-center">
                        <button type="submit" class="btn btn-success g-0 mt-2">Submit</button>
                    </div>
                </div>
    </c:if>
    <c:if test="${empty students}">
        <div class="alert alert-warning">
            <strong>Warnig</strong>
            <p>No Students in current class</p>
        </div>
    </c:if>
</div>