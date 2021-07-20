<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<jsp:include page="_header.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-4">
            <%
                if (request.getAttribute("fail") != null) {
            %>
            <div class="alert alert-warning" role="alert">
                <div class="row justify-content-center">
                    <p>This username is already in use. Please choose another one.</p>
                </div>
            </div>
            <%
                }
            %>
            <form action="/reg" method="post">
                <div class="mb-3">
                    <label for="exampleInputText1" class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" id="exampleInputText1" required minlength="3" maxlength="12">
                </div>
                <div class="mb-3">
                    <label for="exampleInputText2" class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" id="exampleInputText2" required minlength="3" maxlength="12">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required minlength="8" maxlength="12">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <%
                if (request.getAttribute("reg") != null) {
            %>

            <div class="alert alert-success" role="alert">
                <div class="row justify-content-center">
                    <p>Registration completed successfully!</p>
                </div>
            </div>

            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
