<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>


<div id="add-category" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Add New Course Category</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/course-category/add" method="post">
                    <div class="">
                        <label for="title" class="form-label">Title</label>
                        <span class="required">*</span>
                        <input type="text" name="category" id="title" class="form-control" required>
                    </div>
                    <button type="submit" class="submit">Submit</button>
                </form>
            </div>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="submit add-cat">Submit</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>

<div id="update-category" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Update Course Category</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/course-category/update" method="post">
                    <div class="">
                        <label for="u-title" class="form-label">Title</label>
                        <input type="hidden" name="id" id="id">
                        <input type="text" name="category" id="u-title" class="form-control" required>
                    </div>
                    <button type="submit" class="submit">Update</button>
                </form>
            </div>
            <%--            <div class="modal-footer">--%>
            <%--                <button type="button" class="submit add-cat">Submit</button>--%>
            <%--            </div>--%>
        </div>
    </div>
</div>


<div class="">
    <main class="animate__animated animate__fadeIn">
        <div class="main-cont">
           <div class="course-cat">
               <div class="course-top flex">
                   <h2 class="course-title">Course Category Lists</h2>
                   <button id="add-cat" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#add-category">
                       <i class="ph ph-bold ph-plus"></i>
                       Add new
                   </button>
               </div>
               <hr/>
               <div class="course-cont" id="course-cont-placeholder">
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
               </div>
           </div>
        </div>
    </main>
</div>


<script>
    let contextPath = "<%=request.getContextPath()%>";

    $(document).ready(function () {
        $(".edit").on("click", function (e) {
            e.preventDefault();

            let id = $(this).data("category-id");
            let title = $(this).data("category-title")

            $("#id").val(id);
            $("#u-title").val(title);

        })
    })



    $(document).ready(function () {
        $(".delete-category").on("click", function (e) {
            e.preventDefault();

            let id = $(this).data("category-id");

            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if(result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: contextPath+"/course-category/delete",
                        data: {id : id},
                        success: function (response) {
                            console.log(response);
                            $(".course-cont").html(response);
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    })
                }
            })

        })
    })
</script>


<%@ include file="/WEB-INF/inc/footer.jsp"%>