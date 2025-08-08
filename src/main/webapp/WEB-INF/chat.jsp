<%@ page contentType="text/html; charset-UTF-8" pageEncoding="UTF-8" %>
<!Document html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>야호</title>
    </head>
    <body>

    <h2>AI 채팅 레추고</h2>
    <p>
        <%= request.getAttribute("saying") %>
    </p>
    <p>
        이름 : <%= request.getAttribute("name") %>
    </p>
    </body>
</html>
