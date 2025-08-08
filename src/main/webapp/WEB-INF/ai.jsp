<%@ page contentType="text/html; charset-UTF-8" pageEncoding="UTF-8" %>
<!-- [1] 한글사용 가능하게 설정 --!>
<!Document html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>야호</title>
    </head>
    <body>

        <h2>AI 최고야!</h2>

        <p>
            질문 : <%= request.getAttribute("question") %>
        </p>

        <p>
            <!-- [2] req(request)안에 set된 'data'라는 attribute가 있다면 출력--!>
            <%= request.getAttribute("data") %> <!-- 값을 출력해주는 문법 --!>
        </p>

        <!-- 1) --!>
        <form method="post">
            <input name="question">
            <button>질문하기</button>
        </form>

    </body>
</html>
