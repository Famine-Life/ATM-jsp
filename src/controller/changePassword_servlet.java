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

@WebServlet(name = "changePassword_servlet",value = "/changePassword_servlet")
public class changePassword_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        //2.获取请求参数
        String cardId = request.getParameter("cardId");
        String new_pwd = request.getParameter("new_password");//新密码

        try{
            cardDao cardDao = new cardDao();
            CardInfo card = cardDao.getCardById(cardId);

            card.setPassword(new_pwd);
            cardDao.updateCard_pwd(card);
            out.write("success");
            System.out.println("密码修改成功!");


        }catch (Exception e){
            e.printStackTrace();
        }finally{
            out.close();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
