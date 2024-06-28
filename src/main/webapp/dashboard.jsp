<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./WEB-INF/inc/header.jsp"%>
<%@ include file="./WEB-INF/inc/sidebar.jsp"%>
<%@ include file="./WEB-INF/inc/topNav.jsp"%>

<div class="">
    <main>
        <div class="main-cont">
            <div class="main-welcome">
                <h1>Welcome</h1>
                <p>Navigate the future of education with Smart Education (SmartEd)</p>
            </div>

            <div class="info-cards animate__animated animate__fadeIn">
                <div class="info-card">
                    <div class="left">
                        <h3>Students</h3>
                        <p>
                            <c:out value="${studentsCount}" />
                        </p>
                    </div>
                    <div class="right">
                        <i class="ph ph-student"></i>
                    </div>
                </div>

                <div class="info-card">
                    <div class="left">
                        <h3>Subjects</h3>
                        <p>16</p>
                    </div>
                    <div class="right">
                        <i class="ph ph-chalkboard"></i>
                    </div>
                </div>

                <div class="info-card">
                    <div class="left">
                        <h3>Classes</h3>
                        <p>20k</p>
                    </div>
                    <div class="right">
                        <i class="ph ph-warehouse"></i>
                    </div>
                </div>

                <div class="info-card">
                    <div class="left">
                        <h3>Results Declared</h3>
                        <p>20k</p>
                    </div>
                    <div class="right">
                        <i class="ph ph-notebook"></i>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<%@ include file="./WEB-INF/inc/footer.jsp"%>