package com.tinymooc.handler.course.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import java.text.DecimalFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.authority.annotation.CheckAuthority;
import com.tinymooc.common.domain.*;
import com.tinymooc.common.tag.pageTag.PageHelper;
import com.tinymooc.handler.attention.service.AttentionService;
import com.tinymooc.handler.course.service.CourseService;
import com.tinymooc.handler.favorite.service.FavoriteService;
import com.tinymooc.handler.label.service.LabelService;
import com.tinymooc.handler.resource.service.ResourceService;
import com.tinymooc.handler.user.service.UserService;
import com.tinymooc.handler.video.service.VideoService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {
    private Logger log = LoggerFactory.getLogger(CourseController.class);
    @Autowired
    private VideoService videoService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private LabelService labelService;

    @Autowired
    private UserService userService;

    @Autowired
    private AttentionService attentionService;

    @Autowired
    private FavoriteService  favoriteService;

    private String labels;

    private String previousLabels;

    @RequestMapping("createCoursePage.htm")
    public ModelAndView createCoursePage(HttpServletRequest req, HttpServletResponse res) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(DataDic.class)
                .add(Restrictions.eq("dicKey", "专业分类"));
        List<DataDic> dataDicList = (List<DataDic>) courseService.queryAllOfCondition(DataDic.class, detachedCriteria);

        req.setAttribute("dataDicList", dataDicList);
        return new ModelAndView("/course/courseCreate");
    }

    /**
     * 创建课程
     *
     * @param req
     * @param res
     * @return
     */
    @RequestMapping("createCourse.htm")
    public ModelAndView createCourse(HttpServletRequest req, HttpServletResponse res) {
        // FIXME
        System.out.println("================进入CreateCourse.htm=============");
        User user = (User) req.getSession().getAttribute("user");
        String picUrl = (String)req.getSession().getAttribute("picUrl");
        // FIXME
        System.out.println("=================picUrl="+picUrl);

        String courseTitle = ServletRequestUtils.getStringParameter(req, "courseTitle", "");
        String courseIntro = ServletRequestUtils.getStringParameter(req, "courseIntro", "");
        String type = ServletRequestUtils.getStringParameter(req, "type", "");
        Course course = new Course();
        course.setCourseId(UUIDGenerator.randomUUID());
        course.setApplyDate(new Date());
        course.setCourseIntro(courseIntro);
        course.setCourseState("申请中");
        course.setType(type);
        if (picUrl != null)
            course.setLogoUrl(picUrl);
        else
            course.setLogoUrl("/resource/pic/courseLogo/course1.jpg");
        course.setScanNum(0);
        course.setCourseTitle(courseTitle);
        courseService.save(course);
        UserCourse userCourse = new UserCourse();
        userCourse.setUserCourseId(UUIDGenerator.randomUUID());
        userCourse.setUserPosition("创建者");
        userCourse.setCourse(course);
        userCourse.setUser(user);
        courseService.save(userCourse);
        req.getSession().removeAttribute("picUrl");

        // FIXME
        System.out.println("================结束CreateCourse.htm=============");
        return new ModelAndView("redirect:courseList.htm");
    }

    @RequestMapping("createLessonPage.htm")
    public ModelAndView createLessonPage(HttpServletRequest req, HttpServletResponse res) {
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        Course course = courseService.findById(Course.class, courseId);
        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserCourse.class)
                .createCriteria("course")
                .add(Restrictions.eq("course", course));
        List<UserCourse> userCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria1);
        // FIXME
        System.out.println("===============userCourseList=" + userCourseList.size());

        int lessons = userCourseList.size();

        req.setAttribute("course", course);
        req.setAttribute("lessons", lessons);
        return new ModelAndView("/course/createLesson");
    }

    @RequestMapping("createLesson.htm")
    public ModelAndView createLesson(HttpServletRequest req, HttpServletResponse res) {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null)
            return new ModelAndView("redirect:login.htm");
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        String courseTitle = ServletRequestUtils.getStringParameter(req, "courseTitle", "");
        String courseIntro = ServletRequestUtils.getStringParameter(req, "courseIntro", "");
        String content = ServletRequestUtils.getStringParameter(req, "content", "");
        String lessonNum = ServletRequestUtils.getStringParameter(req, "lessonNum", "");
        Course course = new Course();
        course.setCourseId(UUIDGenerator.randomUUID());
        course.setApplyDate(new Date());
        course.setCourseIntro(courseIntro);
        course.setCourseState("申请中");
        course.setScanNum(0);
        course.setCourseTitle(courseTitle);
        course.setLessonNum(Integer.parseInt(lessonNum));
        course.setCourse(courseService.findById(Course.class, courseId));
        courseService.save(course);

        UserCourse userCourse = new UserCourse();
        userCourse.setUserCourseId(UUIDGenerator.randomUUID());
        userCourse.setUserPosition("创建者");
        userCourse.setCourse(course);
        userCourse.setUser(user);
        courseService.save(userCourse);

        Resource resource = new Resource();
        resource.setResourceId(UUIDGenerator.randomUUID());
        resource.setResourceObject(course.getCourseId());
        courseService.save(resource);

        ImageText imageText = new ImageText();
        imageText.setResourceId(resource.getResourceId());
        imageText.setContent(content);
        imageText.setResource(resource);
        courseService.save(imageText);


        return new ModelAndView("redirect:courseList.htm");
    }

    /**
     * 课程列表
     *
     * @param req
     * @param res
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("courseList.htm")
    public ModelAndView courseList(HttpServletRequest req, HttpServletResponse res) {
        User user = (User) req.getSession().getAttribute("user");
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("userPosition", "创建者"))
                .createCriteria("course")
                .add(Restrictions.isNull("course"));
        int pageSize = 5;
        int totalPage = courseService.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<UserCourse> myCreatedCourseList = (List<UserCourse>) courseService.getByPage(detachedCriteria, pageSize);

        int credit = user.getCredit();
        // FIXME
        System.out.println("========credit=====" + credit);

        Level myLevel = userService.getUserLevel(credit);
        System.out.println("===myLevel===" + myLevel.getLv());

        req.setAttribute("myLevel", myLevel);
        req.setAttribute("myCreatedCourseList", myCreatedCourseList);

        return new ModelAndView("/course/myCourse");
    }

    @RequestMapping("courseDetailPage.htm")
    public ModelAndView courseDetailPage(HttpServletRequest req, HttpServletResponse res) {
        // FIXME
        log.info("====================进入courseDetailPage=================");

        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        Course course = courseService.findById(Course.class, courseId);
        course.setScanNum(course.getScanNum() + 1);
        courseService.update(course);

        User user = (User) req.getSession().getAttribute("user");

        // Test 1
        //查询该课程的用户课程信息（能得到创建者信息）
        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "创建者"))
                .add(Restrictions.eq("course", course));
        // currentCourse 针对当前课程的创建者
        UserCourse currentCourse = courseService.queryAllOfCondition(UserCourse.class, detachedCriteria1).get(0);
        // FIXME
        if (currentCourse.getLearnState() == null) {
            System.out.println("Test 1 if===============currentCourse.getLearnState()=NULL");
        } else {
            System.out.println("Test 1 else===============currentCourse.getLearnState()=" + currentCourse.getLearnState());
        }

        //查询该课程的所有课时
//		DetachedCriteria criteria2=DetachedCriteria.forClass(UserCourse.class)
//				.add(Restrictions.eq("user", user))
//				.createCriteria("course")
//				.add(Restrictions.eq("course", course))				
//				.addOrder(Order.asc("applyDate"));

        // Test 2
        //按开始学习时间降序排列查询该课程用户学习状态为"学习中"的用户课程信息
        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "学员"))
                .add(Restrictions.eq("course", course))
                .add(Restrictions.eq("learnState", "学习中"))
                .addOrder(Order.desc("startDate"));
        // 学员学习中
        List<UserCourse> userLearnCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria2);

        // FIXME
        System.out.println("Test 2===============userLearnCourseList .size=" + userLearnCourseList.size());

        // Test 3
        //按开始学习时间降序排列查询该课程用户学习状态为"已学"的用户课程信息
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "学员"))
                .add(Restrictions.eq("course", course))
                .add(Restrictions.eq("learnState", "已学"))
                .addOrder(Order.desc("startDate"));
        // 学员已学
        List<UserCourse> userEndCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria3);
        // FIXME
        System.out.println("Test 3===============userEndCourseList.size=" + userEndCourseList.size());
        // 准备学员数据
        int studentNum = userLearnCourseList.size() + userEndCourseList.size();

        // Test 4
        // 查询该课程创建者其他创建的用户课程
        DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "创建者"))
                .add(Restrictions.eq("user", currentCourse.getUser()));
        // 查询该课程创建者创建的所有课程
        List<UserCourse> creatorCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria4);
        // 准备课程数数据
        int creatorCourseNum = creatorCourseList.size();
        // FIXME
        System.out.println("Test 4===============creatorCourseList.size=" + creatorCourseList.size());

        // Test 5
        // 查询关注者为登录用户，被关注者为课程创建者的关注信息
        // 查询当前用户与创建者的关注信息
        DetachedCriteria detachedCriteria5_1 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", user))
                .add(Restrictions.eq("userByAttentionedUserId", currentCourse.getUser()));
        List<Attention> attentionOfCurrentToCreator = (List<Attention>) courseService.queryAllOfCondition(Attention.class, detachedCriteria5_1);
        // 当前用户是否关注创建者
        int isAttention = 0;
        if (!attentionOfCurrentToCreator.isEmpty()) {
            isAttention = 1;
        }
        // 当前用户是否收藏本课程
        DetachedCriteria detachedCriteria5_2 = DetachedCriteria.forClass(Favorite.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("courseId", course.getCourseId()));
        List<Favorite> favoriteOfCurrentCourse = (List<Favorite>) favoriteService.queryAllOfCondition(Favorite.class, detachedCriteria5_2);

        int isFavorite = 0;
        if (!favoriteOfCurrentCourse.isEmpty()) {
            isFavorite = 1;
        }
        // FIXME
        System.out.println("Test 5===============attentionOfCurrentToCreator.size=" + attentionOfCurrentToCreator.size());

        // Test 6-1
        // 查询课程创建者的关注信息
        // 创建者的粉丝
        DetachedCriteria detachedCriteria6_1 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByAttentionedUserId", currentCourse.getUser()));
        // 查询创建者的粉丝
        List<Attention> fansOfCreatorList = (List<Attention>) courseService.queryAllOfCondition(Attention.class, detachedCriteria6_1);
        // 准备粉丝数据
        int fansNum = fansOfCreatorList.size();

        // FIXME
        System.out.println("Test 6-1 ===============fansOfCreatorList.size=" + fansOfCreatorList.size());

        // Test 6-2
        // 创建者的关注
        DetachedCriteria detachedCriteria6_2 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", currentCourse.getUser()));
        // 查询创建者的关注
        List<Attention> followOfCreatorList = (List<Attention>) courseService.queryAllOfCondition(Attention.class, detachedCriteria6_2);
        // 准备关注数据
        int followNum = followOfCreatorList.size();
        // FIXME
        System.out.println("Test 6-2===============followOfCreatorList =" + followOfCreatorList.size());

        // Test 7
        // 该门课程的标签
        DetachedCriteria detachedCriteria7 = DetachedCriteria.forClass(LabelObject.class)
                .add(Restrictions.eq("objectType", "course"))
                .add(Restrictions.eq("objectId", currentCourse.getCourse().getCourseId()));
        // 该门课程的标签
        List<LabelObject> labelObjectList = (List<LabelObject>) courseService.queryAllOfCondition(LabelObject.class, detachedCriteria7);
        // FIXME
        System.out.println("Test 7===============labelObjectList =" + labelObjectList.size());

        // Test 8
        // 该门课程的评分同时写回Course表的totalMark中
        DetachedCriteria detachedCriteria8 = DetachedCriteria.forClass(Grade.class).add(Restrictions.eq("gradeObject", courseId));
        List<Grade> gradeList = courseService.queryAllOfCondition(Grade.class, detachedCriteria8);
        double userGrade = 0.0;
        if (gradeList.size() != 0) {
            // 页面限制位数
            userGrade = courseService.queryGrade(courseId);
        } else {
            userGrade = 0.0;
        }
        course.setTotalMark(userGrade);
        courseService.update(course);
        // FIXME
        System.out.println("Test 8===============userGrade=" + userGrade);


        // Test 9
        // 查询当前用户针对本课程的学习状态
        DetachedCriteria detachedCriteria9 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("course", course))
                .add(Restrictions.eq("userPosition", "学员"));
        String currentCourseState = "开始学习";
        List<UserCourse> tempList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria9);
        // FIXME
        System.out.println("Test 9===============tempList.size=" + tempList.size());

        if (!tempList.isEmpty()) {
            currentCourseState = tempList.get(0).getLearnState();
        }

        // FIXME
        System.out.println("==============程序执行到CourseController ->Test9===============");

        // Test 10
        //查询该课程对应所有的课时及用户学习状态
        DetachedCriteria detachedCriteria10 = DetachedCriteria.forClass(Course.class)
                .add(Restrictions.eq("course", course))
                .addOrder(Order.asc("applyDate"))
                .add(Restrictions.eq("courseState", "批准"));
        List<Course> tempLessonList = (List<Course>) courseService.queryAllOfCondition(Course.class, detachedCriteria10);
        // FIXME
        System.out.println("Test10 ===============tempLessonList.size=" + tempLessonList.size());

        // 课时
        List<UserCourse> lessonList = new ArrayList<UserCourse>();
        for (int i = 0; i < tempLessonList.size(); i++) {
            String currentLessonState = "未学";
            UserCourse newCourse = new UserCourse();
            DetachedCriteria detachedCriteria11 = DetachedCriteria.forClass(UserCourse.class)
                    .add(Restrictions.eq("user", user))
                    .add(Restrictions.eq("course", tempLessonList.get(i)))
                    .add(Restrictions.eq("userPosition", "学员"));
            List<UserCourse> localTempCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria11);
            // FIXME
            System.out.println("Test11 ===============localTempCourseList=" + localTempCourseList.size());

            if (!localTempCourseList.isEmpty()) {
                currentLessonState = localTempCourseList.get(0).getLearnState();
            }
            newCourse.setCourse(tempLessonList.get(i));
            newCourse.setLearnState(currentLessonState);
            lessonList.add(newCourse);
        }
        // Test UserCourseList
        // FIXME
        System.out.println("Test 章节===============lessonList=" + lessonList.size());

        // 准备章节数据
        int lessonNum = lessonList.size();
        // Test12
        // FIXME
        System.out.println("Test 12=============lessonNum=" + lessonNum);

        int picSuffix = 0;
        if (currentCourse.getCourse().getCourseId().length() <= 2) {
            picSuffix = Integer.parseInt(currentCourse.getCourse().getCourseId());
        } else {
            picSuffix = Integer.parseInt(currentCourse.getCourse().getCourseId().substring(0, 7), 16) % 10;
        }

        // 封装信息
        req.setAttribute("currentCourse", currentCourse);
        req.setAttribute("fansNum", fansNum);
        req.setAttribute("followNum", followNum);
        req.setAttribute("userGrade", userGrade);
        req.setAttribute("studentNum", studentNum);
        req.setAttribute("creatorCourseNum", creatorCourseNum);
        req.setAttribute("isAttention", isAttention);
        req.setAttribute("isFavorite", isFavorite);
        req.setAttribute("userLearnCourseList", userLearnCourseList);
        req.setAttribute("userEndCourseList", userEndCourseList);
        req.setAttribute("user", user);
        req.setAttribute("lessonNum", lessonNum);
        req.setAttribute("labelList", labelObjectList);
        req.setAttribute("currentCourseState", currentCourseState);
        req.setAttribute("lessonList", lessonList);
        return new ModelAndView("/course/courseDetailPage");
    }

    /**
     * 管理课程
     *
     * @param req
     * @param res
     * @return
     */
    @RequestMapping("manageCoursePage.htm")
    public ModelAndView manageCoursePage(HttpServletRequest req, HttpServletResponse res) {
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        Course course = courseService.findById(Course.class, courseId);
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(DataDic.class)
                .add(Restrictions.eq("dicKey", "专业分类"));
        List<DataDic> dataDicList = (List<DataDic>) courseService.queryAllOfCondition(DataDic.class, detachedCriteria);

        req.setAttribute("course", course);
        req.setAttribute("dataDicList", dataDicList);
        return new ModelAndView("/course/manageCourse");
    }

    @RequestMapping("manageCourse.htm")
    public ModelAndView manageCourse(HttpServletRequest req, HttpServletResponse res) {
        String courseTitle = ServletRequestUtils.getStringParameter(req, "courseTitle", "");
        String courseIntro = ServletRequestUtils.getStringParameter(req, "courseIntro", "");
        String type = ServletRequestUtils.getStringParameter(req, "type", "");
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        Course course = courseService.findById(Course.class, courseId);
        course.setCourseTitle(courseTitle);
        course.setCourseIntro(courseIntro);
        course.setType(type);
        courseService.update(course);
        return new ModelAndView("/include/outSuccess");
    }


    @RequestMapping("lessonPage.htm")
    public ModelAndView lessonPage(HttpServletRequest req, HttpServletResponse res) {
        // FIXME
        log.info("==================进入lessonPage===============");
        String childrenId = ServletRequestUtils.getStringParameter(req, "childrenId", "");

        // FIXME
        log.info("==================childrenId={}", childrenId);

        User user = (User) req.getSession().getAttribute("user");
        // 课时
        Course lesson = courseService.findById(Course.class, childrenId);

        // FIXME
        log.info("==================lesson.title={}", lesson.getCourseTitle());

        //1查询创建者
        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("course", lesson.getCourse()))
                .add(Restrictions.eq("userPosition", "创建者"));
        List<UserCourse> queryTempList1 = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria1);
        UserCourse currentCourse = queryTempList1.get(0);

        // 2 查询本课程学习中
        //按开始学习时间降序排列查询该课程用户学习状态为"学习中"的用户课程信息
        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "学员"))
                .add(Restrictions.eq("course", lesson.getCourse()))
                .add(Restrictions.eq("learnState", "学习中"))
                .addOrder(Order.desc("startDate"));
        List<UserCourse> userLearnCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria2);

        // 3查询本课程已学
        //按开始学习时间降序排列查询该课程用户学习状态为"已学"的用户课程信息
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "学员"))
                .add(Restrictions.eq("course", lesson.getCourse()))
                .add(Restrictions.eq("learnState", "已学"))
                .addOrder(Order.desc("startDate"));
        List<UserCourse> userEndCourseList = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria3);

        // Test 4
        // 查询当前用户与创建者的关注信息
        DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", user))
                .add(Restrictions.eq("userByAttentionedUserId", currentCourse.getUser()));
        List<Attention> attentionOfCurrentToCreator = (List<Attention>) courseService.queryAllOfCondition(Attention.class, detachedCriteria4);
        // 当前用户是否关注创建者
        int isAttention = 0;
        if (!attentionOfCurrentToCreator.isEmpty()) {
            isAttention = 1;
        }
        // FIXME
        System.out.println("Test 4===============attentionOfCurrentToCreator.size=" + attentionOfCurrentToCreator.size());

        // Test 5-1
        // 创建者的粉丝
        DetachedCriteria detachedCriteria5_1 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByAttentionedUserId", currentCourse.getUser()));
        // 查询创建者的粉丝
        List<Attention> fansOfCreatorList = (List<Attention>) courseService.queryAllOfCondition(Attention.class, detachedCriteria5_1);
        // 准备粉丝数据
        int fansNum = fansOfCreatorList.size();

        // FIXME
        System.out.println("Test 5-1 ===============fansOfCreatorList.size=" + fansOfCreatorList.size());

        // Test 5-2
        // 创建者的关注
        DetachedCriteria detachedCriteria5_2 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", currentCourse.getUser()));
        // 查询创建者的关注
        List<Attention> followOfCreatorList = (List<Attention>) courseService.queryAllOfCondition(Attention.class, detachedCriteria5_2);
        // 准备关注数据
        int followNum = followOfCreatorList.size();
        // FIXME
        System.out.println("Test 5-2===============followOfCreatorList =" + followOfCreatorList.size());

        //6-评论信息
        DetachedCriteria detachedCriteria6 = DetachedCriteria.forClass(Comment.class)
                .add(Restrictions.eq("commentObject", childrenId))
                .add(Restrictions.isNull("comment"))
                .addOrder(Order.asc("commentDate"));
        List<Comment> singleCommentList = (List<Comment>) courseService.queryAllOfCondition(Comment.class, detachedCriteria6);

        DetachedCriteria detachedCriteria7 = DetachedCriteria.forClass(Comment.class)
                .add(Restrictions.eq("commentObject", childrenId))
                .add(Restrictions.isNotNull("comment"))
                .addOrder(Order.asc("commentDate"));
        List<Comment> nestedCommentList = (List<Comment>) courseService.queryAllOfCondition(Comment.class, detachedCriteria7);


        // 7-课时资源信息
        DetachedCriteria detachedCriteria8 = DetachedCriteria.forClass(Resource.class)
                .add(Restrictions.eq("resourceObject", childrenId));
        List<Resource> resources = (List<Resource>) courseService.queryAllOfCondition(Resource.class, detachedCriteria8);
        Resource resource = resources.get(0);

        // 8-课程对应的课时列表
        DetachedCriteria detachedCriteria9 = DetachedCriteria.forClass(Course.class)
                .add(Restrictions.eq("course", currentCourse.getCourse()))
                .addOrder(Order.asc("lessonNum"));
        List<Course> lessonList = (List<Course>) courseService.queryAllOfCondition(Course.class, detachedCriteria9);

        // 9-当前用户对于本课时的学习状态
        DetachedCriteria detachedCriteria10 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("course", lesson))
                .add(Restrictions.eq("userPosition", "学员"));
        String lessonLearnState = "开始学习";
        List<UserCourse> queryTempList2 = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, detachedCriteria10);
        if (!queryTempList2.isEmpty()) {
            lessonLearnState = queryTempList2.get(0).getLearnState();
        }

        int studentNum = userLearnCourseList.size() + userEndCourseList.size();
        lesson.setScanNum(lesson.getScanNum() + 1);

        // Test14 准备TencentVideoId
        String  resourceObject = courseService.findById(Course.class, childrenId).getCourseId();
        DetachedCriteria detachedCriteria14 = DetachedCriteria.forClass(Resource.class)
                .add(Restrictions.eq("resourceObject", resourceObject));
        Resource temResource = resourceService.queryAllOfCondition(Resource.class, detachedCriteria14).get(0);
        String fileId = videoService.findById(Video.class, temResource.getResourceId()).getTencentVideoId();

        // FIXME
        System.out.println("======================resourceObject="+resourceObject);
        // FIXME
        System.out.println("======================fileId="+fileId);

        // FIXME
        log.info("==============程序执行到此============");
        req.setAttribute("lesson", lesson);
        req.setAttribute("currentCourse", currentCourse);
        req.setAttribute("userLearnCourseList", userLearnCourseList);
        req.setAttribute("userEndCourseList", userEndCourseList);
        req.setAttribute("fansNum", fansNum);
        req.setAttribute("followNum", followNum);
        req.setAttribute("studentNum", studentNum);
        req.setAttribute("isAttention", isAttention);
        req.setAttribute("learning", userLearnCourseList.size());
        req.setAttribute("learned", userEndCourseList.size());
        req.setAttribute("user", user);
        req.setAttribute("singleCommentList", singleCommentList);
        req.setAttribute("nestedCommentList", nestedCommentList);
        req.setAttribute("commentNum", singleCommentList.size() + nestedCommentList.size());
        req.setAttribute("resource", resource);
        req.setAttribute("lessonList", lessonList);
        req.setAttribute("lessonNum", lessonList.size());
        req.setAttribute("lessonLearnState", lessonLearnState);
        return new ModelAndView("/course/lesson", "fileId", fileId);
    }

    @CheckAuthority(name = "回复话题")
    @RequestMapping("createReply.htm")
    public ModelAndView createReply(HttpServletRequest req, HttpServletResponse res) {
        String courseTimeId = ServletRequestUtils.getStringParameter(req, "courseTimeId", "");
        String content = ServletRequestUtils.getStringParameter(req, "content", "");
        String parentId = ServletRequestUtils.getStringParameter(req, "parentId", "");
        User user = (User) req.getSession().getAttribute("user");

        Comment comment = new Comment();
        comment.setCommentId(UUIDGenerator.randomUUID());
        comment.setCommentDate(new Date());
        comment.setCommentContent(content);
        comment.setCommentObject(courseTimeId);
        comment.setUser(user);
        comment.setType("课时");
        if (!parentId.equals(null)) {
            comment.setComment(courseService.findById(Comment.class, parentId));
        }
        courseService.save(comment);
        return new ModelAndView("redirect:lessonPage.htm?childrenId=" + courseTimeId);

    }

    @RequestMapping("startLearn.htm")
    public ModelAndView startLearn(HttpServletRequest req, HttpServletResponse res) {
        // 本课时学习状态
        log.info("==============进入startLearn===========");
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        User user = (User) req.getSession().getAttribute("user");
        Course course = courseService.findById(Course.class, courseId);
        UserCourse userCourse = new UserCourse();
        userCourse.setCourse(course);
        userCourse.setLearnState("学习中");
        userCourse.setStartDate(new Date());
        userCourse.setUser(user);
        userCourse.setUserCourseId(UUIDGenerator.randomUUID());
        userCourse.setUserPosition("学员");
        courseService.save(userCourse);
        return new ModelAndView("redirect:lessonPage.htm?childrenId=" + courseId);
    }

    @RequestMapping("startStudy.htm")
    public ModelAndView startStudy(HttpServletRequest req, HttpServletResponse res) {
        // 本课程的学习状态
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        User user = (User) req.getSession().getAttribute("user");
        Course course = courseService.findById(Course.class, courseId);
        UserCourse userCourse = new UserCourse();
        userCourse.setCourse(course);
        userCourse.setLearnState("学习中");
        userCourse.setStartDate(new Date());
        userCourse.setUser(user);
        userCourse.setUserCourseId(UUIDGenerator.randomUUID());
        userCourse.setUserPosition("学员");
        courseService.save(userCourse);
        return new ModelAndView("redirect:courseDetailPage.htm?courseId=" + courseId);

    }

    @RequestMapping("haveLeaned.htm")
    public ModelAndView haveLeaned(HttpServletRequest req, HttpServletResponse res) {
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        User user = (User) req.getSession().getAttribute("user");
        Course course = courseService.findById(Course.class, courseId);
        DetachedCriteria criteria = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("course", course))
                .add(Restrictions.eq("userPosition", "学员"));
        List<UserCourse> courses = (List<UserCourse>) courseService.queryAllOfCondition(UserCourse.class, criteria);
        UserCourse userCourse = courses.get(0);
        userCourse.setLearnState("已学");
        courseService.update(userCourse);
        return new ModelAndView("redirect:lessonPage.htm?childrenId=" + courseId);
    }
}


