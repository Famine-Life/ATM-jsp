package controller;

import dao.cardDao;
import entity.CardInfo;
import entity.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;

@WebServlet(name = "admin",value = "/admin")
public class admin_servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserInfo adminUser = (UserInfo)session.getAttribute("adminUser");
        if(adminUser==null){
            out.write("请先登录!");
            return;
        }

        String method = request.getParameter("method");
        String cardId = request.getParameter("cardId");
        String money = request.getParameter("money");
        String password = request.getParameter("password");
        System.out.println(method+","+cardId+","+money+","+password);
        CardInfo card = new CardInfo();
        card.setCardId(cardId);
        card.setPassword(password);
        card.setMoney(money);
        card.setCustomerId(adminUser.getCustomerId());
        card.setOpenDate(new Timestamp(System.currentTimeMillis()));

        cardDao cardDao = new cardDao();
        if(method.equals("edit")){
            //更新操作
            try{
                cardDao.updateCard(card);
                out.write("更新成功!");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        if (method.equals("delete")){
            //删除操作
            try{
                boolean b = cardDao.deleteCard(cardId);
                if(b){
                    out.write("删除失败!");
                }else {
                    out.write("删除成功!");

                }

            }catch (Exception e){
                e.printStackTrace();
            }

        }
        if(method.equals("new")){
            //新建操作
            try{
                cardDao.addCard(card);
                out.write("新加银行卡成功!");
            }catch (Exception e){
                e.printStackTrace();
            }

        }

    }
}
