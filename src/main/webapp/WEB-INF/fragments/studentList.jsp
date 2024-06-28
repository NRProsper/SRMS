<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="table-responsive">
    <c:if test="${empty students}">
        <div class="alert alert-warning">
            <strong>Warning!</strong>
            <p>No Students found in this class</p>
        </div>
    </c:if>
    <c:if test="${not empty students}">
        <table>
            <thead>
            <tr>
                <th class="col">Reg No</th>
                <th class="col">Names</th>
                <th class="col">Mode</th>
                <th class="col">Gender</th>
                <th class="col">Class</th>
                <th class="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td><c:out value="${student.reg_no}"/></td>
                    <td><c:out value="${student.fname} ${student.lname}"/></td>
                    <td><c:out value="${student.study_mode}"/></td>
                    <td><c:out value="${student.sex}"/></td>
                    <td><c:out value="${student.level}"/></td>
                    <td>
                        <a href="" class="edit">
                            <i class="ph ph-bold ph-note-pencil"></i>
                            <span>Edit</span>
                        </a>
                        <a href="" class="delete delete-class-course">
                            <i class="ph ph-bold ph-x-circle"></i>
                            <span>Delete</span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>