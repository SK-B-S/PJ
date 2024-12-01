import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RegisterBean;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
  public void doPost(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    // ���N�G�X�g�̕����R�[�h�w��
    req.setCharacterEncoding("utf-8");
    
    // ���͏��̎擾
    String name = req.getParameter("name");
    String age = req.getParameter("age");
    String[] langs = req.getParameterValues("lang");
    res.setContentType("text/html;charset=utf-8");
    
    // Bean�̍쐬
    RegisterBean rb = new RegisterBean();
    rb.setName(name);
    rb.setAge(age);
    rb.setLangs(langs);
    
    // Bean�����N�G�X�g�Ɋi�[
    req.setAttribute("rb", rb);
    
    // register.jsp�փt�H���[�h
    RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
    rd.forward(req, res);
  }
  public void doGet(HttpServletRequest req, HttpServletResponse res)
      throws IOException, ServletException {
    doPost(req, res);
  }
}
