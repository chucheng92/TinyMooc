package com.tinymooc.handler.user.controller;

import com.tinymooc.common.domain.Level;
import com.tinymooc.common.domain.Rule;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.user.service.UserService;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 哓哓 on 2015/11/23 0026.
 */

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("goAccountRevise.htm")
    public ModelAndView goAccountRevise() {
        return new ModelAndView("userPage/accountRevise");
    }

    @RequestMapping("goAccount.htm")
    public ModelAndView goAccount() {
        return new ModelAndView("userPage/account");
    }

    @RequestMapping("goAccountUserName.htm")
    public ModelAndView goAccountNickname() {
        return new ModelAndView("userPage/accountUserName");
    }

    @RequestMapping("goAccountAvatar.htm")
    public ModelAndView goAccountAvatar() {
        return new ModelAndView("userPage/accountAvatar");
    }

    @RequestMapping("goAccountPassword.htm")
    public ModelAndView goAccountPassword() {
        return new ModelAndView("userPage/accountPassword");
    }

    @RequestMapping("revisePassword.htm")
    public ModelAndView revisePassword(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String newPasswordConfirm = request.getParameter("newPasswordConfirm");
        String message = "失败";
        if (oldPassword == null || oldPassword == "" || newPassword == null || newPassword == "" || newPasswordConfirm == null || newPasswordConfirm == "") {
            message = "密码不能为空";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }
        if (!newPassword.equals(newPasswordConfirm)) {
            message = "两次密码不一致";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }
        if (oldPassword.length() < 6 || newPassword.length() < 6 || newPasswordConfirm.length() < 6) {
            message = "密码太短";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }
        if (oldPassword.length() > 25 || newPassword.length() > 25 || newPasswordConfirm.length() > 25) {
            message = "密码太长";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }

        // 非法字符检测
        String regex = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
        Pattern myPattern = Pattern.compile(regex);
        Matcher myMatcher = myPattern.matcher(newPassword);
        boolean flag = myMatcher.matches();
        if (flag) {
            message = "非法字符";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }
        // 字母数字检测
        regex = "^[A-Za-z0-9]+$";
        myPattern = Pattern.compile(regex);
        myMatcher = myPattern.matcher(newPassword);
        flag = myMatcher.matches();
        if (!flag) {
            message = "请输入由数字和26个英文字母组成的密码";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }

        if (user.getPassword().equals(oldPassword)) {
            user.setPassword(newPassword);
            userService.update(user);
            message = "修改成功";
            request.setAttribute("message", message);
            return new ModelAndView("forward:goAccountPassword.htm");
        }
        request.setAttribute("message", message);
        return new ModelAndView("forward:goAccountPassword.htm");
    }

    // 获取用户信息和等级
    public void getUserInfo(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        int credit = user.getCredit();
        Level level = userService.getUserLevel(credit);
        HttpSession hs = request.getSession();
        hs.removeAttribute("user");
        hs.setAttribute("user", user);
        hs.removeAttribute("level");
        hs.setAttribute("level", level);
    }

    @RequestMapping("account.htm")
    public ModelAndView goAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取用户信息和等级
        getUserInfo(request, response);
        return new ModelAndView("forward:goAccount.htm");
    }

    //用户修改个人信息
    @RequestMapping("accountUpdate.htm")
    public ModelAndView account(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        String message = "";
        //获取修改的信息
        String usersex = request.getParameter("userprofile_sex");
        String useryear = request.getParameter("year");
        String usermonth = request.getParameter("month");
        String userday = request.getParameter("day");
        String usercity = request.getParameter("city");
        String userabout = request.getParameter("about");
        String userbirth = useryear + "-" + usermonth + "-" + userday;

        if (!(userabout == null || userabout == "")) {
            user.setIntro(userabout);
        }
        if (!(usercity == null || usercity == "")) {
            user.setCity(usercity);
        }
        user.setGender(usersex);
        if (!(useryear == "" || usermonth == "" || userday == "" || useryear == null || usermonth == null || userday == null)) {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf1.parse(userbirth);
            user.setBirthday(date);
            //保存信息
            userService.update(user);
            message = "信息修改成功啦~";
            return new ModelAndView("forward:goAccount.htm", "message", message);
        } else {
            message = "修改的信息不能为空，请重试!";
            return new ModelAndView("forward:goAccountRevise.htm", "message", message);
        }

    }

    // 与金币关联的个性用户名
    @RequestMapping("accountUserName.htm")
    public ModelAndView accountUserName(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        //声明消息
        String messageNickname = "";
        //读取金币规则---修改昵称
        int gold = user.getGold();

        if (gold >= 5) {
            String userName = request.getParameter("userName");
            if (userName == null || userName == "") {
                messageNickname = "昵称不能为空!";
                return new ModelAndView("forward:goAccountUserName.htm", "messageNickname", messageNickname);
            }
            if (user.getUserName().equals(userName)) {
                messageNickname = "昵称没有变化，请重试!";
                return new ModelAndView("forward:goAccountUserName.htm", "messageNickname", messageNickname);
            }
            Rule rule = (Rule) userService.getCurrentSession().createCriteria(Rule.class).add(Restrictions.eq("action", "修改昵称")).uniqueResult();
            gold = gold - rule.getGold();
            //保存信息
            user.setGold(gold);
            user.setUserName(userName);
            request.getSession().setAttribute("user", user);
            userService.update(user);
            messageNickname = "修改成功";
            logger.info("============messageNickname={}=======", messageNickname);
            return new ModelAndView("forward:goAccountUserName.htm", "messageNickname", messageNickname);

        } else {
            logger.info("====进入金币不足========");
            messageNickname = "金币不足";
            getUserInfo(request, response);
            return new ModelAndView("forward:goAccount.htm", "messageNickname", messageNickname);
        }
    }
}