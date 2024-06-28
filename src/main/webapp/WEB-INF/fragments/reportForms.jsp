<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="report" items="${reportList}">
    <table>
        <thead>
        <tr>
            <td colspan="7">
                <div>
                    <h2>MINEDUC SCHOOL MANAGEMENT</h2>
                    <h3>XYZ COLLEGE</h3>
                    <h3 class="class-level">
                        <c:out value="${report.classLevel}" /> ORDINARY LEVEL
                    </h3>
                </div>
                <div class="border rounded-2 p-2 text-center my-2">
                    <h1>PROGRESSIVE REPORT FORM</h1>
                </div>
                <hr />
                <div>
                    <h2>
                        NAMES: <c:out value="${report.studentName}" />
                    </h2>
                </div>
                <div>

                </div>
            </td>
        </tr>
        <tr>
            <th rowspan="3">SUBJECTS</th>
            <th colspan="3" rowspan="2">MAX POINTS</th>
            <th colspan="3">Term 1</th>

        </tr>
        <tr>
            <th colspan="3">O.P</th>
        </tr>
        <tr class="">
            <th colspan="">CAT</th>
            <th colspan="">EXAM</th>
            <th colspan="">TOT</th>
            <th colspan="">CAT</th>
            <th colspan="">EXAM</th>
            <th colspan="">TOT</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>Sub 1</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 2</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 3</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 4</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 1</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 2</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 3</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Sub 4</td>
            <td>50</td>
            <td>50</td>
            <td>100</td>
            <td>44</td>
            <td>36</td>
            <td>80</td>
        </tr>
        </tbody>
    </table>
</c:forEach>