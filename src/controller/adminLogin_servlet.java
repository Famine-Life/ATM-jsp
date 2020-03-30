package controller;

import dao.userDao;
import entity.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "adminLogin",value = "/adminLogin")
public class adminLogin_servlet extends HttpServlet {

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

        //2.获取请求参数
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");    //密码
        System.out.println("登录username ,pwd:"+username+","+pwd);

        //3.判断账号密码是否正确
        try {
            userDao userDao = new userDao();
            UserInfo user = userDao.getUsersByUsername(username);
            if (user == null || !user.getPid().equals(pwd)) {
                out.write("0");
            }else{
                //存入session
                session.setAttribute("adminUser",user);
                out.write("1");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
