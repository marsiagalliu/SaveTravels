<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add an expense</title>
</head>
<body>
<h1>Add an expense</h1>
<%--@elvariable id="travel" type="java"--%>
<form:form action="/expenses" method="post" modelAttribute="travel">
    <p>
        <form:label path="expense">Expense Name</form:label>
        <form:errors path="expense" class="text-danger"/>
        <form:input path="expense"/>
    </p>
    <p>
        <form:label path="vendor">Vendor</form:label>
        <form:errors path="vendor" class="text-danger"/>
        <form:input path="vendor"/>
    </p>
    <p>
        <form:label path="amount">Amount</form:label>
        <form:errors path="amount" class="text-danger"/>
        <form:input type="number" step="0.01" path="amount"/>
    </p>
    <p>
        <form:label path="description">Notes</form:label>
        <form:errors path="description" class="text-danger"/>
        <form:textarea  path="description"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>