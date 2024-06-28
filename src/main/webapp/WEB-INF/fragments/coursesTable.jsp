<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="table-responsive">
<c:if test="${not empty courses}">
  <table>
    <thead>
    <tr>
      <th class="col">Title</th>
      <th class="col">Code</th>
      <th class="col">Category</th>
      <th class="col">Credits</th>
      <th class="col">Marks</th>
      <th class="col-3">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="course" items="${courses}">
      <tr>
        <td>
          <c:out value="${course.title}"/>
        </td>
        <td>
          <c:out value="${course.code}"/>
        </td>
        <td>
          <c:out value="${course.category_title}"/>
        </td>
        <td>
          <c:out value="${course.credits}"/>
        </td>
        <td>
          <c:out value="${course.max_points}"/>
        </td>
        <td>
          <a href="" class="edit">
            <i class="ph ph-bold ph-note-pencil"></i>
            <span>Assign</span>
          </a>
          <a href="" class="edit" data-bs-target="#update-course" data-bs-toggle="modal" data-course-id="${course.id}" data-course-title="${course.title}"  data-course-code="${course.code}" data-course-credits="${course.credits}" data-course-max="${course.max_points}" data-course-category="${course.category_title}">
            <i class="ph ph-bold ph-note-pencil"></i>
            <span>Edit</span>
          </a>
          <a href="" class="delete delete-course" id="" data-course-id="${course.id}">
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
<c:if test="${empty courses}">
  <div class="alert alert-warning">
    <Strong>Error!</Strong>
    <p>No Data Found in the Database.</p>
  </div>
</c:if>