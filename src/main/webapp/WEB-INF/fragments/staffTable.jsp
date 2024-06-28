<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="table-responsive">
<c:if test="${not empty staffList}">
    <table id="staff-table">
        <thead>
        <tr>
            <th>Names</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Created at</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="staff" items="${staffList}">
            <tr>
                <td>
                    <c:out value="${staff.f_name} ${staff.l_name}" />
                </td>
                <td>
                    <c:out value="${staff.phone}" />
                </td>
                <td>
                    <c:out value="${staff.email}" />
                </td>
                <td>
                    <c:out value="${staff.created_at}" />
                </td>
                <td class="">
                    <a href=""  class="edit" data-staff-id="${staff.id}">
                        <i class="ph ph-bold ph-note-pencil"></i>
                        <span>Edit</span>
                    </a>
                    <a href="" id="delete-staff" class="delete delete-staff" data-staff-id="${staff.id}">
                        <i class="ph ph-bold ph-x-circle"></i>
                        <span>Delete</span>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
</c:if>
<c:if test="${empty staffList}">
    <div class="alert alert-warning">
        <Strong>Error!</Strong>
        <p>No Data Found in the Database.</p>
    </div>
</c:if>