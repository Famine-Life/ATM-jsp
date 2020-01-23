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
        System.out.println("操作："+method+",money:"+money+",to_卡号:"+to_cardId);



        try{
            cardDao cardDao = new cardDao();
            //调用dao通过id获得卡号信息
            CardInfo card = cardDao.getCardById(cardId);

            //查询余额
            if(method.equals("chaxun")){
                response.setContentType("application/json; charset=utf-8");     //返回json
                PrintWriter out_cx = response.getWriter();

                Integer prestore = card.getPrestore();//预存金额
                String allMoney = card.getMoney();   //全部余额
                Integer usable = Integer.valueOf(allMoney)-prestore;    //可用金额

                //拼接json  {"code":"success","allMoney":allMoney,"usable":usable}
                String result = "{\"code\":" + "\"success\""+","+"\"allMoney\":"+"\""+ allMoney + "\"" +","+"\"usable\":"+"\""+usable+"\""+"}";
                System.out.println("result json:"+result);
                out_cx.write(result);
                System.out.println("查询余额--全部金额为："+allMoney+"，可用金额："+usable);

                out_cx.close();
            }

            //所有操作金额的都应该在密码匹配的情况下
            if(card.getPassword().equals(pwd)){

                //取款功能
                if(method.equals("qukuan")){
                    //如果为取款操作，确认密码正确，然后卡号扣除金额，成功返回success

                    //减去要取得金额
                    Integer update_money=Integer.valueOf(card.getMoney())-Integer.valueOf(money);
                    card.setMoney(update_money.toString());
                    //匹配密码
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

                //转账功能
                if(method.equals("zhuanzhang")){
                    String zz_cardId = card.getCardId();
                    String card_money = card.getMoney();
                    //转账money
                    if(Integer.valueOf(card_money)>Integer.valueOf(money)){
                        Integer card_update_money = Integer.valueOf(card_money) - Integer.valueOf(money);
                        card.setMoney(card_update_money.toString());
                        //扣除账户金额
                        cardDao.updateCard_money(card);
                        //更新session
                        session.setAttribute("sec_cardInfo",card);

                        //转入账户
                        CardInfo to_card=cardDao.getCardById(to_cardId);
                        Integer to_card_update_money = Integer.valueOf(to_card.getMoney()) + Integer.valueOf(money);
                        to_card.setMoney(to_card_update_money.toString());
                        cardDao.updateCard_money(to_card);

                        System.out.println("转账完成：");
                        System.out.println("转出卡号："+zz_cardId);
                        System.out.println("转入卡号："+to_cardId);
                        System.out.println("转账金额："+money);

                        out.write("success");

                    }else{
                        System.out.println("余额不足！");
                        out.write("buzu");
                    }

                }


            }else{
                //密码不同
                out.write("error");
                System.out.println("密码错误!");
                System.out.println("卡号，密码:"+cardId+","+pwd);
            }


        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (out != null) {
                out.close();
            }
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
