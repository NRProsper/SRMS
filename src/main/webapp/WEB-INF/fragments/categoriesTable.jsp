<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="table-responsive">
<c:if test="${not empty categories}">
  <table id="category-table">
    <thead>
    <tr>
      <th >Title</th>
      <th >Status</th>
      <th >Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="category" items="${categories}">
      <tr id="category-row-${category.id}">
        <td>
          <c:out value="${category.title}"/>
        </td>
        <td>
          <c:out value="${category.status}"/>
        </td>
        <td class="">
          <a href="" class="edit" data-bs-toggle="modal" data-bs-target="#update-category" data-category-title="${category.title}" data-category-id="${category.id}">
            <i class="ph ph-bold ph-note-pencil"></i>
            <span>Edit</span>
          </a>
          <a href="" class="delete delete-category" data-category-id="${category.id}">
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
<c:if test="${empty categories}">
  <div class="alert alert-warning">
    <Strong>Error!</Strong>
    <p>No Data Found in the Database.</p>
  </div>
</c:if>