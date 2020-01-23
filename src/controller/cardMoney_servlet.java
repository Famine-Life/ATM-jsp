package controller;

import dao.cardDao;
import entity.CardInfo;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

/**
 * 处理所有操作金额的请求
 */
@WebServlet(name = "cardMoney_servlet",value = "/cardMoney_servlet")
public class cardMoney_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

//        Object sec_cardInfo = session.getAttribute("sec_cardInfo");
//        System.out.println("session测试:"+sec_cardInfo);

        //2.获取请求参数
        String cardId = request.getParameter("cardId");
        String pwd = request.getParameter("password");    //密码
        String method = request.getParameter("method");
        String money = request.getParameter("money");
        String to_cardId = request.getParameter("to_cardId");
        System.out.println("操作："+method+"money:"+money+"to_卡号:"+to_cardId);

        try{
            //取款功能
            if(method.equals("qukuan")){
                //如果为取款操作，确认密码正确，然后卡号扣除金额，成功返回success
                //调用dao通过id获取数据库密码与用户输入密码比较
                cardDao cardDao = new cardDao();
                CardInfo card = cardDao.getCardById(cardId);
                //减去要取得金额
                Integer update_money=Integer.valueOf(card.getMoney())-Integer.valueOf(money);
                card.setMoney(update_money.toString());
                if(card.getPassword().equals(pwd)){
                    //密码相同, 扣除金额
                    cardDao.updateCard_money(card);
                    out.write("success");
                    System.out.println("取款"+money+"成功！");
                }else{
                    //密码不同
                    out.write("error");
                    System.out.println("密码错误!");
                    System.out.println("卡号，密码:"+cardId+","+pwd);
                }

            }

        }catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
