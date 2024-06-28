<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<%@ include file="/WEB-INF/inc/topNav.jsp"%>

<div id="add-staff-modal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header d-flex justify-content-between">
                <div class="modal-title">
                    <h3>Add Staff</h3>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/staff-list/add" method="post" class="row">
                    <div class="form-group col-sm-6 mb-3">
                        <label for="fname" class="form-label ">First name</label>
                        <span class="required">*</span>
                        <input type="text" name="fname" id="fname" class="form-control" required>
                    </div>
                    <div class="form-group col-sm-6 mb-3">
                        <label for="lname" class="form-label ">Last name</label>
                        <span class="required">*</span>
                        <input type="text" name="lname" id="lname" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <span class="required">*</span>
                        <input type="text" name="phone" id="phone" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="email" class="form-label">Email</label>
                        <span class="required">*</span>
                        <input type="email" name="email" id="email" class="form-control" required>
                    </div>
                    <div class="form-group mb-3 col-sm-6">
                        <label for="country" class="form-label">Country</label>
                        <span class="required">*</span>
                        <select name="country" id="country" class="form-select" required>
                            <option selected disabled>Select Country</option>
                        </select>
                    </div>
                    <div class="form-group mb-3 col-sm-6">
                        <label for="city" class="form-label">City</label>
                        <input type="text" name="city" id="city" placeholder="Ex: Kigali" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" name="address" id="address"  class="form-control" placeholder="Ex: Kigali, Nyarugenge, KN-ST 200">
                    </div>
                    <div class="mt-2">
                        <button type="submit" class="btn btn-success">Add</button>
                        <button type="reset" class="btn btn-primary">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="update-staff-modal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header d-flex justify-content-between">
                <div class="modal-title">
                    <h3>Update Staff</h3>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="<%=request.getContextPath()%>/staff-list/add" method="post" class="row">
                    <div class="form-group col-sm-6 mb-3">
                        <label for="ufname" class="form-label ">First name</label>
                        <span class="required">*</span>
                        <input type="text" name="fname" id="ufname" class="form-control" required>
                    </div>
                    <div class="form-group col-sm-6 mb-3">
                        <label for="ulname" class="form-label ">Last name</label>
                        <span class="required">*</span>
                        <input type="text" name="lname" id="ulname" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="uphone" class="form-label">Phone Number</label>
                        <span class="required">*</span>
                        <input type="text" name="phone" id="uphone" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="uemail" class="form-label">Email</label>
                        <span class="required">*</span>
                        <input type="email" name="email" id="uemail" class="form-control" required>
                    </div>
                    <div class="form-group mb-3 col-sm-6">
                        <label for="ucountry" class="form-label">Country</label>
                        <span class="required">*</span>
                        <select name="country" id="ucountry" class="form-select" required>
                            <option selected disabled>Select Country</option>
                        </select>
                    </div>
                    <div class="form-group mb-3 col-sm-6">
                        <label for="ucity" class="form-label">City</label>
                        <input type="text" name="city" id="ucity" placeholder="Ex: Kigali" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="uaddress" class="form-label">Address</label>
                        <input type="text" name="address" id="uaddress"  class="form-control" placeholder="Ex: Kigali, Nyarugenge, KN-ST 200">
                    </div>
                    <div class="mt-2">
                        <button type="submit" class="btn btn-warning">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div>
    <main>
        <div class="main-cont">
            <div class="staff-list">
                <div class="staff-top flex">
                    <h2 class="staff-list-title">Staff Lists</h2>
                    <button id="add-staff" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#add-staff-modal">
                        <i class="ph ph-bold ph-plus"></i>
                        Add new
                    </button>
                </div>
                <hr/>
                <div class="staff-cont" id="staff-cont-placeholder">
                    <div class="table-responsive">
                    <c:if test="${not empty staffList}">
                        <table id="staff-table">
                            <thead>
                            <tr>
                                <th>Names</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Created at</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="staff" items="${staffList}">
                                <tr>
                                    <td>
                                        <c:out value="${staff.f_name} ${staff.l_name}" />
                                    </td>
                                    <td>
                                        <c:out value="${staff.phone}" />
                                    </td>
                                    <td>
                                        <c:out value="${staff.email}" />
                                    </td>
                                    <td>
                                        <c:out value="${staff.created_at}" />
                                    </td>
                                    <td class="">
                                        <a href=""  class="edit edit-staff" data-staff-id="${staff.id}" data-bs-target="#update-staff-modal" data-bs-toggle="modal">
                                            <i class="ph ph-bold ph-note-pencil"></i>
                                            <span>Edit</span>
                                        </a>
                                        <a href="" id="" class="delete delete-staff" data-staff-id="${staff.id}">
                                            <i class="ph ph-bold ph-x-circle"></i>
                                            <span>Delete</span>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    </c:if>
                    <c:if test="${empty staffList}">
                        <div class="alert alert-warning">
                            <Strong>Error!</Strong>
                            <p>No Data Found in the Database.</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    const url = "https://restcountries.com/v3.1/all";

    let contextPath = "<%=request.getContextPath()%>";

    $(document).ready(function () {
        $(".delete-staff").on("click", function (e) {
            e.preventDefault();

            let id = $(this).data("staff-id");
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if(result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: contextPath+"/staff-list/delete",
                        data: {id: id},
                        success : function (response) {
                            console.log(response)
                            $(".staff-cont").html(response)
                        },
                        error: function (error) {
                            console.log(error)
                        }
                    })
                }
            })

        })
    })

    async function getCounties() {
        fetch(url)
            .then(response => response.json())
            .then(data => {
                // Get the select element
                const select = document.getElementById('country');

                data.forEach(country => {
                    const option = document.createElement('option');
                    option.value = country.name.common;
                    option.text = country.name.common;
                    select.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching countries:', error));
    }
    getCounties();

    $(document).ready(function () {
        $(".edit-staff").on("click", function (e) {
            e.preventDefault();


        })
    })



</script>




<%@ include file="/WEB-INF/inc/footer.jsp"%>