<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div>
    <main>
        <div class="main-cont">
            <form action="" method="post" id="add_student" class="student-form">
                <div class="student-form-top d-flex justify-content-between">
                    <div class="action-btns">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="reset" class="btn btn-primary">Reset</button>
                    </div>
                    <h3>REGISTER NEW STUDENT</h3>
                </div>
                <hr />
                <div class="student-form-body row">
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="card" style="padding: 20px">
                            <div class="form-group mb-3">
                                <label for="regno" class="form-label">Reg Numbers</label>
                                <input type="text" name="regno" id="regno" class="form-control" value="" readonly required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="fname" class="form-label">First Name</label>
                                <span class="required">*</span>
                                <input type="text" name="fname" id="fname" class="form-control" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="lname" class="form-label">Last Name</label>
                                <span class="required">*</span>
                                <input type="text" name="lname" id="lname" class="form-control" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" name="email" id="email" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label for="bdate" class="form-label">Birth Date</label>
                                <span class="required">*</span>
                                <input type="date" name="bdate" id="bdate" class="form-control" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label" style="padding-right: 10px">Sex</label>
                                <label for="male">
                                    <input type="radio" name="sex" value="Male" id="male">
                                    Male
                                </label>
                                <label for="female">
                                    <input type="radio" name="sex" value="Female" id="female">
                                    Female
                                </label>
                            </div>
                            <div class="form-group mb-3">
                                <label for="nationality" class="form-label">Nationality</label>
                                <span class="required">*</span>
                                <input type="text" name="nationality" id="nationality" class="form-control" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="province" class="form-label">Province</label>
                                <span class="required">*</span>
                                <select name="province" id="province" class="form-select" required>
                                    <option selected disabled>Select Province</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label for="district" class="form-label">District</label>
                                <span class="required">*</span>
                                <select name="district" id="district" class="form-select" required>
                                    <option selected disabled>Select District</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label for="sector" class="form-label">Sector</label>
                                <span class="required">*</span>
                                <select name="sector" id="sector" class="form-select" required>
                                    <option selected disabled>Select Sector</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label for="cell" class="form-label">Cell</label>
                                <span class="required">*</span>
                                <select name="cell" id="cell" class="form-select" required>
                                    <option disabled selected>Select Cell</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label for="village" class="form-label">Village</label>
                                <span class="required">*</span>
                                <select name="village" id="village" class="form-select" required>
                                    <option disabled selected>Select Village</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="card" style="padding: 20px">
                            <div class="form-group mb-3">
                                <label for="class" class="form-label">Class</label>
                                <span class="required">*</span>
                                <select name="class" id="class" class="form-select" required>
                                    <option disabled selected>Select Class</option>
                                    <c:forEach var="cls" items="${classes}">
                                        <option value="${cls.id}">${cls.level}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label for="sdmode" class="form-label">Study Mode</label>
                                <span class="required">*</span>
                                <select name="sdmode" id="sdmode" class="form-select" required>
                                    <option disabled selected>Select studying mode</option>
                                    <option value="Boarding">Boarding</option>
                                    <option value="Day">Day</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label for="religion" class="form-label">Religion</label>
                                <select name="religion" id="religion" class="form-select">
                                    <option disabled selected>Select Religion</option>
                                    <option value="Catholic">Catholic</option>
                                    <option value="Islam">Islam</option>
                                    <option value="SDA">SDA</option>
                                    <option value="JW">J Witnesses</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>

<script>

    let contextPath = "<%=request.getContextPath()%>"

    $(document).ready(function () {
        $("#add_student").on("submit", function (e) {
            e.preventDefault();

            let student = {
                fname : $("#fname").val(),
                lname : $("#lname").val(),
                email : $("#email").val(),
                bdate : $("#bdate").val(),
                sex : $("input[name='sex']:checked").val(),
                nationality : $("#nationality").val(),
                province : $("#province").val(),
                district : $("#district").val(),
                sector : $("#sector").val(),
                cell : $("#cell").val(),
                village : $("#village").val(),
                class : $("#class").val(),
                sdmode : $("#sdmode").val(),
                religion : $("#religion").val()
            }
            console.log(student)
            $.post(contextPath+"/register-student/add", student, function (response) {
                console.log(response)
                if(response === "Success") {
                    toastr.success("Student Registered Successfully")
                    $("#add_student")[0].reset()
                }
            })

        })
    })


</script>

<%@ include file="/WEB-INF/inc/footer.jsp"%>