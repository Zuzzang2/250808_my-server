import com.google.genai.Client;
import com.google.genai.types.Content;
import com.google.genai.types.GenerateContentConfig;
import com.google.genai.types.Part;
import io.github.cdimascio.dotenv.Dotenv;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.checkerframework.checker.units.qual.C;

import java.io.IOException;

// [2]
@WebServlet("/") //express에서 app.get('/ai', (req, res) => { ... 와 같다.
public class AIServlet extends HttpServlet { // [1]
    // doGet,doPost

    // 경로에 들어갔을 때 (GET)
    @Override // [3]
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  //그냥 doGet 바로 자동완성 됨
        throws ServletException, IOException {
        Dotenv dotenv = Dotenv.load();
        String apikey = dotenv.get("GOOGLE_API_KEY"); // [7]
        // [8] resources 안에 .env를 꼭 만들어야함.

        Client client = Client.builder()
                        .apiKey(apikey).build(); // [9]
        String data = client.models.generateContent(
                "gemini-2.0-flash", "오늘 저녁 메뉴 추천해줘. 마크다운 혹은 꾸미는 문법 없이 평문으로 100자 이내로 결과만 작성해줘.", null).text(); // [10]

//        req.setAttribute("data", "안녕하세요 반갑습니다!"); // [6]
        req.setAttribute("data", data); // [11]
        req.setAttribute("question", "오늘 저녁 메뉴 추천해줘"); // [question attribute 대응]


        RequestDispatcher dispatcher = req.getRequestDispatcher(
                "/WEB-INF/ai.jsp");
        dispatcher.forward(req, resp); // [4]
        // [5] WEB-INF -> ai.jsp
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 3)
        String question = req.getParameter("question"); //input/post => 파라미터


        // 2)
        Dotenv dotenv = Dotenv.load();
        String apikey = dotenv.get("GOOGLE_API_KEY");


        Client client = Client.builder()
                .apiKey(apikey).build();
        String data = client.models.generateContent("gemini-2.0-flash",
                        question, GenerateContentConfig.builder().systemInstruction(Content.builder()
                                .parts(Part.builder().text(
                                        "100자 이내로, 마크다운 없이 간결하게 평문으로."))).build()) // 4)
                .text(); // text를 불러와줌.
        req.setAttribute("data", data);
        req.setAttribute("question", question); // 5) input 에다 넣었던 것을 attribute로 재전달

        // 1)
        RequestDispatcher dispatcher = req.getRequestDispatcher(
                "/WEB-INF/ai.jsp");
        dispatcher.forward(req, resp);
    }
}
