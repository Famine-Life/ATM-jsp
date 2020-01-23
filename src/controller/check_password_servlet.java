package controller;

import dao.cardDao;
import entity.CardInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 检查密码, 正确返回"success", 错误返回"error"
 */
@WebServlet(name = "check_password_servlet",value = "/check_password_servlet")
public class check_password_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        //2.获取请求参数
        String cardId = request.getParameter("cardId");
        String method = request.getParameter("method");
        String pwd = request.getParameter("password");    //密码
        try{
            if(method.equals("changePwd")){
                cardDao cardDao = new cardDao();
                CardInfo card = cardDao.getCardById(cardId);

                if(card.getPassword().equals(pwd)){
                    out.write("success");
                }else{
                    out.write("error");
                    System.out.println("密码错误!");
                }
            }
        }catch (Exception e){

        }finally {
            out.close();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
