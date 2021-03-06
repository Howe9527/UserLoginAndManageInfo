package com.howe.web.servlet;

import com.howe.domain.PageBean;
import com.howe.domain.User;
import com.howe.service.UserService;
import com.howe.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findUserByPageServlet")
public class FindUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String currentPage = request.getParameter("currentPage");//当前页码
        String rows;//没有显示的条数

        if (currentPage == null || "".equals(currentPage)){
            currentPage = "1";
        }

        rows = "5";

        Map<String, String[]> condition = request.getParameterMap();


        UserService service = new UserServiceImpl();
        PageBean<User> pb =  service.findUserByPage(currentPage,rows,condition);

        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);
        request.getRequestDispatcher("/userList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
