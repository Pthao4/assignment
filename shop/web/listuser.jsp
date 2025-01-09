
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="header.jsp" %>s
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Student</title>
    </head>
    <body>
        <div class="container" style="margin-top: 150px">
            <h1 class="text-center mt-3 mb-3 text-primary">List Of User</h1>
            <table border ="1" class="table table-sm formTable text-center">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Full Name</th>
                        <th>Address</th>
                        <th>Birth Of Date</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userlist}" var="o">
                        <tr>
                            <td>${o.userName}</td>
                            <td>${o.fullName}</td>  
                            <td>${o.address}</td>  
                            <td>${o.formatBirthDate()}</td>  
                            <td>${o.phone}</td>  
                            <td>${o.email}</td>  
                            <td>
                                <button class="btn btn-success fw-bold pd-start-3" onclick="becomeAdmin('${user.userName}', '${o.userName}')">Administration</button>
                                <button class="btn btn-danger fw-bold pd-start-3" onclick="deleteUser('${user.userName}', '${o.userName}')">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>

    <script>
        function becomeAdmin(uid, did) {
            if (confirm("Remove this student?")) {
                window.location.href = "badmin?uid=" + uid + "&did=" + did;
            }
        }
        
        function deleteUser(uid, did) {
            if (confirm("Remove this student?")) {
                window.location.href = "udelete?uid=" + uid + "&did=" + did;
            }
        }
    </script>
</html>

<%@include file="footer.jsp" %>
