package com.tinymooc.handler.homePage.controller;

/**
 * Created by 哓哓 on 2015/12/1 0001.
 */

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tinymooc.common.domain.*;
import com.tinymooc.handler.video.service.VideoService;
import com.tinymooc.util.CSVUtil;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.handler.attention.service.AttentionService;
import com.tinymooc.handler.label.service.LabelService;
import com.tinymooc.handler.user.service.UserService;
import com.tinymooc.common.tag.pageTag.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 主页控制器
 * Campanulaceae 2015-12-01 18:25:16
 */
@Controller
public class HomePageController {

    private static final Logger log = LoggerFactory.getLogger(HomePageController.class);

    @Autowired
    private LabelService labelService;

    @Autowired
    private UserService userService;

    @Autowired
    private AttentionService attention;

    private String labels;
    private String previousLabels;

    /**
     * 转向首页
     *
     * @param request
     * @return ModelAndView
     */
    @RequestMapping("turnToHomePage.htm")
    public ModelAndView turnToHomePage(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        //热门课程
        DetachedCriteria dCriteria = DetachedCriteria.forClass(Course.class);
        dCriteria.addOrder(Order.desc("scanNum"));
        dCriteria.add(Restrictions.eq("courseState", "批准"));
        // TODO 是否取消课程的自关联
        dCriteria.add(Restrictions.isNull("course"));
        List<Course> hotCourseListTemp = userService.queryMaxNumOfCondition(Course.class, dCriteria, 8);
        // FIXME
        System.out.println("=======未登录hotCourseListTemp.size()===========" + hotCourseListTemp.size());

        List<UserCourse> hotCourseList = new ArrayList<>();
        for (int i = 0; i < hotCourseListTemp.size(); i++) {
            Course course = hotCourseListTemp.get(i);
            DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserCourse.class);
            detachedCriteria.add(Restrictions.eq("course", course));

            List<UserCourse> userCourseList = userService.queryAllOfCondition(UserCourse.class, detachedCriteria);

            for (int j = 0; j < userCourseList.size(); j++) {
                if (userCourseList.get(j).getUserPosition().equals("创建者")) {
                    hotCourseList.add(userCourseList.get(j));
                }
            }
        }
        // FIXME
        System.out.println("=======未登录hotCourseList .size()===========" + hotCourseList.size());

        //最新课程
        DetachedCriteria dCriteria1 = DetachedCriteria.forClass(Course.class);
        dCriteria1.addOrder(Order.desc("applyDate"));
        dCriteria1.add(Restrictions.eq("courseState", "批准"));
        dCriteria1.add(Restrictions.isNull("course"));
        List<Course> newCourseListTemp = userService.queryMaxNumOfCondition(Course.class, dCriteria1, 8);
        // FIXME
        System.out.println("=======未登录newCourseListTemp.size()===========" + newCourseListTemp.size());

        List<UserCourse> newCourseList = new ArrayList<>();
        for (int i = 0; i < newCourseListTemp.size(); i++) {
            Course course = newCourseListTemp.get(i);
            System.out.println("*********" + course.getCourseTitle() + "**********");
            DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserCourse.class);
            detachedCriteria.add(Restrictions.eq("course", course));

            List<UserCourse> userCourseList = userService.queryAllOfCondition(UserCourse.class, detachedCriteria);

            System.out.println("**********" + userCourseList.size() + "*************");
            for (int j = 0; j < userCourseList.size(); j++) {
                if (userCourseList.get(j).getUserPosition().equals("创建者")) {
                    newCourseList.add(userCourseList.get(j));
                }
            }
        }
        // FIXME
        System.out.println("=====未登录newCourseList.size=====" + newCourseList.size());

        //推荐小组
        DetachedCriteria dCriteria2 = DetachedCriteria.forClass(Team.class);
        dCriteria2.addOrder(Order.desc("construction"));
        dCriteria2.add(Restrictions.eq("teamState", "批准"));
        List<Team> teamList = userService.queryMaxNumOfCondition(Team.class, dCriteria2, 4);

        //热门话题
        DetachedCriteria dCriteria3 = DetachedCriteria.forClass(Discuss.class);
        dCriteria3.addOrder(Order.desc("scanNum"));
        List<Discuss> discussList = userService.queryMaxNumOfCondition(Discuss.class, dCriteria3, 3);

        //热门标签
        DetachedCriteria dCriteria4 = DetachedCriteria.forClass(Label.class);
        dCriteria4.addOrder(Order.desc("frequency"));
        List<Label> labelList = userService.queryMaxNumOfCondition(Label.class, dCriteria4, 20);

        //最新笔记
        DetachedCriteria dCriteria5 = DetachedCriteria.forClass(Note.class);
        dCriteria5.addOrder(Order.desc("addDate"));
        dCriteria5.add(Restrictions.eq("public_", "是"));
        List<Note> noteList = userService.queryMaxNumOfCondition(Note.class, dCriteria5, 5);


        request.setAttribute("hotCourseList", hotCourseList); // 热门课程
        request.setAttribute("newCourseList", newCourseList); // 最新课程
        request.setAttribute("teamList", teamList); // 小组
        request.setAttribute("discussList", discussList); // 话题
        request.setAttribute("labelList", labelList); // 标签
        request.setAttribute("noteList", noteList); // 笔记

        if (user == null) {
            /**
             * 用户没有登录
             */
            // FIXME
            System.out.println("=======HomePageController START=========");
            System.out.println("========用户没有登录转向未登录首页===========");
            return new ModelAndView("/homePage/homePage");
        } else {
            /**
             * 用户已经登录
             */
            System.out.println("=======HomePageController START=========");
            System.out.println("========用户已经登录转向登录首页===========");
            //FIXME
            System.out.println("用户已经登录");
            System.out.println("=====User====" + user.getUserName());
            int credit = user.getCredit();
            System.out.println("========credit=====" + credit);

            Level level = userService.getUserLevel(credit);
            System.out.println("===level===" + level.getLv());

            return new ModelAndView("/homePage/userHomePage", "level", level);
        }

    }

    /**
     * 我的萌课
     *
     * @param request
     * @return ModelAndView
     * @Date 2015年12月2日15:16:07
     */
    @RequestMapping("myTinyMooc.htm")
    public ModelAndView myTinyMooc(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");

        String message = "";
        if (user == null) {
            message = "请先登录啊(￣▽￣)";
            return new ModelAndView("/login/login", "message", message);
        } else {
            System.out.println("=======HomePageController START=========");
            //FIXME
            System.out.println("用户已经登录");
            System.out.println("=====User====" + user.getUserName());
            int credit = user.getCredit();
            System.out.println("========credit=====" + credit);

            Level level = userService.getUserLevel(credit);
            System.out.println("===level===" + level.getLv());

            // FIXME
            String sessionId = (String) request.getSession().getAttribute("userId");
            System.out.println(sessionId);

            //热门标签
            DetachedCriteria dCriteriaLabel = DetachedCriteria.forClass(Label.class);
            dCriteriaLabel.addOrder(Order.desc("frequency"));
            List<Label> labelList = userService.queryMaxNumOfCondition(Label.class, dCriteriaLabel, 8);

            //课程推荐
            DetachedCriteria dCriteriaCourse = DetachedCriteria.forClass(Course.class);
            dCriteriaCourse.addOrder(Order.desc("scanNum"));
            dCriteriaCourse.add(Restrictions.eq("courseState", "批准"));
            // TODO 是否取消课程的自关联
            dCriteriaCourse.add(Restrictions.isNull("course"));
            List<Course> courseList1 = userService.queryMaxNumOfCondition(Course.class, dCriteriaCourse, 6);

            List<UserCourse> hotCourseList = new ArrayList<>();
            for (int i = 0; i < courseList1.size(); i++) {
                Course course = courseList1.get(i);
                DetachedCriteria dCriteriaUserCourse = DetachedCriteria.forClass(UserCourse.class);
                dCriteriaUserCourse.add(Restrictions.eq("course", course));
                List<UserCourse> userCourseList = userService.queryAllOfCondition(UserCourse.class, dCriteriaUserCourse);

                // UserCourse中以创建者作为标识
                for (int j = 0; j < userCourseList.size(); j++) {
                    if (userCourseList.get(j).getUserPosition().equals("创建者")) {
                        hotCourseList.add(userCourseList.get(j));
                        break;
                    }
                }
                // FIXME
                System.out.println("=======已登录========userCourseList.size()===========" + userCourseList.size());
            }

            // FIXME
            System.out.println("=====已登录hotCourseList.size=====" + hotCourseList.size());

            //达人推荐
            DetachedCriteria dCriteria2 = DetachedCriteria.forClass(User.class)
                    .addOrder(Order.desc("credit"))
                    .add(Restrictions.ne("userId", user.getUserId()));
            List<User> expertList = userService.queryMaxNumOfCondition(User.class, dCriteria2, 4);

            // 封装数据
            request.setAttribute("hotCourseList", hotCourseList);
            request.setAttribute("labelList", labelList);
            request.setAttribute("expertList", expertList);

            // TODO
            System.out.println("用户已经登录转向用户登录页面");
            return new ModelAndView("/homePage/myTinyMooc", "level", level);
        }
    }


    @RequestMapping("recommendTeam.htm")
    public ModelAndView recommendTeam(HttpServletRequest request) {
        System.out.println("=====Test Start===========Enter recommendTeam===========");
        User user = (User) request.getSession().getAttribute("user");
        int credit = user.getCredit();
        System.out.println("================credit============" + credit);
        Level level = userService.getUserLevel(credit);

        //热门标签
        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(Label.class);
        detachedCriteria1.addOrder(Order.desc("frequency"));
        List<Label> labelList = userService.queryMaxNumOfCondition(Label.class, detachedCriteria1, 9);

        //达人推荐
        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(User.class)
                .addOrder(Order.desc("credit"))
                .add(Restrictions.ne("userId", user.getUserId()));
        List<User> expertList = userService.queryMaxNumOfCondition(User.class, detachedCriteria2, 4);

        //小组推荐
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(LabelObject.class)
                .add(Restrictions.eq("objectId", user.getUserId()));
        List<LabelObject> labelObjectList = userService.queryAllOfCondition(LabelObject.class, detachedCriteria3);

        // FIXME
        System.out.println("=Test1=============labelObjectList==============" + labelObjectList.size());

        List<UserTeam> teamList = new ArrayList<UserTeam>();

        for (int i = 0; i < labelObjectList.size(); i++) {
            Label label = labelObjectList.get(i).getLabel();
            DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(LabelObject.class)
                    .add(Restrictions.eq("label", label))
                    .add(Restrictions.eq("objectType", "team"));
            List<LabelObject> labelObjectTempList = userService.queryAllOfCondition(LabelObject.class, detachedCriteria4);
            // FIXME
            System.out.println("=Test2=============  labelObjectTempList.size==============" + labelObjectTempList.size());

            for (int j = 0; j < labelObjectTempList.size(); j++) {

                // FIXME
                System.out.println("===Test3=======Enter Loop=============");
                String objectId = labelObjectTempList.get(j).getObjectId();
                // FiXME
                System.out.println("=========objectId=============" + objectId);
                User userTest = userService.findById(User.class, objectId);
                if (userTest == null) {
                    break;
                }
                DetachedCriteria dCriteriaTest = DetachedCriteria.forClass(UserTeam.class)
                        .add(Restrictions.eq("user", userTest))
                        .add(Restrictions.eq("userPosition", "组长"))
                        .add(Restrictions.eq("userState", "批准"));

                // FIXMe
                List<UserTeam> list = userService.queryAllOfCondition(UserTeam.class, dCriteriaTest);
                UserTeam userTeamTemp = null;
                if (list.size() == 0) {
                    System.out.println("========if====");
                    continue;
                } else {
                    userTeamTemp = list.get(0);
                }
            teamList.add(userTeamTemp);
        }
    }

    request.getSession().

    setAttribute("labelList",labelList);

    request.getSession().

    setAttribute("expertList",expertList);

    request.getSession().

    setAttribute("teamList",teamList);

    request.getSession().

    setAttribute("level",level);

    //FIXME
    System.out.println("============Test End============");
    return new

    ModelAndView("/homePage/recommendTeam");

}

    @RequestMapping("turnToHelpPage.htm")
    public ModelAndView turnToHelpPage() {
        return new ModelAndView("/help/helpLevel");
    }

    @RequestMapping("howToCreate.htm")
    public ModelAndView howtocreate() {
        return new ModelAndView("/course/howToCreate");
    }

    @RequestMapping("turnToPersonPage.htm")
    public ModelAndView turnToPersonPage() {
        return new ModelAndView("/homePage/userHomePage");
    }

    @RequestMapping("editLabel.htm")
    public ModelAndView editLabel(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null)
            return new ModelAndView("redirect:login.htm");

        String labels = request.getParameter("keyWordsHidden");
        System.out.println("#####################labels@@@@@@@@@:" + labels);

        String objectId = null;
        String type = request.getParameter("type");
        String courseId = request.getParameter("courseId");
        String teamId = request.getParameter("teamId");

        if (type.equals("user")) {
            objectId = user.getUserId();
        } else if (type.equals("course")) {
            objectId = courseId;
        } else if (type.equals("team")) {
            objectId = teamId;
        } else {
            objectId = user.getUserId();
        }

        // FIXME
        System.out.println("==================type=" + type);
        System.out.println("==================courseId=" + courseId);
        System.out.println("==================objectId=" + objectId);

        labelService.saveObjectLabels(labels, objectId, type);

        return new ModelAndView("forward:queryLabel.htm");
    }

    @RequestMapping("queryLabel.htm")
    public ModelAndView queryLabel(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null)
            return new ModelAndView("redirect:login.htm");

        String type = request.getParameter("type");
        String courseId = request.getParameter("courseId");
        String teamId = request.getParameter("teamId");

        // FIXME
        System.out.println("==================type=" + type);

        labels = labelService.getTenHotLabels();
        if (type.equals("user")) {
            previousLabels = labelService.getObjectLabels(user.getUserId(), type);
        } else if (type.equals("course")) {
            previousLabels = labelService.getObjectLabels(courseId, type);
        } else if (type.equals("team")) {
            previousLabels = labelService.getObjectLabels(teamId, type);
        } else {
            previousLabels = labelService.getObjectLabels(user.getUserId(), type);
        }

        ModelMap map = new ModelMap();
        map.put("labels", labels);
        map.put("previousLabels", previousLabels);

        request.setAttribute("courseId", courseId);
        request.setAttribute("teamId", teamId);
        request.setAttribute("type", type);

        return new ModelAndView("/userPage/accountLabel", map);
    }

    @RequestMapping("goPersonal.htm")
    public ModelAndView goPersonal(HttpServletRequest request) throws Exception {

        if ((request.getSession().getAttribute("user")) == null) {
            return new ModelAndView("redirect:goLoginPage.htm");
        } else {
            User user = (User) request.getSession().getAttribute("user");
            if ((request.getParameter("userId")).equals("")) {
                return new ModelAndView("redirect:goLoginPage.htm");
            }
            String userId = request.getParameter("userId");

            User user1 = userService.findById(User.class, userId);

            // 获取关注列表
            DetachedCriteria dCriteria1 = DetachedCriteria.forClass(Attention.class);
            dCriteria1.add(Restrictions.eq("userByUserId", user1));
            List<Attention> attentionList = userService.queryAllOfCondition(Attention.class, dCriteria1);

            // 获取好友列表
            DetachedCriteria dCriteria2 = DetachedCriteria.forClass(Attention.class);
            dCriteria2.add(Restrictions.eq("userByAttentionedUserId", user1));
            List<Attention> fansList = userService.queryAllOfCondition(Attention.class, dCriteria2);


            // 获取当前学习课程
            DetachedCriteria dCriteria3 = DetachedCriteria.forClass(UserCourse.class)
                    .add(Restrictions.eq("user", user1))
                    .add(Restrictions.eq("learnState", "学习中"))

                            // FIXME
                    .createCriteria("course").add(Restrictions.isNull("course"));
            List<UserCourse> currentCourseList = userService.queryAllOfCondition(UserCourse.class, dCriteria3);


            // 获取当前学完课程
            DetachedCriteria dCriteria4 = DetachedCriteria.forClass(UserCourse.class);
            dCriteria4.add(Restrictions.eq("learnState", "已学"));
            dCriteria4.add(Restrictions.eq("user", user1))
                    // FIXME
                    .createCriteria("course").add(Restrictions.isNull("course"));
            List<UserCourse> endCourseList = userService.queryAllOfCondition(UserCourse.class, dCriteria4);


            // 获取当前用户的标签
            DetachedCriteria dCriteria5 = DetachedCriteria.forClass(LabelObject.class);
            dCriteria5.add(Restrictions.eq("objectId", user1.getUserId()));
            List<LabelObject> labelList = userService.queryAllOfCondition(LabelObject.class, dCriteria5);

            String isOk = "";
            boolean flag = attention.isAlreadyAttention(user.getUserId(), user1.getUserId());
            if (flag) {
                isOk = "ok";
            } else {
                isOk = "no";
            }

            int credit = user1.getCredit();

            // FIXME
            System.out.println("==============credit===========" + credit);

            Level level = userService.getUserLevel(credit);
            request.setAttribute("isOk", isOk);
            request.setAttribute("user1", user1);
            request.setAttribute("user", user);
            request.setAttribute("level", level);
            request.setAttribute("labelList", labelList);
            request.setAttribute("labelList", labelList);
            request.setAttribute("fansList", fansList);
            request.setAttribute("currentCourseList", currentCourseList);
            request.setAttribute("endCourseList", endCourseList);

            return new ModelAndView("/userPage/user");
        }
    }

    @RequestMapping("goPersonalTeam.htm")
    public ModelAndView goPersonalTeam(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        User user1 = userService.findById(User.class, userId);

        DetachedCriteria dCriteria = DetachedCriteria.forClass(UserTeam.class);

        dCriteria.add(Restrictions.eq("user", user1));

        List<UserTeam> userTeam = userService.queryAllOfCondition(UserTeam.class, dCriteria);

        DetachedCriteria dCriteria2 = DetachedCriteria.forClass(Discuss.class);

        dCriteria2.add(Restrictions.eq("user", user1));

        List<Discuss> discussList = userService.queryAllOfCondition(Discuss.class, dCriteria2);


        request.setAttribute("user1", user1);
        request.setAttribute("userTeam", userTeam);
        request.setAttribute("discussList", discussList);

        return new ModelAndView("/userPage/userGroup");

    }

    @RequestMapping("goPersonalNote.htm")
    public ModelAndView goPersonalNote(HttpServletRequest request) {
        String userId = request.getParameter("userId");

        User user1 = userService.findById(User.class, userId);

        User user = (User) request.getSession().getAttribute("user");


        DetachedCriteria dCriteria = DetachedCriteria.forClass(UserCourse.class);

        dCriteria.add(Restrictions.eq("user", user1));

        List<UserCourse> notelist = userService.queryAllOfCondition(UserCourse.class, dCriteria);

        request.setAttribute("user1", user1);
        request.setAttribute("user", user);

        return new ModelAndView("/userPage/userNote", "notelist", notelist);

    }

    @RequestMapping("goPersonalFans.htm")
    public ModelAndView goPersonalFans(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        User user1 = userService.findById(User.class, userId);
        List<Attention> list = attention.queryFans(userId);
        request.setAttribute("user1", user1);
        request.setAttribute("sum", list.size());
        return new ModelAndView("/userPage/userFans", "list", list);

    }

    @RequestMapping("goPersonalAttention.htm")
    public ModelAndView goPersonalAtt(HttpServletRequest request) {

        String userId = request.getParameter("userId");
        User user1 = userService.findById(User.class, userId);
        List<Attention> list = attention.queryAttention(userId);
        request.setAttribute("sum", list.size());
        request.setAttribute("user1", user1);
        return new ModelAndView("/userPage/userFollow", "list", list);

    }

    /*---------------------------导航栏课程首页------------------------*/
    @SuppressWarnings("unchecked")
    @RequestMapping("goCourseHome.htm")
    public ModelAndView goCourseHome(HttpServletRequest request) {
        // FIXME
        System.out.println("=============进入goCourseHome=========");
        String filterType = request.getParameter("filterType");
        // FIXME
        System.out.println("=============filterType=========" + filterType);

        DetachedCriteria dc = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "创建者")).createCriteria("course")
                .add(Restrictions.eq("courseState", "批准"))
                .add(Restrictions.isNull("course"));
        if (filterType == null)
            // 默认
            dc.addOrder(Order.desc("applyDate"));
        else if (filterType.equals("grade"))
            dc.addOrder(Order.desc("totalMark"));
        else if (filterType.equals("time"))
            dc.addOrder(Order.desc("approveDate"));
        else if (filterType.equals("hot"))
            dc.addOrder(Order.desc("scanNum"));

        int pageSize = 12;
        int totalPage = userService.countTotalPage(dc, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<UserCourse> list1 = (List<UserCourse>) userService.getByPage(dc, pageSize);
        request.setAttribute("list1", list1);

        // FIXME
        System.out.println("=============结束goCourseHome=========");

        return new ModelAndView("/homePage/allcourse");
    }

		/*---------------------------导航栏专业首页------------------------*/

    @RequestMapping("goMajorHome.htm")
    public ModelAndView goMajorHome(HttpServletRequest request) throws Exception {
        String type = request.getParameter("type");

        // 专业科目 显示1门
        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "创建者")).createCriteria("course")
                .add(Restrictions.eq("courseState", "批准"))
                .add(Restrictions.eq("type", type))
                .add(Restrictions.isNull("course"));
        List<UserCourse> majorCourseList = userService.queryMaxNumOfCondition(UserCourse.class, detachedCriteria1, 1);
        // FIXME
        System.out.println("============majorList.size=" + majorCourseList.size());


        //最新课程 显示4门
        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(Course.class);
        detachedCriteria2.add(Restrictions.eq("courseState", "批准"));
        detachedCriteria2.add(Restrictions.eq("type", type));
        detachedCriteria2.add(Restrictions.isNull("course"));
        detachedCriteria2.addOrder(Order.desc("applyDate"));
        List<Course> newCourseListTemp = userService.queryMaxNumOfCondition(Course.class, detachedCriteria2, 4);
        // FIXME
        System.out.println("========newCourseListTemp=" + newCourseListTemp.size());

        List<UserCourse> newCourseList = new ArrayList<UserCourse>();
        for (int i = 0; i < newCourseListTemp.size(); i++) {
            Course course = newCourseListTemp.get(i);
            DetachedCriteria dCr1 = DetachedCriteria.forClass(UserCourse.class).add(Restrictions.eq("course", course));
            List<UserCourse> uL1 = userService.queryAllOfCondition(UserCourse.class, dCr1);

            for (int j = 0; j < uL1.size(); j++) {
                if (uL1.get(j).getUserPosition().equals("创建者")) {
                    newCourseList.add(uL1.get(j));
                }
            }
        }


        //热门课程 显示4门
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(Course.class);
        detachedCriteria3.addOrder(Order.desc("scanNum"));
        detachedCriteria3.add(Restrictions.eq("courseState", "批准"));
        detachedCriteria3.add(Restrictions.eq("type", type));
        detachedCriteria3.add(Restrictions.isNull("course"));
        List<Course> hotCourseListTemp = userService.queryMaxNumOfCondition(Course.class, detachedCriteria3, 4);
        // FIXME
        System.out.println("========hotCourseListTemp1.size=" + hotCourseListTemp.size());

        List<UserCourse> hotCourseList = new ArrayList<UserCourse>();
        for (int i = 0; i < hotCourseListTemp.size(); i++) {
            Course course = hotCourseListTemp.get(i);
            DetachedCriteria dCr1 = DetachedCriteria.forClass(UserCourse.class).add(Restrictions.eq("course", course));
            List<UserCourse> uL1 = userService.queryAllOfCondition(UserCourse.class, dCr1);

            for (int j = 0; j < uL1.size(); j++) {
                if (uL1.get(j).getUserPosition().equals("创建者")) {
                    hotCourseList.add(uL1.get(j));
                }
            }
        }


        //小组话题
        DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(Discuss.class);
        detachedCriteria4.addOrder(Order.desc("scanNum")).createCriteria("team").add(Restrictions.eq("type", type)).add(Restrictions.eq("teamState", "批准"));
        List<Discuss> discussList = userService.queryMaxNumOfCondition(Discuss.class, detachedCriteria4, 4);

        //相关小组
        DetachedCriteria detachedCriteria5 = DetachedCriteria.forClass(Team.class);
        detachedCriteria5.addOrder(Order.desc("construction"));
        detachedCriteria5.add(Restrictions.eq("teamState", "批准"));
        detachedCriteria5.add(Restrictions.eq("type", type));
        List<Team> teamList = userService.queryMaxNumOfCondition(Team.class, detachedCriteria5, 6);

        //热门标签
        DetachedCriteria detachedCriteria6 = DetachedCriteria.forClass(Label.class);
        detachedCriteria6.addOrder(Order.desc("frequency"));
        List<Label> labelList = userService.queryMaxNumOfCondition(Label.class, detachedCriteria6, 8);


        request.setAttribute("majorCourseList", majorCourseList);
        request.setAttribute("hotCourseList", hotCourseList);
        request.setAttribute("newCourseList", newCourseList);
        request.setAttribute("teamList", teamList);
        request.setAttribute("labelList", labelList);
        request.setAttribute("type", type);
        request.setAttribute("discussList", discussList);

        return new ModelAndView("/homePage/majorHome");
    }
}