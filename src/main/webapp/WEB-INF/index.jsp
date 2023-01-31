<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Save Travels</title>
</head>
<body>
<h1>Save Travels</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Expense</th>
        <th scope="col">Vendor</th>
        <th scope="col">Amount</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <c:forEach var="travel" items="${travel}">
        <tr>
            <td> <a href="expenses/${travel.id}"><c:out value="${travel.expense}"></c:out> </a> </td>
            <td> <c:out value="${travel.vendor}"></c:out> </td>
            <td> $ <c:out value="${travel.amount}"></c:out> </td>
            <td> <a href="/expenses/edit/${travel.id}">edit</a>
                <form:form action="/expenses/${travel.id}" method="delete">
                    <button class="btn btn-link">Delete</button>
                </form:form>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="/expenses/new">Add a new Expense</a></body>
</html>