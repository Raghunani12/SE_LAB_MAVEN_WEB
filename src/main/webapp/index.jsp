<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        form {
            display: inline-block;
            text-align: left;
        }
        input, select, button {
            margin: 5px 0;
            padding: 8px;
            width: 100%;
        }
    </style>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form action="index.jsp" method="post">
        <label>First Number:</label>
        <input type="number" name="num1" required>
        <br>
        <label>Second Number:</label>
        <input type="number" name="num2" required>
        <br>
        <label>Operation:</label>
        <select name="operation" required>
            <option value="add">Addition</option>
            <option value="subtract">Subtraction</option>
            <option value="multiply">Multiplication</option>
            <option value="divide">Division</option>
        </select>
        <br>
        <button type="submit">Calculate</button>
    </form>

    <h2>Result:</h2>
    <p>
        <% 
            // Get input parameters
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");
            String operation = request.getParameter("operation");
            
            if (num1Str != null && num2Str != null && operation != null) {
                try {
                    double num1 = Double.parseDouble(num1Str);
                    double num2 = Double.parseDouble(num2Str);
                    double result = 0;
                    
                    switch (operation) {
                        case "add":
                            result = num1 + num2;
                            break;
                        case "subtract":
                            result = num1 - num2;
                            break;
                        case "multiply":
                            result = num1 * num2;
                            break;
                        case "divide":
                            if (num2 != 0) {
                                result = num1 / num2;
                            } else {
                                out.println("Division by zero is not allowed.");
                                return;
                            }
                            break;
                    }
                    out.println("The result is: " + result);
                } catch (NumberFormatException e) {
                    out.println("Invalid input. Please enter valid numbers.");
                }
            } else {
                out.println("Please enter the numbers and select an operation.");
            }
        %>
    </p>
</body>
</html>
