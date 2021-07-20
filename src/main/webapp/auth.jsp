<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authorization</title>
</head>
<body>
<jsp:include page="_header.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-4">
            <%
                if (request.getAttribute("authFail") != null) {
            %>

            <div class="alert alert-danger" role="alert">
                    <p>Invalid username or password. Please try again.</p>
            </div>

            <%
                }
            %>
            <form action="/auth" method="post">
                <div class="mb-3">
                    <label for="exampleInputText1" class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" id="exampleInputText1" required minlength="3" maxlength="12">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required minlength="8" maxlength="12">
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" name="saving" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <%
                if (request.getAttribute("auth") != null) {
            %>

            <div class="alert alert-success" role="alert">
                    <p>Welcome ${requestScope.auth}!</p>
            </div>

            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
