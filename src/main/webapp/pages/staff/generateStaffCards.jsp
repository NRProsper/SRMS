<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>

<div>
  <main>
    <div class="main-cont">
      <div class="generate-card">
        <button class="btn btn-primary" onclick="printCards()">Print</button>
      </div>
      <hr />
      <div class="generated-cards mt-3 d-flex gap-2">
          <c:forEach var="staff" items="${staffList}">
            <div class="staff-card card ">
              <div class="card-header ">
                <div class="card-title text-center">
                  <h4>Staff Card</h4>
                </div>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <p><strong>Staff ID: </strong> <c:out value="${staff.id}" /></p>
                </div>
                <div class="form-group">
                  <p><strong>Staff Name: </strong> <c:out value="${staff.f_name}  ${staff.l_name}" /></p>
                </div>
                <div class="form-group">
                  <p><strong>Email: </strong> <c:out value="${staff.email}" /></p>
                </div>
                <div class="form-group">
                  <p><strong>Phone Number: </strong> <c:out value="${staff.phone}" /></p>
                </div>
              </div>
              <div class="card-footer">
                <h6>XYZ College Staff</h6>
              </div>
            </div>
          </c:forEach>
      </div>
    </div>
  </main>
</div>

<script>

  function printCards() {
    window.print()
  }

</script>



<%@ include file="/WEB-INF/inc/footer.jsp"%>