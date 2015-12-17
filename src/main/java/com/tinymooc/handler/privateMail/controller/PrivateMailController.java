package com.tinymooc.handler.privateMail.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tinymooc.authority.annotation.CheckAuthority;
import com.tinymooc.common.domain.Level;
import com.tinymooc.common.domain.Message;
import com.tinymooc.common.domain.User;
import com.tinymooc.common.tag.pageTag.PageHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tinymooc.handler.privateMail.PrivateMailService;
import com.tinymooc.handler.register.service.UserRegisterService;
import com.tinymooc.handler.user.service.UserService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PrivateMailController {

    @Autowired
    private PrivateMailService privateMailService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserRegisterService userRegisterService;

    //	@CheckAuthority(name="查看私信")
    @RequestMapping("goPrivateMail.htm")
    public ModelAndView goPrivateMail(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        //我发送的
        Criteria criteria = privateMailService.getCurrentSession().createCriteria(Message.class);
        criteria.add(Restrictions.eq("userByReceiverId", user));
        criteria.addOrder(Order.desc("sendDate"));
        criteria.setProjection(Projections.projectionList().add(Projections.groupProperty("userBySenderId"))
                .add(Projections.property("sendDate")).add(Projections.property("messageState")));

        List<Object> mailList = new ArrayList<Object>();
        // FIXME
        System.out.println("===================criteria.list()="+criteria.list());

        for (Object o : criteria.list()) {
            Object[] array = (Object[]) o;
            mailList.add(array);
        }
        int credit = user.getCredit();
        // FIXME
        System.out.println("================credit================" + credit);
        Level level = userService.getUserLevel(credit);
        System.out.println("===============level.title&level.lv="+level.getTitle()+" "+level.getLv());

        int mailNum = mailList.size();
        request.setAttribute("level", level);
        request.setAttribute("mailNum", mailNum);
        request.setAttribute("mailList", mailList);
        return new ModelAndView("/privateMail/mailList");
    }

    @RequestMapping("goSendMail.htm")
    public ModelAndView goSendMail(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        int credit = user.getCredit();

        // FIXME
        System.out.println("===========credit=============" + credit);
        Level level = userService.getUserLevel(credit);
        return new ModelAndView("/privateMail/sendMail", "level", level);
    }

//    @RequestMapping("goSendMail1.htm")
//    public ModelAndView goSendMail1(HttpServletRequest request) throws Exception {
//        String nickname = request.getParameter("userName");
//
//
//        request.setAttribute("nickname", nickname);
//
//        return new ModelAndView("/privateMail/sendMail");
//    }

    @RequestMapping("checkUsedName.htm")
    public String checkUsedNick1(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userName = ServletRequestUtils.getStringParameter(request, "userName");
        User user = (User)request.getSession().getAttribute("user");
        // FIXME
        System.out.println("============进入checkUsedName==================");
        System.out.println("==================userName="+userName);

        PrintWriter out = null;
        String result = null;
        out = response.getWriter();
        if (user.getUserName().equals(userName)) {
            // FIXME
            System.out.println("==========info_yourself===============");

            result = "info_yourself";
        } else if (userName.equals("请填写对方的用户名")) {
            // FIXME
            System.out.println("==========info_default===============");
            result = "info_default";
        } else if  ((userRegisterService.checkUserName(userName)) != 0) {
            // FIXME
            System.out.println("==========info_registered===============");

            result = "info_registered";
            System.out.println(result);
        } else {
            // FIXME
            System.out.println("==========info_no_such_person===============");
            result = "info_no_such_person";
        }
        out.print(result);
        return null;
    }

    @CheckAuthority(name = "用户发送私信")
    @RequestMapping("sendMail.htm")
    public ModelAndView sendMail(HttpServletRequest request, HttpServletResponse response) {

        String name = request.getParameter("userName");

        DetachedCriteria dCriteria = DetachedCriteria.forClass(User.class);
        dCriteria.add(Restrictions.eq("userName", name));

        User receiver = privateMailService.queryAllOfCondition(User.class, dCriteria).get(0);

        User sender = (User) request.getSession().getAttribute("user");
        String context = request.getParameter("context");

        // FIXME
        System.out.println("receiver" + receiver + "sender" + sender + "context" + context);
        Message message = new Message();
        message.setMessageId(UUIDGenerator.randomUUID());
        message.setMessageState("未读");
        message.setSendDate(new Date());
        message.setContent(context);
        message.setUserByReceiverId(receiver);
        message.setUserBySenderId(sender);
        privateMailService.save(message);
        return new ModelAndView("redirect:goPrivateMail.htm");
    }

//    @RequestMapping("sendMail1.htm")
//    public ModelAndView sendMail1(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//        String nickname = request.getParameter("userName");
//
//
//        System.out.println(nickname);
//
//        DetachedCriteria dCriteria = DetachedCriteria.forClass(User.class);
//        dCriteria.add(Restrictions.eq("nickname", nickname));
//
//        User receiver = privateMailService.queryAllOfCondition(User.class, dCriteria).get(0);
//
//        User sender = (User) request.getSession().getAttribute("user");
//        String context = request.getParameter("context");
//
//
//        System.out.println("receiver" + receiver + "sender" + sender + "context" + context);
//        Message message = new Message();
//        message.setMessageId(UUIDGenerator.randomUUID());
//        message.setMessageState("未读");
//        message.setSendDate(new Date());
//        message.setContent(context);
//        message.setUserByReceiverId(receiver);
//        message.setUserBySenderId(sender);
//        privateMailService.save(message);
//        return new ModelAndView("redirect:getDetail.htm", "userId", receiver.getUserId());
//    }

    @RequestMapping("deleteMail.htm")
    public ModelAndView deleteMail(HttpServletRequest request) {

        String messageId = request.getParameter("messageId");

        privateMailService.deleteById(Message.class, messageId);

        return new ModelAndView("redirect:goPrivateMail.htm");
    }

    @RequestMapping("getDetail.htm")
    public ModelAndView getDetail(HttpServletRequest request) {
        String userBid = request.getParameter("userId");

        System.out.println(userBid);
        User user = (User) request.getSession().getAttribute("user");

        User userB = privateMailService.findById(User.class, userBid);


        //打开回话的时候 ，将与这个sender相关信息全更成    已读
        DetachedCriteria dCriteria1 = DetachedCriteria.forClass(Message.class);

        dCriteria1.add(Restrictions.eq("userBySenderId", userB));

        dCriteria1.add(Restrictions.eq("userByReceiverId", user));

        dCriteria1.add(Restrictions.eq("messageState", "未读"));


        List<Message> list1 = privateMailService.queryAllOfCondition(Message.class, dCriteria1);

        for (int i = 0; i < list1.size(); i++) {
            Message message = list1.get(i);
            message.setMessageState("已读");
            privateMailService.update(message);

        }

        int sum = privateMailService.sumMail(user.getUserId());

        HttpSession session = request.getSession();

        session.setAttribute("sumMail", sum);

        int credit = user.getCredit();
        System.out.println("================credit================" + credit);
        Level level = userService.getUserLevel(credit);
        //查询回话列表

        DetachedCriteria dCriteria = DetachedCriteria.forClass(Message.class);

        dCriteria.add(Restrictions.or(Restrictions.and(Restrictions.eq("userBySenderId", userB), Restrictions.eq("userByReceiverId", user)), Restrictions.and(Restrictions.eq("userByReceiverId", userB), Restrictions.eq("userBySenderId", user))));

        dCriteria.addOrder(Order.desc("sendDate"));

        int pageSize = 8;
        int totalPage = privateMailService.countTotalPage(dCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<Message> list = (List<Message>) privateMailService.getByPage(dCriteria, pageSize);

        request.setAttribute("userB", userB);
        request.setAttribute("level", level);
        request.setAttribute("num", list.size());
        request.setAttribute("list", list);

        return new ModelAndView("/privateMail/scanMail");
    }

}
