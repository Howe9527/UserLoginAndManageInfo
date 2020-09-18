package com.howe.web.servlet;

import com.howe.domain.Admin;
import com.howe.domain.User;
import com.howe.service.UserService;
import com.howe.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //验证码
        String verifycode = request.getParameter("verifycode");
        HttpSession session = request.getSession();
        //校验验证码
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        session.removeAttribute("checkCode_session");
        if (!checkCode_session.equalsIgnoreCase(verifycode)){
            //验证码不正确，提示信息，跳转到登录界面
            request.setAttribute("login_error","验证码错误！");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

        Map<String, String[]> map = request.getParameterMap();
        //封装Admin对象
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        UserService service = new UserServiceImpl();

        Admin loginAdmin = service.login(admin);
        if(loginAdmin != null){
            //登录成功
            response.sendRedirect(request.getContextPath()+"/findUserByPageServlet");
        }else {
            request.setAttribute("login_error","用户名或密码错误！");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
