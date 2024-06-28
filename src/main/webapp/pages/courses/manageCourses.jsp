<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div>
    <main>
        <div class="main-cont">
            <div class="manage-top d-flex justify-content-between">
                <div class="form-group d-flex gap-3">
                    <select name="class" id="class" class="form-select">
                        <option selected disabled>Select Class</option>
                        <c:forEach var="cls" items="${classList}">
                            <option value="${cls.id}">
                                <c:out value="${cls.level}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="button" class="btn btn-success">Add New Course</button>
            </div>
            <hr />
            <div class="class-courses-placeholder">
                <div class="alert alert-warning">
                    <strong>Warning!</strong>
                    <p>Select the Class to view Courses</p>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    let contextPath = "<%=request.getContextPath()%>"
    $(document).ready(function () {
        $("#class").on("change", function (e) {
            let classId = $(this).val();

            $.get(contextPath+'/manage-course/getCourses', {class_id : classId}, function (data) {
                $(".class-courses-placeholder").html(data)
            })
        })
    })
</script>


<%@ include file="/WEB-INF/inc/footer.jsp"%>