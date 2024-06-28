<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div>
    <main>
        <div class="main-cont">
            <div class="marks-top">
                <div class="form-group d-flex g-3">
                    <select name="class" id="class" class="form-select w-25" style="margin-right: 10px" required>
                        <option selected disabled>Select Class</option>
                        <c:forEach var="cls" items="${classes}">
                            <option value="${cls.id}">
                                <c:out value="${cls.level}" />
                            </option>
                        </c:forEach>
                    </select>
                    <select name="course" id="course" class="form-select w-25" required>
                        <option selected disabled>Select Course</option>
                    </select>
                    <label id="marks-label" class="border rounded-2 mx-3 px-2 py-1"></label>
                </div>
            </div>
            <hr />
            <div class="marks-entry-placeholder">
                <div class="marks-entry">
                    <form action="" id="set-marks" class="mine">
                        <div class="alert alert-warning" role="alert">
                            <strong>Warning</strong>
                            <p>Select Class and Subject</p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    let contextPath = "<%=request.getContextPath()%>"

    $(document).ready(function () {

        function showLoader() {
            $("#set-marks").html(`
                <div class="d-flex justify-content-center">
                            <div class="spinner-border m-5">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
            `)
        }


        $("#class").on("change", function (e) {
            $("#course").empty();
            let classId = $(this).val();

            $.ajax({
                type: "GET",
                url: contextPath + "/marks-entry/getStudents",
                data: { id: classId },
                beforeSend: function () {
                    // $("#set-marks").fadeOut()
                    showLoader()
                },
                success: function (data) {
                    // $("#set-marks").fadeIn()
                    console.log("Request successful!");
                    $("#set-marks").html(data);
                },
                error: function (error) {
                    console.error("Error in the request:", error);
                }
            });

            $.get(contextPath+"/manage-course/classCoursesJSON", {id : classId}, function (data) {
                data.forEach(course => {
                    $("#course").append($("<option>", {
                        value : course.courseId,
                        text : course.courseTitle,
                        "data-course-mark" : course.courseMarks
                    }))
                })
            })


        })
        let marks
        $("#course").on("change", function (e) {
            let selectedCourse = $(this).find("option:selected")
            marks = selectedCourse.data("course-mark")


            $("#marks-label").html("CAT = Exam = "+marks)

        })

        $("#set-marks").on("submit", function (e) {
            e.preventDefault();
            let class_id = $("select[name='class']").val()
            let course_id = $("select[name='course']").val()
            let studId = $(".stud_id").toArray().map(input => $(input).val())
            let catMarks = $(".cat").toArray().map(input => $(input).val())
            let examMarks = $(".exam").toArray().map(input => $(input).val())

            let marksArray = [];

            if (catMarks.some(mark => mark > marks) || examMarks.some(mark => mark > marks)) {
                toastr.error("All Marks should be less than " + marks);
            }else {
                for (let i = 0; i < studId.length; i++) {
                    let setMarks = {
                        studentId : studId[i],
                        classId : class_id,
                        courseId : course_id,
                        catMarks : catMarks[i],
                        examMarks: examMarks[i]
                    }

                    marksArray.push(setMarks)
                }

                // console.log(marksArray)
                // console.log(JSON.stringify(marksArray))


                $.ajax({
                    type : "POST",
                    url : contextPath+"/marks-entry/getMarks",
                    contentType : "application/json",
                    data : JSON.stringify(marksArray),
                    success : function (response) {
                        console.log(response)
                        if (response === "Success") {
                            $("#set-marks")[0].reset();
                            toastr.success("Marks Inserted Successfully");
                        }
                    },
                    error : function (error) {
                        console.log(error)
                    }

                })

            }



        })

    })
</script>




<%@ include file="/WEB-INF/inc/footer.jsp"%>