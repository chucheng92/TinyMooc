package com.tinymooc.handler.attention.controller;

/**
 * Created by 哓哓 on 2015/12/1 0001.
 */


import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tinymooc.common.domain.Attention;
import com.tinymooc.common.domain.Level;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.attention.service.AttentionService;
import com.tinymooc.handler.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 与Service方法相对应
 */
@Controller
public class AttentionController {

    @Autowired
    private UserService userService;
    @Autowired
    private AttentionService attentionService;

    // 添加关注
    @RequestMapping("addAttention.htm")
    public void addAttention(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // FIXME
        System.out.println("================addAttention.htm被执行==============");
        PrintWriter pw = response.getWriter();

        String userBid = request.getParameter("userBid");
        User user = (User)request.getSession().getAttribute("user");
        if (user == null) {
            pw.print("login");
            pw.close();
            return;
        }
        String userAid = user.getUserId();

        // FIXME
        System.out.println("============用户A="+userAid+" "+"用户B="+userBid+"==================");


        if (attentionService.isAlreadyAttention(userAid, userBid)) {
            // 关注了返回true
            pw.print("true");//以什么方式显示关注成功
        } else {
            // FIXME
            System.out.println("userAid="+userAid+" "+"userBid="+userBid);

            // 没有关注就关注 并返回false
            attentionService.addAttention(userAid, userBid);
            pw.print("false");
        }
        pw.close();
    }

    // 添加关注
    @RequestMapping("addAttention1.htm")
    public ModelAndView addAttention1(HttpServletRequest request) throws Exception {

        // FIXME
        System.out.println("================addAttention1.htm被执行==========");
        String userBid = request.getParameter("userBid");
        String userAid = request.getSession().getAttribute("userId").toString();
        if (userAid == null) {
            attentionService.addAttention(userAid, userBid);

            return new ModelAndView("redirect:myFans.htm");
        }

        return new ModelAndView("/login/login");
    }


    // 取消关注
    @RequestMapping("delAttention.htm")
    public void delAttention(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // FIXME
        System.out.println("================delAttention.htm被执行==========");
        PrintWriter pw = response.getWriter();

        String userBid = request.getParameter("userBid");
        User user = (User)request.getSession().getAttribute("user");
        String userAid = user.getUserId();

        attentionService.delAttention(userAid, userBid);
        pw.write("delOk");

        pw.close();

    }

    // 取消关注
    @RequestMapping("delAttention1.htm")
    public ModelAndView delAttention1(HttpServletRequest request) {
        System.out.println("================delAttention1.htm被执行==========");
        String type = request.getParameter("type");

        String userBid = request.getParameter("userBid");

        String userAid = request.getSession().getAttribute("userId").toString();
        attentionService.delAttention(userAid, userBid);

        if (type.equals("1")) {
            return new ModelAndView("redirect:myFans.htm");
        } else if (type.equals("0")) {
            return new ModelAndView("redirect:myAttention.htm");
        }

        return new ModelAndView("redirect:myAttention.htm");

    }

    // 我的关注列表
    @RequestMapping("myAttention.htm")
    public ModelAndView myAttention(HttpServletRequest request) throws Exception {
        System.out.println("================myAttention.htm被执行==========");
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            return new ModelAndView("/login/login");
        } else {
            int credit = user.getCredit();
            // FIXME
            System.out.println("==================credit=================" + credit);
            Level level = userService.getUserLevel(credit);
            request.setAttribute("level", level);
            List<Attention> list = attentionService.queryAttention(user.getUserId());
            request.setAttribute("sum", list.size());

            return new ModelAndView("/attention/myAttention", "list", list);
        }
    }

    // 我的粉丝列表
    @RequestMapping("myFans.htm")
    public ModelAndView myFans(HttpServletRequest request) throws Exception {
        // FIXME
        System.out.println("================myFans.htm被执行==========");
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return new ModelAndView("/login/login");
        } else {
            int credit = user.getCredit();
            // FIXME
            System.out.println("==================credit=================" + credit);

            Level level = userService.getUserLevel(credit);
            request.setAttribute("level", level);
            List<Attention> fansList = attentionService.queryFans(user.getUserId());

            request.setAttribute("sum", fansList.size());
            return new ModelAndView("/attention/myFans", "fansList", fansList);
        }
    }

}

