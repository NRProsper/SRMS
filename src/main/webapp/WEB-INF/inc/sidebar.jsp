<aside class="sidebar animate__animated animate__fadeIn">
  <div class="menu-hide">
    <i class="ph ph-bold ph-caret-left"></i>
  </div>
  <div class="head">
    <div class="brand-logo">
      <img src="<%=request.getContextPath()%>/resources/SRMS%20Logo.png" alt="SRMS Logo">
    </div>
    <div class="brand-title">
      <p class="title">SmartEd</p>
    </div>
  </div>
  <nav class="sidebar-nav">
    <div class="menu">
      <p class="title">Main</p>
      <ul>
        <li class="">
          <a href="<%=request.getContextPath()%>/dashboard">
            <i class="icon ph-bold ph-house-simple"></i>
            <span class="link-text">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="icon ph-bold ph-student"></i>
            <span class="link-text">Students</span>
            <i class="arrow ph-bold ph-caret-down"></i>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="<%=request.getContextPath()%>/register-student">
                <span class="link-text">Register new Student</span>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/students">
                <span class="link-text">View students</span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="link-text">Dismissed students</span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="link-text">Generate student cards</span>
              </a>
            </li>
          </ul>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/classes">
            <i class="icon ph-bold ph-house-line"></i>
            <span class="link-text">Classes</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="ph ph-bold ph-chalkboard"></i>
            <span class="link-text">Course</span>
            <i class="arrow ph-bold ph-caret-down"></i>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="<%=request.getContextPath()%>/course-category">
                <span class="link-text">Course Category</span>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/add-course">
                <span class="link-text">Create Course</span>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/manage-courses">
                <span class="link-text">Manage Course</span>
              </a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#">
            <i class="ph ph-bold ph-notebook"></i>
            <span class="link-text">Marks</span>
            <i class="arrow ph-bold ph-caret-down"></i>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="<%=request.getContextPath()%>/marks-entry">
                <span class="link-text">Marks Entry</span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="link-text">Uploaded Marks</span>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/generate-reports">
                <span class="link-text">Progressive Reports</span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="link-text">Term Results</span>
              </a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#">
            <i class="ph ph-bold ph-users-three"></i>
            <span class="link-text">Staff</span>
            <i class="arrow ph-bold ph-caret-down"></i>
          </a>
          <ul class="sub-menu">
<%--            <li>--%>
<%--              <a href="">--%>
<%--                <span class="link-text">Add new Staff</span>--%>
<%--              </a>--%>
<%--            </li>--%>
            <li>
              <a href="<%=request.getContextPath()%>/staff-list">
                <span class="link-text">View all staff</span>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/generate-staff-cards">
                <span class="link-text">Generate staff Cards</span>
              </a>
            </li>
            <li>
              <a href="#">
                <span class="link-text">Staff shifts</span>
              </a>
            </li>
          </ul>
        </li>

      </ul>
    </div>
  </nav>
</aside>