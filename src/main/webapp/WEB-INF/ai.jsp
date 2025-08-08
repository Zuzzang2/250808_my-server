<%@ page contentType="text/html; charset-UTF-8" pageEncoding="UTF-8" %>
<!-- [1] 한글사용 가능하게 설정 --!>
<!Document html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>내가 만든 쿠키</title>

        <!-- OG 태그(Open Graph 태그)는 웹페이지를 **SNS나 메신저에서 링크로 공유할 때 미리보기 정보(썸네일, 제목, 설명 등)**를 보여주기 위해 사용하는 메타태그야.--!>
        <meta property="og:title" content="너를 위해 구웠지">
        <meta property="og:description" content"Gemini 2.0 Flash로 구현한 챗봇">

        <style>
            @font-face {
                font-family: 'NEXON Lv1 Gothic OTF';
                src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
                font-weight: normal;
                font-style: normal;
        }
        body {
            font-family: 'NEXON Lv1 Gothic OTF';
        }
        </style>


    </head>

    <body>

        <h2>야호</h2>

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
