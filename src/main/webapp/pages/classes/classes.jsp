<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div id="add-class" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title d-flex justify-content-between">
                    <h3>Add New Class</h3>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/classes/add" method="post">
                    <div class="form-group  mb-3">
                        <label for="type" class="form-label">Type</label>
                        <select name="type" id="type" class="form-select" required>
                            <option selected disabled>Select Type</option>
                            <option value="RED">REB - Rwanda Education Board</option>
                            <option value="WDA">WDA - Rwanda Education Board</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="faculty" class="form-label">Faculty</label>
                        <select name="faculty" id="faculty" class="form-select" required>
                            <option selected disabled>Select Faculty</option>
                            <option value="A Level">Advanced Level</option>
                            <option value="O Level">Ordinary Level</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="level" class="form-label">Level</label>
                        <select name="level" id="level" class="form-select" required>
                            <option selected disabled>Select Level</option>
                            <option value="S1">S1</option>
                            <option value="S2">S2</option>
                            <option value="S3">S3</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="mentor" class="form-label">Mentor</label>
                        <select name="mentor" id="mentor" class="form-select" required>
                            <option selected disabled>Select Level</option>
                            <c:forEach var="staff" items="${staffList}">
                                <option value="${staff.id}">${staff.f_name} ${staff.l_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div>
    <main>
        <div class="main-cont">
            <div class="classes">
                <button class="btn btn-success" data-bs-target="#add-class" data-bs-toggle="modal">Add Class</button>
                <hr />
                <div class="class-cont">
                    <div class="table-responsive">
                        <c:if test="${not empty classes}">
                            <table class="">
                                <thead>
                                <tr>
                                    <th>Type</th>
                                    <th>Faculty</th>
                                    <th>Level</th>
                                    <th>Mentor</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="cls" items="${classes}">
                                    <tr>
                                        <td>
                                            <c:out value="${cls.type}" />
                                        </td>
                                        <td>
                                            <c:out value="${cls.faculty}" />
                                        </td>
                                        <td>
                                            <c:out value="${cls.level}" />
                                        </td>
                                        <td>
                                            <c:out value="${cls.mentor_name}" />
                                        </td>
                                        <td class="">
                                            <a href="" class="edit">
                                                <i class="ph ph-bold ph-note-pencil"></i>
                                                <span>Edit</span>
                                            </a>
                                            <a href="" class="delete">
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
                    <c:if test="${empty classes}">
                        <div class="alert alert-warning">
                            <strong>Error!</strong>
                            <p>No Classes Found</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </main>
</div>



<%@ include file="/WEB-INF/inc/footer.jsp"%>