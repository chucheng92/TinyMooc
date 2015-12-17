package com.tinymooc.handler.course.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.authority.annotation.CheckAuthority;
import com.tinymooc.common.domain.*;
import com.tinymooc.common.tag.pageTag.PageHelper;
import com.tinymooc.handler.course.service.CourseService;
import com.tinymooc.handler.label.service.LabelService;
import com.tinymooc.handler.user.service.UserService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;

    @Autowired
	private LabelService labelService;

    @Autowired
    private UserService userService;

    private String labels;

    private String previousLabels;
	
	@RequestMapping("createCoursePage.htm")
	public ModelAndView createCoursePage(HttpServletRequest req,HttpServletResponse res){		
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(DataDic.class)
				.add(Restrictions.eq("dicKey", "专业分类"));
		List<DataDic> dataDicList = (List<DataDic>)courseService.queryAllOfCondition(DataDic.class, detachedCriteria);

		req.setAttribute("dataDicList", dataDicList);
		return new ModelAndView("/course/courseCreate");
	}

    /**
     * 创建课程
     * @param req
     * @param res
     * @return
     */
	@RequestMapping("createCourse.htm")
	public ModelAndView createCourse(HttpServletRequest req,HttpServletResponse res){	
		User user=(User)req.getSession().getAttribute("user");
		String courseTitle=ServletRequestUtils.getStringParameter(req, "courseTitle","");
		String courseIntro=ServletRequestUtils.getStringParameter(req, "courseIntro","");
	    String type=ServletRequestUtils.getStringParameter(req, "type","");	   	    
	    Course course=new Course();
	    course.setCourseId(UUIDGenerator.randomUUID());
	    course.setApplyDate(new Date());
	    course.setCourseIntro(courseIntro);
	    course.setCourseState("申请中");
	    course.setType(type);
	    course.setScanNum(0);
	    course.setCourseTitle(courseTitle);
        courseService.save(course);
	    UserCourse userCourse=new UserCourse();
	    userCourse.setUserCourseId(UUIDGenerator.randomUUID());
	    userCourse.setUserPosition("创建者");
	    userCourse.setCourse(course);
	    userCourse.setUser(user);
        courseService.save(userCourse);
	    
		return new ModelAndView("redirect:courseList.htm");
	}
	
	@RequestMapping("createLessonPage.htm")
	public ModelAndView createLessonPage(HttpServletRequest req,HttpServletResponse res){		
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId","");
		Course course=courseService.findById(Course.class, courseId);
		DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserCourse.class)
				.createCriteria("course")
				.add(Restrictions.eq("course", course));
		List<UserCourse> userCourseList = (List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, detachedCriteria1);
        // FIXME
        System.out.println("===============userCourseList="+userCourseList.size());

        int lessons = userCourseList.size();

		req.setAttribute("course", course);
		req.setAttribute("lessons", lessons);	
		return new ModelAndView("/course/createLesson");
	}
	
	@RequestMapping("createLesson.htm")
	public ModelAndView createLesson(HttpServletRequest req,HttpServletResponse res){	
		User user=(User)req.getSession().getAttribute("user");	
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId","");
		String courseTitle=ServletRequestUtils.getStringParameter(req, "courseTitle","");
		String courseIntro=ServletRequestUtils.getStringParameter(req, "courseIntro","");	   		   
	    String content=ServletRequestUtils.getStringParameter(req, "content","");
	    String lessonNum=ServletRequestUtils.getStringParameter(req, "lessonNum","");
	    Course course=new Course();
	    course.setCourseId(UUIDGenerator.randomUUID());
	    course.setApplyDate(new Date());
	    course.setCourseIntro(courseIntro);
	    course.setCourseState("申请中");	    
	    course.setScanNum(0);
	    course.setCourseTitle(courseTitle);
	    course.setLessonNum(Integer.parseInt(lessonNum));
	    course.setCourse(courseService.findById(Course.class, courseId));
        courseService.save(course);

	    UserCourse userCourse=new UserCourse();
	    userCourse.setUserCourseId(UUIDGenerator.randomUUID());
	    userCourse.setUserPosition("创建者");
	    userCourse.setCourse(course);
	    userCourse.setUser(user);
        courseService.save(userCourse);
	    
	    Resource resource=new Resource();
		resource.setResourceId(UUIDGenerator.randomUUID());	
		resource.setResourceObject(course.getCourseId());
        courseService.save(resource);
	  
	    ImageText imageText=new ImageText();
		imageText.setResourceId(resource.getResourceId());
		imageText.setContent(content);
		imageText.setResource(resource);
        courseService.save(imageText);
	    
	  		 
		return new ModelAndView("redirect:courseList.htm");
	}

    /**
     * 课程列表
     * @param req
     * @param res
     * @return
     */
	@SuppressWarnings("unchecked")
	@RequestMapping("courseList.htm")
	public ModelAndView courseList(HttpServletRequest req,HttpServletResponse res){	
		User user=(User)req.getSession().getAttribute("user");				
	    DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserCourse.class)
	    		.add(Restrictions.eq("user",user))
                .add(Restrictions.eq("userPosition", "创建者"))
                .createCriteria("course")
                .add(Restrictions.isNull("course"));
	    int pageSize=5;
		int totalPage = courseService.countTotalPage(detachedCriteria,  pageSize);
		PageHelper.forPage(totalPage, pageSize);
	    List<UserCourse> myCreatedCourseList = (List<UserCourse>)courseService.getByPage(detachedCriteria, pageSize);

        int credit = user.getCredit();
        // FIXME
        System.out.println("========credit=====" + credit);

        Level myLevel = userService.getUserLevel(credit);
        System.out.println("===myLevel==="+myLevel.getLv());

        req.setAttribute("myLevel", myLevel);
        req.setAttribute("myCreatedCourseList", myCreatedCourseList);

        return new ModelAndView("/course/myCourse");
	}
	
	@RequestMapping("courseDetailPage.htm")
	public ModelAndView courseDetailPage(HttpServletRequest req,HttpServletResponse res){
        // FIXME
        System.out.println("============START 进入courseDetailPage.htm===============");

		String courseId=ServletRequestUtils.getStringParameter(req, "courseId", "");
	    Course course=courseService.findById(Course.class, courseId);
        course.setScanNum(course.getScanNum()+1);
        courseService.update(course);

		User user=(User)req.getSession().getAttribute("user");

        // Test 1
		//查询该课程的用户课程信息（能得到创建者信息）
		DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserCourse.class)
				.add(Restrictions.eq("userPosition","创建者"))
				.add(Restrictions.eq("course", course));
        // currentCourse 针对当前课程的创建者
        UserCourse currentCourse = courseService.queryAllOfCondition(UserCourse.class, detachedCriteria1).get(0);
        // FIXME
        if (currentCourse.getLearnState()==null) {
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
				.add(Restrictions.eq("userPosition","学员"))
				.add(Restrictions.eq("course", course))	
				.add(Restrictions.eq("learnState", "学习中"))
				.addOrder(Order.desc("startDate"));
        // 学员学习中
        List<UserCourse> userLearnCourseList = (List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, detachedCriteria2);

        // FIXME
        System.out.println("Test 2===============userLearnCourseList .size="+ userLearnCourseList .size());

        // Test 3
		//按开始学习时间降序排列查询该课程用户学习状态为"已学"的用户课程信息
		DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(UserCourse.class)
				.add(Restrictions.eq("userPosition","学员"))
				.add(Restrictions.eq("course", course))
				.add(Restrictions.eq("learnState", "已学"))
				.addOrder(Order.desc("startDate"));
        // 学员已学
        List<UserCourse> userEndCourseList = (List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, detachedCriteria3);
        // FIXME
        System.out.println("Test 3===============userEndCourseList.size="+userEndCourseList.size());
        // 准备学员数据
        int studentNum= userLearnCourseList.size()+userEndCourseList.size();

        // Test 4
		// 查询该课程创建者其他创建的用户课程
		DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(UserCourse.class)
				.add(Restrictions.eq("userPosition","创建者"))
				.add(Restrictions.eq("user", currentCourse.getUser()));
        // 查询该课程创建者创建的所有课程
        List<UserCourse> creatorCourseList =(List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, detachedCriteria4);
        // 准备课程数数据
        int creatorCourseNum = creatorCourseList.size();
        // FIXME
        System.out.println("Test 4===============creatorCourseList.size="+ creatorCourseList.size());

        // Test 5
		// 查询关注者为登录用户，被关注者为课程创建者的关注信息
        // 查询当前用户与创建者的关注信息
		DetachedCriteria detachedCriteria5 = DetachedCriteria.forClass(Attention.class)
				.add(Restrictions.eq("userByUserId", user))
				.add(Restrictions.eq("userByAttentionedUserId", currentCourse.getUser()));
        List<Attention> attentionOfCurrentToCreator = (List<Attention>)courseService.queryAllOfCondition(Attention.class, detachedCriteria5);
        // 当前用户是否关注创建者
        int isAttention= 0;
        if(!attentionOfCurrentToCreator.isEmpty()){
            isAttention= 1;
        }

        // FIXME
        System.out.println("Test 5===============attentionOfCurrentToCreator.size="+ attentionOfCurrentToCreator.size());

        // Test 6-1
		// 查询课程创建者的关注信息
        // 创建者的粉丝
		DetachedCriteria detachedCriteria6_1 = DetachedCriteria.forClass(Attention.class)
				.add(Restrictions.eq("userByAttentionedUserId", currentCourse.getUser()));
        // 查询创建者的粉丝
        List<Attention> fansOfCreatorList = (List<Attention>)courseService.queryAllOfCondition(Attention.class, detachedCriteria6_1);
        // 准备粉丝数据
        int fansNum = fansOfCreatorList.size();

        // FIXME
        System.out.println("Test 6-1 ===============fansOfCreatorList.size="+ fansOfCreatorList.size());

        // Test 6-2
        // 创建者的关注
        DetachedCriteria detachedCriteria6_2 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", currentCourse.getUser()));
        // 查询创建者的关注
        List<Attention> followOfCreatorList = (List<Attention>)courseService.queryAllOfCondition(Attention.class, detachedCriteria6_2);
        // 准备关注数据
        int followNum = followOfCreatorList.size();
        // FIXME
        System.out.println("Test 6-2===============followOfCreatorList ="+ followOfCreatorList .size());

        // Test 7
        // 该门课程的标签
	    DetachedCriteria detachedCriteria7 = DetachedCriteria.forClass(LabelObject.class)
                .add(Restrictions.eq("objectType", "course"))
	        	.add(Restrictions.eq("objectId", currentCourse.getCourse().getCourseId()));
        // 该门课程的标签
        List<LabelObject> labelObjectList = (List<LabelObject>)courseService.queryAllOfCondition(LabelObject.class, detachedCriteria7);
        // FIXME
        System.out.println("Test 7===============labelObjectList ="+ labelObjectList.size());

        // Test 8
        // 该门课程的评分
	    DetachedCriteria detachedCriteria8 = DetachedCriteria.forClass(Grade.class).add(Restrictions.eq("gradeObject", courseId));
        List<Grade> gradeList = courseService.queryAllOfCondition(Grade.class, detachedCriteria8);
        double userGrade =0.0;
        if(gradeList.size()!=0){
            userGrade = courseService.queryGrade(courseId);
        }else{
            userGrade =0.0;
        }
        // FIXME
        System.out.println("Test 8===============userGrade="+userGrade);


        // Test 9
	    // 查询当前用户针对本课程的学习状态
	    DetachedCriteria  detachedCriteria9 = DetachedCriteria.forClass(UserCourse.class)
	    		.add(Restrictions.eq("user", user))
	    		.add(Restrictions.eq("course", course))
	    		.add(Restrictions.eq("userPosition", "学员"));
	    String currentState = "开始学习";
	    List<UserCourse> tempList = (List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, detachedCriteria9);
	    // FIXME
        System.out.println("Test 9===============tempList.size="+ tempList.size());

        if(!tempList.isEmpty()) {
            currentState = tempList.get(0).getLearnState();
	    }

        // FIXME
        System.out.println("==============程序执行到CourseController ->Test9===============");

        // Test 10
	    //查询该课程对应所有的课时及用户学习状态
	    DetachedCriteria  detachedCriteria10 = DetachedCriteria.forClass(Course.class)
	    		.add(Restrictions.eq("course", course))
	    		.addOrder(Order.asc("applyDate"));
	    List<Course> tempCourseList = (List<Course>)courseService.queryAllOfCondition(Course.class, detachedCriteria10);
        // FIXME
        System.out.println("Test10 ===============tempCourseList.size="+tempCourseList.size());

        List<UserCourse> userCourseList=new ArrayList<UserCourse>();
	    String learnState="未学";
	    
	    for(int i=0; i<tempCourseList.size(); i++){
	    	UserCourse newCourse = new UserCourse();
	    	DetachedCriteria criteria11 = DetachedCriteria.forClass(UserCourse.class)
	    			.add(Restrictions.eq("user", user))
	    			.add(Restrictions.eq("course", tempCourseList.get(i)))
	    			.add(Restrictions.eq("userPosition", "学员"));
	    	List<UserCourse> localTempCourseList = (List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, criteria11);
            // FIXME
            System.out.println("Test11 ===============localTempCourseList="+localTempCourseList .size());

	    	if(! localTempCourseList.isEmpty()){
                learnState= localTempCourseList.get(0).getLearnState();
	        }
            newCourse.setCourse(tempCourseList.get(i));
            newCourse.setLearnState(learnState);
            userCourseList.add(newCourse);
	    }
        // Test UserCourseList
        // FIXME
        System.out.println("Test 章节===============UserCourseList="+userCourseList .size());

        // 准备章节数据
        int lessonNum = userCourseList.size();
        // Test12
        // FIXME
        System.out.println("Test 12=============lessonNum="+lessonNum);

        int picSuffix = 0;
        if (currentCourse.getCourse().getCourseId().length()<=2) {
            picSuffix = Integer.parseInt(currentCourse.getCourse().getCourseId());
        } else {
            picSuffix = Integer.parseInt(currentCourse.getCourse().getCourseId().substring(0, 7), 16) % 10;
        }

        // Test13
        // FIXME
        System.out.println("Test 13============picSuffix="+picSuffix);

        // 封装信息
        req.setAttribute("currentCourse", currentCourse);
		req.setAttribute("fansNum", fansNum);
		req.setAttribute("followNum", followNum);
        req.setAttribute("userGrade",  userGrade);
		req.setAttribute("studentNum", studentNum);
		req.setAttribute("creatorCourseNum", creatorCourseNum);
		req.setAttribute("isAttention", isAttention);
		req.setAttribute("userLearnCourseList",  userLearnCourseList);
		req.setAttribute("userEndCourseList", userEndCourseList);
		req.setAttribute("user", user);
		req.setAttribute("lessonNum", lessonNum);
		req.setAttribute("labelList", labelObjectList);
		req.setAttribute("currentState", currentState);
		req.setAttribute("userCourseList", userCourseList);
		return new ModelAndView("/course/courseHome", "picSuffix", picSuffix);
	}

    /**
     * 管理课程
     * @param req
     * @param res
     * @return
     */
	@RequestMapping("manageCoursePage.htm")
	public ModelAndView manageCoursePage(HttpServletRequest req,HttpServletResponse res){		
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId", "");
        Course course=courseService.findById(Course.class, courseId);
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(DataDic.class)
				.add(Restrictions.eq("dicKey", "专业分类"));
		List<DataDic> dataDicList = (List<DataDic>)courseService.queryAllOfCondition(DataDic.class, detachedCriteria);

        req.setAttribute("course", course);
        req.setAttribute("dataDicList", dataDicList);
		return new ModelAndView("/course/manageCourse");
	}
	
	@RequestMapping("manageCourse.htm")
	public ModelAndView manageCourse(HttpServletRequest req,HttpServletResponse res){		
		String courseTitle=ServletRequestUtils.getStringParameter(req, "courseTitle", "");
		String courseIntro=ServletRequestUtils.getStringParameter(req, "courseIntro", "");
		String type=ServletRequestUtils.getStringParameter(req, "type", "");
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId", "");   
		Course course=courseService.findById(Course.class, courseId);
		course.setCourseTitle(courseTitle);
		course.setCourseIntro(courseIntro);
		course.setType(type);
        courseService.update(course);
		return new ModelAndView("/include/outSuccess");
	}
	
	
	@RequestMapping("lessonPage.htm")
	public ModelAndView lessonPage(HttpServletRequest req,HttpServletResponse res){		
        String childrenId=ServletRequestUtils.getStringParameter(req, "childrenId", "");
        User user=(User)req.getSession().getAttribute("user");
        Course course = courseService.findById(Course.class, childrenId);

        //查询该课时对应课程的用户课程信息
        DetachedCriteria criteria=DetachedCriteria.forClass(UserCourse.class)
        		.add(Restrictions.eq("course", course.getCourse()))
        		.add(Restrictions.eq("userPosition", "创建者"));

        List<UserCourse> userCourses=(List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, criteria);
        UserCourse userCourse=userCourses.get(0);
          //按开始学习时间降序排列查询该课程用户学习状态为"学习中"的用户课程信息
      		DetachedCriteria criteria2=DetachedCriteria.forClass(UserCourse.class)
      				.add(Restrictions.eq("userPosition","学员"))
      				.add(Restrictions.eq("course", course.getCourse()))	
      				.add(Restrictions.eq("learnState", "学习中"))
      				.addOrder(Order.desc("startDate"));
            //按开始学习时间降序排列查询该课程用户学习状态为"已学"的用户课程信息
    		DetachedCriteria criteria3=DetachedCriteria.forClass(UserCourse.class)
    				.add(Restrictions.eq("userPosition","学员"))
    				.add(Restrictions.eq("course", course.getCourse()))
    				.add(Restrictions.eq("learnState", "已学"))
    				.addOrder(Order.desc("startDate")); 
           //查询关注者为登录用户，被关注着为课程创建者的关注信息
    		DetachedCriteria criteria4=DetachedCriteria.forClass(Attention.class)
    				.add(Restrictions.eq("userByUserId", user))
    				.add(Restrictions.eq("userByAttentionedUserId", userCourse.getUser()));	
    		//查询被关注着为课程创建者的关注信息
    		DetachedCriteria criteria5=DetachedCriteria.forClass(Attention.class)
    				.add(Restrictions.eq("userByAttentionedUserId", userCourse.getUser()));
    		//评论信息
    		DetachedCriteria criteria6=DetachedCriteria.forClass(Comment.class)
    				.add(Restrictions.eq("commentObject", childrenId))
    				.add(Restrictions.isNull("comment"))
    				.addOrder(Order.asc("commentDate"));
    		DetachedCriteria criteria7=DetachedCriteria.forClass(Comment.class)
    				.add(Restrictions.eq("commentObject", childrenId))
    				.add(Restrictions.isNotNull("comment"))
    				.addOrder(Order.asc("commentDate"));
    		//课时资源信息
    		DetachedCriteria criteria8=DetachedCriteria.forClass(Resource.class)
    				.add(Restrictions.eq("resourceObject", childrenId));
    		//课程对应的课时列表
    		DetachedCriteria criteria9=DetachedCriteria.forClass(Course.class)
    				.add(Restrictions.eq("course", userCourse.getCourse()))
    				.addOrder(Order.asc("lessonNum"));
    		 DetachedCriteria criteria0=DetachedCriteria.forClass(UserCourse.class)
    		    		.add(Restrictions.eq("user", user))
    		    		.add(Restrictions.eq("course", course))
    		    		.add(Restrictions.eq("userPosition", "学员"));
    		    String state="开始学习";
    		    List<UserCourse> courses=(List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, criteria0);
    		    if(!courses.isEmpty()){
    		    	state=courses.get(0).getLearnState();
    		    }
    		List<UserCourse> userCourses2=(List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, criteria2);
    		List<UserCourse> userCourses3=(List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, criteria3);
    		List<Attention> attentions=(List<Attention>)courseService.queryAllOfCondition(Attention.class, criteria4);
    		List<Attention> attentions2=(List<Attention>)courseService.queryAllOfCondition(Attention.class, criteria5);
    		List<Comment> comments=(List<Comment>)courseService.queryAllOfCondition(Comment.class, criteria6);
    		List<Comment> comments2=(List<Comment>)courseService.queryAllOfCondition(Comment.class, criteria7);
    		List<Resource> resources=(List<Resource>)courseService.queryAllOfCondition(Resource.class, criteria8);
    	    List<Course> lessons=(List<Course>)courseService.queryAllOfCondition(Course.class, criteria9);
    		Resource resource=resources.get(0);
    		int fansNum=attentions2.size();
    		int students=userCourses2.size()+userCourses3.size();
    		int at=0;
    		if(!attentions.isEmpty()){
    			at=1;
    		}
    		course.setScanNum(course.getScanNum()+1);
    		req.setAttribute("course", course);
    		req.setAttribute("userCourse", userCourse);
    		req.setAttribute("userCourses2", userCourses2);
    		req.setAttribute("userCourses3", userCourses3);
    		req.setAttribute("fansNum", fansNum);
    		req.setAttribute("students", students);
    		req.setAttribute("at", at);
    		req.setAttribute("leaning", userCourses2.size());
    		req.setAttribute("leaned", userCourses3.size());
    		req.setAttribute("user", user);
    		req.setAttribute("comments", comments);
    		req.setAttribute("comments2", comments2);
    		req.setAttribute("commentNum", comments.size()+comments2.size());
    		req.setAttribute("resource", resource);
    		req.setAttribute("lessons", lessons);
    		req.setAttribute("lessonNum", lessons.size());
    		req.setAttribute("state", state);
		    return new ModelAndView("/course/lesson");
	}

	@CheckAuthority(name="回复话题")
	@RequestMapping("createReply.htm")
	public ModelAndView createReply(HttpServletRequest req,HttpServletResponse res){		
		String courseTimeId=ServletRequestUtils.getStringParameter(req, "courseTimeId", "");
		String content=ServletRequestUtils.getStringParameter(req, "content", "");
		String parentId=ServletRequestUtils.getStringParameter(req, "parentId", "");
		User user=(User)req.getSession().getAttribute("user");
        Comment comment=new Comment();
        comment.setCommentId(UUIDGenerator.randomUUID());
        comment.setCommentDate(new Date());
        comment.setCommentContent(content);
        comment.setCommentObject(courseTimeId);
        comment.setUser(user);
        comment.setType("课时");
        if(!parentId.equals(null)){
        	comment.setComment(courseService.findById(Comment.class, parentId));
        }
        courseService.save(comment);
		return new ModelAndView("redirect:lessonPage.htm?childrenId="+courseTimeId);
	}
	
	@RequestMapping("startLearn.htm")
	public ModelAndView startLearn(HttpServletRequest req,HttpServletResponse res){		
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId", "");
		User user=(User)req.getSession().getAttribute("user");
		Course course=courseService.findById(Course.class, courseId);
		UserCourse userCourse=new UserCourse();
		userCourse.setCourse(course);
		userCourse.setLearnState("学习中");
		userCourse.setStartDate(new Date());
		userCourse.setUser(user);
		userCourse.setUserCourseId(UUIDGenerator.randomUUID());
		userCourse.setUserPosition("学员");
        courseService.save(userCourse);
		return new ModelAndView("redirect:courseDetailPage.htm?courseId="+courseId);
	}
	
	@RequestMapping("startStudy.htm")
	public ModelAndView startStudy(HttpServletRequest req,HttpServletResponse res){		
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId", "");
		User user=(User)req.getSession().getAttribute("user");
		Course course=courseService.findById(Course.class, courseId);
		UserCourse userCourse=new UserCourse();
		userCourse.setCourse(course);
		userCourse.setLearnState("学习中");
		userCourse.setStartDate(new Date());
		userCourse.setUser(user);
		userCourse.setUserCourseId(UUIDGenerator.randomUUID());
		userCourse.setUserPosition("学员");
        courseService.save(userCourse);
		return new ModelAndView("redirect:lessonPage.htm?childrenId="+courseId);
	}
	
	@RequestMapping("haveLeaned.htm")
	public ModelAndView haveLeaned(HttpServletRequest req,HttpServletResponse res){		
		String courseId=ServletRequestUtils.getStringParameter(req, "courseId", "");
		User user=(User)req.getSession().getAttribute("user");
		Course course=courseService.findById(Course.class, courseId);
		DetachedCriteria criteria=DetachedCriteria.forClass(UserCourse.class)
				.add(Restrictions.eq("user", user))
				.add(Restrictions.eq("course", course))
				.add(Restrictions.eq("userPosition", "学员"));
		List<UserCourse> courses=(List<UserCourse>)courseService.queryAllOfCondition(UserCourse.class, criteria);
		UserCourse userCourse=courses.get(0);
		userCourse.setLearnState("已学");
        courseService.update(userCourse);
		return new ModelAndView("redirect:lessonPage.htm?childrenId="+courseId);
	}
}


