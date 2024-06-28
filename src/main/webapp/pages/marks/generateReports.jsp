<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div>
    <main>
        <div class="main-cont">
            <div class="form-group d-flex justify-content-between">
                <select name="class" id="class" class="form-select w-25">
                    <option selected disabled>Select Class</option>
                    <c:forEach var="cls" items="${classes}">
                        <option value="${cls.id}">
                            <c:out value="${cls.level}" />
                        </option>
                    </c:forEach>
                </select>
                <button type="button" class="btn btn-primary" id="print-reports">Print</button>
            </div>
            <hr />
            <div id="report-forms">
            </div>
        </div>
    </main>
</div>

<script>

    let contextPath = "<%=request.getContextPath()%>"

    function  calculatePercentage(mark, total) {
        let percentage = ((mark*100)/(total*2)).toFixed(2)
        return percentage
    }

    $(document).ready(function () {
        $("#class").on("change", function () {
            let classId = $(this).val()
            $.get(contextPath+"/generate-reports/class-reports", {id : classId},function (response) {
                let data = JSON.parse(response)

                console.log(response)
                console.log(data)
                generateReports(data)

            })

            function generateReports(data) {
                $.each(data, function (index, record) {
                    let table = $('<table>').addClass('table-bordered my-4');
                    let thead = $('<thead>')
                    thead.append('<tr><td colspan="7"><div><h3>MINEDUC SCHOOL MANAGEMENT</h3><h3>XYZ COLLEGE</h3><h3 class="class-level">' + record.student.classLevel + ' ORDINARY LEVEL</h3></div><div class="border rounded-2 p-2 text-center my-2"><h1>PROGRESSIVE REPORT FORM</h1></div><hr /><div><h3>NAMES: ' + record.student.studentName + '</h3></div><div></div></td></tr><tr><th rowspan="3">SUBJECTS</th><th colspan="3" rowspan="2">MAX POINTS</th><th colspan="3">Term 1</th></tr><tr><th colspan="3">O.P</th></tr><tr class=""><th colspan="">CAT</th><th colspan="">EXAM</th><th colspan="">TOT</th><th colspan="">CAT</th><th colspan="">EXAM</th><th colspan="">TOT</th></tr></thead>')
                    let tbody = $('<tbody>')
                    let marksTotal = 0
                    let catTotal = 0
                    let examTotal = 0
                    let maxTotal = 0
                    $.each(record.courses, function (index, course) {
                        let row = $('<tr>')
                        row.append('<td>' + course.courseTitle + '</td>');
                        row.append('<td>' + course.courseMarks + '</td>');
                        row.append('<td>' + course.courseMarks + '</td>');
                        row.append('<td>' + (course.courseMarks * 2) + '</td>');
                        row.append('<td>' + course.catMarks + '</td>');
                        row.append('<td>' + course.examMarks + '</td>');
                        row.append('<td>' + course.totalMarks + '</td>');
                        tbody.append(row);
                        marksTotal += course.courseMarks
                        catTotal += course.catMarks
                        examTotal += course.examMarks
                        maxTotal += course.totalMarks
                    })
                    let totalRow = $('<tr>')
                    totalRow.append('<td>' + "Total" + '</td>')
                    totalRow.append('<td >' + marksTotal + '</td>')
                    totalRow.append('<td>' + marksTotal + '</td>')
                    totalRow.append('<td>' + marksTotal*2 + '</td>')
                    totalRow.append('<td>' + catTotal + '</td>')
                    totalRow.append('<td>' + examTotal + '</td>')
                    totalRow.append('<td>' + maxTotal + '</td>')
                    let percentageRow = $('<tr>')
                    percentageRow.append('<td colspan="4">' + "Percentage" + '</td>')
                    percentageRow.append('<td colspan="3" class="text-center">' + calculatePercentage(maxTotal, marksTotal)+" % " + '</td>')
                    tbody.append(totalRow)
                    tbody.append(percentageRow)
                    table.append(thead);
                    table.append(tbody);

                    $("#report-forms").append(table)
                })
            }
        })

        $("#print-reports").on("click", function () {
            window.print()
        })
    })
</script>


<%@ include file="/WEB-INF/inc/footer.jsp"%>
