<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- [1] 한글사용 가능하게 설정 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내가 만든 챗봇</title>

    <!-- OG 태그: SNS 공유 미리보기 정보 -->
    <meta property="og:title" content="내가 만든 쿠키">
    <meta property="og:description" content="너를 위해 구웠지">

    <style>
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON%20Lv1%20Gothic%20OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'NEXON Lv1 Gothic OTF';
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        p {
            margin: 10px 0;
            color: #444;
        }

        input {
            padding: 10px;
            width: 80%;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #5c7cfa;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background-color: #4263eb;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>🙋질문하세요</h2>

        <p>질문: <%= request.getAttribute("question") %></p>
        <p>답변: <%= request.getAttribute("data") %></p>

        <form method="post">
            <input name="question" placeholder="질문을 입력하세요">
            <br>
            <button>질문하기</button>
        </form>
    </div>
</body>
</html>
