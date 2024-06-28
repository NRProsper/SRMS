<%--
  Created by IntelliJ IDEA.
  User: PROSPER
  Date: 1/23/2024
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Student Report</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/libs/animate.min.css">
    <script src="<%=request.getContextPath()%>/resources/js/jQuery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">

</head>
<body>

<header class="header">
    <nav class="d-flex justify-content-between">
        <a href="<%= request.getContextPath() %>/" class="logo">
            <img src="<%= request.getContextPath() %>/resources/SRMS%20Logo.png" alt="Logo">
            <span>SRMS</span>
        </a>
        <ul class="d-flex">
            <li><a href="<%= request.getContextPath() %>/">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="<%=request.getContextPath()%>/get-report">Student Reports</a></li>
            <li><a href="#">Contact us</a></li>
        </ul>
    </nav>
</header>

<div class="report-generator">
    <div class="left">
        <div class="form-group">
            <label for="id" class="form-label">Student Id</label>
            <input type="text" name="id" id="id" class="form-control">
            <button class="btn btn-sm btn-primary mt-2" id="get-report">Get report</button>
            <button class="btn btn-sm btn-success mt-2 d-none" id="download">Download</button>
        </div>
    </div>
    <div class="right">
        <div id="report-placeholder">

        </div>
    </div>
</div>

<script>

    function showLoader() {
        $("#report-placeholder").html(`
                <div class="d-flex justify-content-center">
                            <div class="spinner-border m-5">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
            `)
    }

    function showWarning() {
        $("#report-placeholder").html(`
        <div class="alert alert-warning">
                <strong>Warning!</strong>
                <p>Class Id does not Exists</p>
            </div>`)
    }

    function printReport() {
        let reportForm = $("#report-placeholder").html();

        let printableContent = $("#report-placeholder").html();

        let windowRep = window.open('', '_blank');

        windowRep.document.write('<html><head><title>Printable Report</title>');

        windowRep.document.write('<style>');
        windowRep.document.write('table { width: 100%; border: 1px solid #000; border-collapse: collapse; text-align: center; }');
        windowRep.document.write('tr, td, th { border: 1px solid #000; padding: 8px; transition: all 0.3s ease; }');
        windowRep.document.write('tbody tr:nth-child(odd) { background: rgba(218, 218, 218, 0.46); }');
        windowRep.document.write('tbody tr:hover { background: rgba(255, 204, 229, 0.68); }');
        windowRep.document.write('</style>');

        windowRep.document.write('</head><body>');
        windowRep.document.write(printableContent);
        windowRep.document.write('</body></html>');

        // Close the document for further modifications
        windowRep.document.close();

        // Print the content
        windowRep.print();
    }

    function  calculatePercentage(mark, total) {
        let percentage = ((mark*100)/(total*2)).toFixed(2)
            return percentage
    }

    let contextPath = "<%=request.getContextPath()%>"
    $(document).ready(function () {
        $("#get-report").on("click", function (e) {
            let id = $("#id").val()

            $.ajax({
                type : "GET",
                url : contextPath+"/generate-report/student-report",
                data : {id: id},
                beforeSend : function () {
                    $("#download").addClass("d-none")
                    $("#report-placeholder").html("")
                    // showLoader()
                },
                success : function (response) {
                    let data = JSON.parse(response)
                    if (data && data.length) {
                        let courses = data[0].courses;
                        let student = data[0].student;
                        console.log(courses);
                        generateReport(student, courses);
                        $("#download").removeClass("d-none")
                        $("#download").on("click", function () {
                            printReport()
                        })
                    } else {
                        showWarning();
                    }
                },
                error : function (error) {
                    console.log(error)
                }
            })
            function generateReport(student, courses) {
                let table = $('<table>').addClass('table-bordered my-4');
                let thead = $('<thead>')
                thead.append('<tr><td colspan="7"><div><h4>MINEDUC SCHOOL MANAGEMENT</h4><h4>XYZ COLLEGE</h4><h4 class="class-level">' + student.classLevel + ' ORDINARY LEVEL</h4></div><div class="border rounded-2 p-2 text-center my-2"><h1>PROGRESSIVE REPORT FORM</h1></div><hr /><div><h4>Names: ' + student.studentName + '</h4></div><div></div></td></tr><tr><th rowspan="3">SUBJECTS</th><th colspan="3" rowspan="2">MAX POINTS</th><th colspan="3">Term 1</th></tr><tr><th colspan="3">O.P</th></tr><tr class=""><th colspan="">CAT</th><th colspan="">EXAM</th><th colspan="">TOT</th><th colspan="">CAT</th><th colspan="">EXAM</th><th colspan="">TOT</th></tr></thead>')
                let tbody = $('<tbody>')

                let marksTotal = 0
                let catTotal = 0
                let examTotal = 0
                let maxTotal = 0

                $.each(courses, function (index, course) {
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

                $("#report-placeholder").append(table);
            }
        })
    })
</script>



<script src="<%=request.getContextPath()%>/resources/js/jQuery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap/bootstrap.bundle.js"></script>
</body>
</html>