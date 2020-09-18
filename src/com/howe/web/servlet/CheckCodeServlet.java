package com.howe.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expries", String.valueOf(0));

        int width = 80;
        int heigth = 30;
        //创建一个对象，在内存中创建图片对象
        BufferedImage image = new BufferedImage(width,heigth,BufferedImage.TYPE_INT_RGB);
        //美化图片
        Graphics g = image.getGraphics();
        g.setColor(Color.lightGray);
        g.fillRect(0,0,width,heigth);

        g.setColor(Color.YELLOW);
        g.setFont(new Font("宋体",Font.BOLD,24));

        String strs = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        //生成随机角标
        Random ran = new Random();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 4; i++) {
            int index = ran.nextInt(strs.length());
            char ch = strs.charAt(index);
            sb.append(ch);

            g.drawString(ch+"",width / 5 * i,heigth / 2);
        }
        String checkCode_session = sb.toString();

        HttpSession session = request.getSession();
        session.setAttribute("checkCode_session",checkCode_session);

        //将图片输出到页面展示
        ImageIO.write(image,"jpg",response.getOutputStream());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

