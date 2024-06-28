<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>

<div>
    <main>
        <div class="main-cont">
            <div class="students-top d-flex justify-content-between">
                <div class="form-group">
                    <select name="class" id="class" class="form-select" required>
                        <option selected disabled>Select Class</option>
                        <c:forEach var="cls" items="${classes}">
                            <option value="${cls.id}">
                                <c:out value="${cls.level}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <a href="<%=request.getContextPath()%>/register-student" class="btn btn-success">Add new</a>
            </div>
            <hr />
            <div class="students-placeholder">
                <div class="alert alert-warning">
                    <strong>Warning!</strong>
                    <p>Select Class to view Students</p>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    let contextPath = "<%=request.getContextPath()%>"
    $(document).ready(function () {
        $("#class").on("change", function () {
            let classId = $(this).val();
            $.get(contextPath+"/students-by-id", {id: classId}, function (data) {
                // console.log(data);
                $(".students-placeholder").html(data);
            })
        })
    })
</script>


<%@ include file="/WEB-INF/inc/footer.jsp"%>