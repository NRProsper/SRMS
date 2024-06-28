<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="table-responsive">
  <c:if test="${empty classCourses}">
    <div class="alert alert-warning">
      <strong>Warning!</strong>
      <p>No Courses found in this class</p>
    </div>
  </c:if>
  <c:if test="${not empty classCourses}">
    <table>
      <thead>
      <tr>
        <th class="col">Title</th>
        <th class="col">Category</th>
        <th class="col">Max Marks</th>
        <th class="col">Lecturer</th>
        <th class="col">Action</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="classCourse" items="${classCourses}">
        <tr>
          <td><c:out value="${classCourse.courseTitle}"/></td>
          <td><c:out value="${classCourse.categoryTitle}"/></td>
          <td><c:out value="${classCourse.courseMarks}"/></td>
          <td><c:out value="${classCourse.staffName}"/></td>
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