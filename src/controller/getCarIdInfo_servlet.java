package controller;

import dao.cardDao;
import entity.CardInfo;
import sun.plugin.dom.core.Element;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 验证账号是否存在，符合格式
 */
@WebServlet("/getCardIdInfo_servlet")
public class getCarIdInfo_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        //2.获取请求参数
        String method = request.getParameter("method");
        String cardID = request.getParameter("cardId");
        System.out.println("method:"+method+" ,cardID:"+cardID);
        try{
            if (method.equals("comfirmCardID")){
                boolean b = checkCardID(cardID);    //检查cardID格式
                System.out.println(b);
                if (b){
                    //检查cardID是否存在
                    if(ifExists(cardID)){
                        //跳转到输入密码
                        //response.sendRedirect(request.getContextPath()+"/inputLoginPWD.jsp");
                        //request.getRequestDispatcher("inputLoginPWD.jsp").forward(request,response);
                        System.out.println("卡号存在，返回200");
                        out.write("200");

                        //存session
                        HttpSession session=request.getSession();
                        CardInfo card = new CardInfo();
                        card.setCardId(cardID);
                        session.setAttribute("sec_cardInfo",card);
                    }else{
                        System.out.println(cardID+"卡号不存在！");
                        out.write("卡号不存在！");
                    }
                }else{
                    out.write("账号格式不正确！");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * 判断账号是否存在
     * @param cardID
     * @return
     */
    public boolean ifExists(String cardID) throws SQLException {
        //调用dao层，根据id查询数据库
        cardDao cardDao = new cardDao();
        //System.out.println("card obj:"+cardDao.getCardById(cardID));
        CardInfo card = cardDao.getCardById(cardID);
        return  card.getCardId()!= null;     //返回true or false
    }

    /**
     * 判断账号是否符合格式要求
     * @param cardID
     * @return
     */
    public boolean checkCardID(String cardID){
        //卡号为数字，
        String regex ="[0-9]{15,20}";
        Pattern pattern = Pattern.compile(regex);
        Matcher isNum = pattern.matcher(cardID);
        if (!isNum.matches()){
            //不是数字返回false
            return false;
        }
        return true;
    }

}
