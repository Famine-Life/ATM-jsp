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
 * 处理输入密码的登录逻辑
 */
@WebServlet(name = "login_servlet",value = "/login_servlet")
public class login_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        Object sec_cardInfo = session.getAttribute("sec_cardInfo");
        System.out.println("session测试:"+sec_cardInfo);

        //2.获取请求参数
        String cardId = request.getParameter("cardId");
        String pwd = request.getParameter("password");    //密码

        try{
            //调用dao通过id获取数据库密码与用户输入密码比较
            cardDao cardDao = new cardDao();
            CardInfo card = cardDao.getCardById(cardId);
            if(card.getPassword().equals(pwd)){
                //密码相同, 返回success
                out.write("success");
                //存入session
                session.setAttribute("sec_cardInfo",card);
                System.out.println("登录成功！");
                System.out.println("卡号，密码:"+cardId+","+pwd);
            }else{
                //密码不同
                out.write("error");
                System.out.println("密码错误!");
                System.out.println("卡号，密码:"+cardId+","+pwd);
            }
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
