<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div id="assign-class" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">
                    <h3>Assign Course</h3>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/add-to-class" method="post">
                    <input type="hidden" name="course_id" id="course_id">
                    <div class="form-group mb-3">
                        <label for="class" class="form-label">Class</label>
                        <select name="class_id" id="class" class="form-select" required>
                            <option selected>Select Class</option>
                            <c:forEach var="cls" items="${classes}">
                                <option value="${cls.id}">
                                    <c:out value="${cls.level}" />
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="staff" class="form-label">Teacher</label>
                        <select name="staff_id" id="staff" class="form-select" required>
                            <option selected>Select Teacher</option>
                            <c:forEach var="staff" items="${staffList}">
                                <option value="${staff.id}">
                                    <c:out value="${staff.f_name} ${staff.l_name}" />
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="update-course" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">
                    <h3>Update Course</h3>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/add-course/update" method="post" class="">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group mb-3">
                        <label for="u-title" class="form-label">Title</label>
                        <input type="text" name="title" id="u-title" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="u-code" class="form-label">Code</label>
                        <input type="text" name="code" id="u-code" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="u-category" class="form-label">Category</label>
                        <select name="category" id="u-category" class="form-select" required>
                            <option selected disabled>Select category</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="u-credits" class="form-label">Credits</label>
                        <input type="number" name="credits" id="u-credits" class="form-control" required>
                    </div>
                    <div class="form-group mb-4">
                        <label for="u-max-points" class="form-label">Max Points</label>
                        <input type="number" name="max-points" id="u-max-points" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="">
    <main>
        <div class="main-cont">
            <div class="course-cat">
                <div class="add-course-content">
                    <form id="add-course" action="<%=request.getContextPath()%>/add-course/add" class="d-flex" method="post">
                        <div class="">
                            <label for="title" class="form-label">Title</label>
                            <span class="required">*</span>
                            <input type="text" name="title" id="title" class="form-control" required>
                        </div>
                        <div class="">
                            <label for="code" class="form-label">Code</label>
                            <span class="required">*</span>
                            <input type="text" name="code" id="code" class="form-control" required>
                        </div>
                        <div class="">
                            <label for="category" class="form-label">Category</label>
                            <span class="required">*</span>
                            <select name="category" id="category" class="form-select" required>
                                <option selected disabled>Select Category</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="">
                            <label for="credits" class="form-label">Credits</label>
                            <span class="required">*</span>
                            <input type="number" name="credits" id="credits" class="form-control" required>
                        </div>
                        <div class="">
                            <label for="max-points" class="form-label">Max-Points</label>
                            <span class="required">*</span>
                            <input type="number" name="max-points" id="max-points" class="form-control" required>
                        </div>
                        <button class="btn" type="submit">Submit</button>
                    </form>
                </div>
            </div>
                <div class="course-cat_cont">
                    <div class="table-responsive">
                    <c:if test="${not empty courses}">
                        <table id="course-table" class="display">
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
                                        <a href="" class="assign assign-class" data-bs-target="#assign-class" data-bs-toggle="modal" data-course-id="${course.id}">
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
                </div>
        </div>
    </main>
</div>

<script>
    let contextPath = "<%=request.getContextPath()%>";

    $(document).ready(function() {
        $(".edit").on("click", function (e) {
            e.preventDefault();

            let id = $(this).data("course-id")
            let title = $(this).data("course-title");
            let code = $(this).data("course-code");
            let credits = $(this).data("course-credits");
            let max = $(this).data("course-max");



            $("#u-title").val(title);
            $("#u-code").val(code);
            $("#u-credits").val(credits);
            $("#u-max-points").val(max);
            $("#id").val(id);


        })
    })



//
// $(document).ready(function () {
//     $("#add-course").on("submit", function (e) {
//         e.preventDefault();
//
//         let title = $("#title").val();
//         let code = $("#code").val();
//         let category = $("#category").val();
//         let hours = $("#hours").val();
//         let max_points = $("#max-points").val();
//
//         $.ajax({
//             type: "POST",
//             url: contextPath + "/add-course/add",
//             data: {
//                 title: title,
//                 code: code,
//                 category: category,
//                 hours: hours,
//                 max_points: max_points
//             },
//             success: function (response) {
//                 console.log(response)
//             },
//             error: function (error) {
//                 console.log(error)
//             }
//         })
//
//     })
// })


    $(document).ready(function () {
        $(".assign-class").on("click", function (e) {
            e.preventDefault();

            let courseId = $(this).data("course-id");
            console.log(courseId)
            $("#course_id").val(courseId);

        })
    })

    $(document).ready(function () {
        $(".delete-course").on("click", function (e) {
            e.preventDefault();

            let category_id = $(this).data("course-id");
            console.log(category_id);

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
                        url: contextPath+"/add-course/delete",
                        data: {id : category_id},
                        success: function (response) {
                            console.log(response);
                            $(".course-cat_cont").html(response)
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