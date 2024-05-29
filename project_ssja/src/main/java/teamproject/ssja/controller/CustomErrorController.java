package teamproject.ssja.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute("javax.servlet.error.status_code");
        String errorMessage = "에러가 발생했습니다.";
        
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            model.addAttribute("statusCode", statusCode);

            if (statusCode == 403) {
                errorMessage = "접근이 거부되었습니다.";
            } else if (statusCode == 404) {
                errorMessage = "유효한 페이지를 찾을 수 없습니다.";
            } 
        }
        
        model.addAttribute("errorMessage", errorMessage);
        return "error/error"; // 공통 에러 페이지
    }
}
