package com.tinymooc.handler.admin.controller;

import java.text.DecimalFormat;
import java.util.*;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tinymooc.common.domain.*;
import com.tinymooc.handler.course.service.CourseService;
import org.hibernate.criterion.*;
import com.tinymooc.authority.annotation.CheckAuthority;
import com.tinymooc.handler.admin.service.AdminService;
import com.tinymooc.handler.video.service.VideoService;
import com.tinymooc.handler.privateMail.PrivateMailService;
import com.tinymooc.util.CSVUtil;
import com.tinymooc.common.tag.pageTag.PageHelper;
import com.tinymooc.util.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {
    @Autowired
    private VideoService videoService;

    @Autowired
    private CourseService courseService;

	@Autowired
	private AdminService admin;
	@Autowired
	private PrivateMailService pmservice;
	/*##################管理员登陆部分##################*/
	@RequestMapping("goAdminLogin.htm")
	public ModelAndView goAdminLogin() {

		return new ModelAndView("/admin/login");
	}
    //课程搜索
    @RequestMapping("searchCourseIndex.htm")
    public ModelAndView searchCourseIndex(HttpServletRequest req, HttpServletResponse res)
            {    List<Course> SlistC = null;
                User user=(User) req.getSession().getAttribute("admin");
                     String path = req.getSession().getServletContext().getRealPath("/");
                System.out.println("路径：" + path);
                if(user==null){
                    return new ModelAndView("redirect:goAdminLogin.htm");
                }else{
               System.out.println("开始搜索了吗？");

        String q = req.getParameter("searchValue");
        System.out.println("搜索的内容" + q);
        DecimalFormat df = new DecimalFormat("#0.000");

        if(courseService.createCourseIndex()){

            long begin = new Date().getTime();
            List<Course> list = courseService.getCourses(q);
            System.out.println("输出list数量：" + list.size());
            long end = new Date().getTime();
            double time = (double) (end - begin) / 1000;
            String timeStr = df.format(time);
                           DetachedCriteria dc = DetachedCriteria.forClass(Course.class);
            Disjunction disjuncteTitle = Restrictions.disjunction();
            disjuncteTitle.add(Restrictions.eq("courseId","!@#$%^&*()"));
              Set<Course> courseSet =  new HashSet<>();


            //将课时想光的课程搜索出来
            for(int i =0;i < list.size();i ++)   {
            Course course = admin.findById(Course.class,list.get(i).getCourseId()) ;
                  if (course.getCourse() !=null )     {
               System.out.println( "输出涉及的课时" + course.getCourse().getCourseId())   ;
                  courseSet.add(course.getCourse()) ;
                  }
                    else {
                    System.out.println("输出涉及的课程" + course.getCourseId());
                    courseSet.add(course) ;
                }
            }
            List<Course> list2 = new LinkedList<>();
            list2.addAll(courseSet);
            courseSet.clear();

           for(int i =0;i<list2.size();i++) {
                disjuncteTitle.add(Restrictions.eq("courseId",list2.get(i).getCourseId()));
                           }
                       dc.add(disjuncteTitle);
            int totalPage=admin.countTotalPage(dc, 9);
            PageHelper.forPage(totalPage, 9);
            SlistC = (List<Course>)admin.getByPage(dc,9);

                     System.out.println("SlistC.size():"+SlistC.size());

            req.setAttribute("totalTime", timeStr);
            req.setAttribute("searchValue",q);
        }
        return new ModelAndView("/admin/searchResult","SearchCourselist", SlistC);
    }
            }


    @RequestMapping("adminLogin.htm")
	public ModelAndView adminLogin(HttpServletRequest request) throws Exception{
		HttpSession hs=request.getSession();
		hs.invalidate();
		String userEmail=ServletRequestUtils.getStringParameter(request, "userEmail");
		String userPswd=ServletRequestUtils.getStringParameter(request, "userPassword");
		String userid=admin.checkByEmailAndPswd(userEmail,userPswd);
		int sumEmail=pmservice.sumMail(userid);
		if(!userid.equals("no-such-person")){
			User userinfo=admin.findById(User.class, userid);
			hs=request.getSession();
			hs.setAttribute("admin", userinfo);  // user->admin
			hs.setAttribute("sumEmail", sumEmail);
			return new ModelAndView("redirect:goAdminHome.htm");
		}else{
			request.setAttribute("note", "邮箱或是密码不正确，请重新输入");
			return new ModelAndView("/admin/login");
		}
	}

	@RequestMapping("goAdminHome.htm")
	public ModelAndView goAdminHome(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute("admin");
		
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			//用户数
			DetachedCriteria dCriteria=DetachedCriteria.forClass(User.class);
			List<User> userlist=admin.queryAllOfCondition(User.class, dCriteria);
			int userSum=userlist.size();
			//课程数
			DetachedCriteria dCriteria1=DetachedCriteria.forClass(Course.class);
			dCriteria1.add(Restrictions.eq("courseState", "批准"));
			dCriteria1.add(Restrictions.isNull("course"));
			List<Course> courselist=admin.queryAllOfCondition(Course.class, dCriteria1);
			int courseSum=courselist.size();
			//小组数
			DetachedCriteria dCriteria2=DetachedCriteria.forClass(Team.class);
			dCriteria2.add(Restrictions.eq("teamState", "批准"));
			List<Team> teamlist=admin.queryAllOfCondition(Team.class, dCriteria2);
			int teamSum=teamlist.size();
			//笔记数
			DetachedCriteria dCriteria3=DetachedCriteria.forClass(Note.class);
			List<Note> notelist=admin.queryAllOfCondition(Note.class, dCriteria3);
			int noteSum=notelist.size();
			//最近操作
			DetachedCriteria dCriteria4=DetachedCriteria.forClass(OperationLog.class);
			dCriteria4.addOrder(Order.desc("logDate"));
			List<OperationLog> logelist=admin.queryMaxNumOfCondition(OperationLog.class, dCriteria4, 5);
			//最新课程
			DetachedCriteria dCriteria5=DetachedCriteria.forClass(Course.class);
			dCriteria5.add(Restrictions.eq("courseState", "批准"));
			dCriteria5.add(Restrictions.isNull("course"));
			dCriteria5.addOrder(Order.desc("applyDate"));
			List<Course> courselist1=admin.queryMaxNumOfCondition(Course.class, dCriteria5, 5);
			
			//最新小组
			DetachedCriteria dCriteria6=DetachedCriteria.forClass(Team.class);
			dCriteria6.add(Restrictions.eq("teamState", "批准"));
			dCriteria6.addOrder(Order.desc("applyDate"));
			List<Team> teamlist1=admin.queryMaxNumOfCondition(Team.class, dCriteria6, 5);
			
			//最新笔记
			DetachedCriteria dCriteria7=DetachedCriteria.forClass(Note.class);
			dCriteria7.addOrder(Order.desc("addDate"));
			List<Note> notelist1=admin.queryMaxNumOfCondition(Note.class, dCriteria7, 5);
			
			request.setAttribute("userSum", userSum);
			request.setAttribute("courseSum", courseSum);
			request.setAttribute("teamSum", teamSum);
			request.setAttribute("noteSum", noteSum);
			request.setAttribute("logelist", logelist);
			request.setAttribute("courselist1", courselist1);
			request.setAttribute("teamlist1", teamlist1);
			request.setAttribute("notelist1", notelist1);
			return new ModelAndView("/admin/index");
		}
		
	}
	@RequestMapping("logout1.htm")
	public ModelAndView logout1(HttpServletRequest request,HttpServletResponse response) {
		request.getSession().invalidate();
		return new ModelAndView("redirect:goAdminLogin.htm");
	}
	
	/*##################管理员用户管理##################*/
	@CheckAuthority(name="管理用户")
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToUserManage.htm")
	public ModelAndView turnToUserManage(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
            System.out.println("用户翻页执行1");
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(User.class);
		detachedCriteria.add(Restrictions.ne("userState", "管理员"));
		int pageSize=6;
		int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
		PageHelper.forPage(totalPage, pageSize);
            System.out.println("用户翻页执行2");
		List<User> userList = (List<User>) admin.getByPage(detachedCriteria, pageSize);
            System.out.println("用户翻页执行3");
		return new ModelAndView("/admin/userManage", "userList", userList);}
	}

//    @RequestMapping("deleUser.htm")
//    public  ModelAndView deleUser(HttpServletRequest req,HttpServletResponse res){
//        String userId = ServletRequestUtils.getStringParameter(req, "userId",
//                "");
//        User user = admin.findById(User.class, userId);
//
//
//        System.out.println("删除的用户为：    " + userId );
//        //获取comment表中，该用户（user）关联的对象
//        List<Comment> commentList = admin.queryAllOfCondition(Comment.class,  DetachedCriteria.forClass(Comment.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <commentList.size() ;i ++) {
//            admin.delete(commentList.get(i));
//        }
//
//        //获取favorite表中，该用户（user）关联的对象
//        List<Favorite> favoriteList = admin.queryAllOfCondition(Favorite.class,  DetachedCriteria.forClass(Favorite.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <favoriteList.size() ;i ++) {
//            admin.delete(favoriteList.get(i));
//        }
//
//        //获取grade表中，该用户（user）关联的对象
//        List<Grade> gradeList = admin.queryAllOfCondition(Grade.class,  DetachedCriteria.forClass(Grade.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <gradeList.size() ;i ++) {
//            admin.delete(gradeList.get(i));
//        }
//
//        //获取inform表中，该用户（user）关联的对象
//        List<Inform> InformList = admin.queryAllOfCondition(Inform.class,  DetachedCriteria.forClass(Inform.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <InformList.size() ;i ++) {
//            admin.delete(InformList.get(i));
//        }
//
//        //获取Discuss表中，该用户（user）关联的对象
//        List<Discuss> DiscussList = admin.queryAllOfCondition(Discuss.class,  DetachedCriteria.forClass(Discuss.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <DiscussList.size() ;i ++) {
//            admin.delete(DiscussList.get(i));
//        }
//
//        //获取UserTeam表中，该用户（user）关联的对象
//        List<UserTeam> UserTeamList = admin.queryAllOfCondition(UserTeam.class,  DetachedCriteria.forClass(UserTeam.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <UserTeamList.size() ;i ++) {
//            admin.delete(UserTeamList.get(i));
//        }
//
//        //获取UserCourse表中，该用户（user）关联的对象
//        List<UserCourse> UserCourseList = admin.queryAllOfCondition(UserCourse.class,  DetachedCriteria.forClass(UserCourse.class).add(Restrictions.eq("user",user))) ;
//        for(int i = 0; i <UserCourseList.size() ;i ++) {
//            admin.delete(UserCourseList.get(i));
//        }
//
//
//
//        //删除该用户
//        admin.delete(user);
//
//
//
//
//
//
//
//
//        return new ModelAndView("redirect:turnToUserManage.htm");
//    }
	@RequestMapping("activateAccount.htm")
	public ModelAndView activateAccount(HttpServletRequest req,
			HttpServletResponse res) {
		String userId = ServletRequestUtils.getStringParameter(req, "userId",
				"");
		User user = admin.findById(User.class, userId);
        System.out.println("激活的用户为：    " + user.getUserName());
		user.setUserState("激活");
		admin.update(user);
		return new ModelAndView("redirect:turnToUserManage.htm");
	}



	@RequestMapping("lockAccount.htm")
	public ModelAndView lockAccount(HttpServletRequest req,
			HttpServletResponse res) {
		String userId = ServletRequestUtils.getStringParameter(req, "userId",
				"");
		User user = admin.findById(User.class, userId);
		user.setUserState("锁定");
        System.out.println("锁定的用户为1：    " + user.getUserName());
        System.out.println("锁定的用户为2：    " + user);
		admin.update(user);
		return new ModelAndView("redirect:turnToUserManage.htm");
	}
	/*##################管理员管理公告##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToAnnouncementManage.htm")
	public ModelAndView turnToAnnouncementManage(HttpServletRequest req,
			HttpServletResponse res) {
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Announcement.class)
        		.addOrder(Order.desc("publishDate"));
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<Announcement> announcements=(List<Announcement>) admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/boardManage","announcements",announcements);
	}
	
	@RequestMapping("addAnnouncement.htm")
	public ModelAndView addAnnouncement(HttpServletRequest req,
			HttpServletResponse res) {
        String announcementContent=ServletRequestUtils.getStringParameter(req, "content", "");
        Announcement announcement=new Announcement();
        announcement.setAnnouncementId(UUIDGenerator.randomUUID());
        announcement.setAnnouncementContent(announcementContent);
        announcement.setPublishDate(new Date());
        admin.save(announcement);
		return new ModelAndView("redirect:turnToAnnouncementManage.htm");
	}
	
	@RequestMapping("alterAnnouncement.htm")
	public ModelAndView alterAnnouncement(HttpServletRequest req,
			HttpServletResponse res) {
        String announcementContent=ServletRequestUtils.getStringParameter(req, "alterContent", "");
        String announcementId=ServletRequestUtils.getStringParameter(req, "announcementId", "");
        Announcement announcement=admin.findById(Announcement.class, announcementId);        
        announcement.setAnnouncementContent(announcementContent);
        announcement.setPublishDate(new Date());
        admin.update(announcement);
		return new ModelAndView("redirect:turnToAnnouncementManage.htm");
	}
	@RequestMapping("deletAnnouncement.htm")
	public ModelAndView deletAnnouncement(HttpServletRequest req,
			HttpServletResponse res) {       
        String announcementId=ServletRequestUtils.getStringParameter(req, "announcementId", "");
        Announcement announcement=admin.findById(Announcement.class, announcementId);        
        admin.delete(announcement);
		return new ModelAndView("redirect:turnToAnnouncementManage.htm");
	}
	/*##################管理员管理数据字典##################*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToDictionaryManage.htm")
	public ModelAndView turnToDictionaryManage(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(DataDic.class)
        		.addOrder(Order.asc("dicKey"));
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<DataDic> dataDictionaries=(List<DataDic>)admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/dateDictionManage","dataDictionaries",dataDictionaries);}
	}
	
	@RequestMapping("addIterm.htm")
	public ModelAndView addIterm(HttpServletRequest req,
			HttpServletResponse res) {
       String inputKey=ServletRequestUtils.getStringParameter(req, "inputKey", "");
       String inputValue=ServletRequestUtils.getStringParameter(req, "inputValue", "");
       String inputIntro=ServletRequestUtils.getStringParameter(req, "inputIntro", "");
       DataDic dataDictionary=new DataDic();
       dataDictionary.setDicId(UUIDGenerator.randomUUID());
       dataDictionary.setDicKey(inputKey);
       dataDictionary.setDicValue(inputValue);
       dataDictionary.setIntro(inputIntro);
       admin.save(dataDictionary);
		return new ModelAndView("redirect:turnToDictionaryManage.htm");
	}
	
	@RequestMapping("alterIterm.htm")
	public ModelAndView alterIterm(HttpServletRequest req,
			HttpServletResponse res) {
       String alterKey=ServletRequestUtils.getStringParameter(req, "alterKey", "");
       String alterValue=ServletRequestUtils.getStringParameter(req, "alterValue", "");
       String alterIntro=ServletRequestUtils.getStringParameter(req, "alterIntro", "");
       String itermId=ServletRequestUtils.getStringParameter(req, "itermId", "");

       DataDic dataDictionary=admin.findById(DataDic.class, itermId);
       dataDictionary.setDicKey(alterKey);
       dataDictionary.setDicValue(alterValue);
       dataDictionary.setIntro(alterIntro);
       admin.update(dataDictionary);
		return new ModelAndView("redirect:turnToDictionaryManage.htm");
	}
	
	@RequestMapping("deletIterm.htm")
	public ModelAndView deletIterm(HttpServletRequest req,
			HttpServletResponse res) {
       String itermId=ServletRequestUtils.getStringParameter(req, "itermId", "");
       DataDic dataDictionary=admin.findById(DataDic.class, itermId);
       admin.delete(dataDictionary);
		return new ModelAndView("redirect:turnToDictionaryManage.htm");
	}
	
	
	
	/*##################管理员管理友情链接##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToFriendLinkManage.htm")
	public ModelAndView turnToFriendLinkManage(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(FriendliLink.class);
        		
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<FriendliLink> friendliLink=(List<FriendliLink>)admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/friendLinkManage","friendLink",friendliLink);}
	}
	
	@RequestMapping("addFriendLink.htm")
	public ModelAndView addFriendLink(HttpServletRequest req,
			HttpServletResponse res)throws Exception {
       String linkName=ServletRequestUtils.getStringParameter(req, "linkName", "");
       String url=ServletRequestUtils.getStringParameter(req, "url", "");
       
       FriendliLink friendLink=new FriendliLink();
       friendLink.setFriendlyLinkId(UUIDGenerator.randomUUID());
       friendLink.setLinkName(linkName);
       friendLink.setUrl(url);
     
       admin.save(friendLink);
		return new ModelAndView("redirect:turnToFriendLinkManage.htm");
	}
	
	@RequestMapping("alterFriendLink.htm")
	public ModelAndView alterFriendLink(HttpServletRequest req,
			HttpServletResponse res) {
       String linkName=ServletRequestUtils.getStringParameter(req, "linkName", "");
       String url=ServletRequestUtils.getStringParameter(req, "url", "");
    
       String friendlyLinkId=ServletRequestUtils.getStringParameter(req, "friendlyLinkId", "");

       FriendliLink friendLink=admin.findById(FriendliLink.class, friendlyLinkId);
       friendLink.setLinkName(linkName);
       friendLink.setUrl(url);
       
       admin.update(friendLink);
		return new ModelAndView("redirect:turnToFriendLinkManage.htm");
	}
	
	@RequestMapping("deletFriendLink.htm")
	public ModelAndView deletFriendLink(HttpServletRequest req,
			HttpServletResponse res) {
       String friendlyLinkId=ServletRequestUtils.getStringParameter(req, "friendlyLinkId", "");
       FriendliLink friendLink=admin.findById(FriendliLink.class, friendlyLinkId);
       admin.delete(friendLink);
		return new ModelAndView("redirect:turnToFriendLinkManage.htm");
	}
	
	/*##################管理员管理举报##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("showInformList.htm")
	public ModelAndView showInformList(HttpServletRequest request) throws Exception{
		DetachedCriteria dCriteria = DetachedCriteria.forClass(Inform.class);
		
		dCriteria.addOrder(Order.desc("informDate"));
		int pageSize = 4;
		int totalPage = admin.countTotalPage(dCriteria, pageSize);
		PageHelper.forPage(totalPage, pageSize);
		
		List<Inform> reportList = (List<Inform>) admin.getByPage(dCriteria, pageSize);
		
		
		return new ModelAndView("/admin/reportManage","reportList",reportList);
	}
	
	@RequestMapping("dealReport.htm")
	public ModelAndView dealReport(HttpServletRequest request) throws Exception{
	
		String informObjectType = ServletRequestUtils.getStringParameter(request, "informType","");
		String informObjectId = ServletRequestUtils.getStringParameter(request, "informObject","");
		String imformId = ServletRequestUtils.getStringParameter(request, "informId","");
		String type = ServletRequestUtils.getStringParameter(request, "type","");
		
		System.out.println("informObjectType++"+informObjectType+"informObjectId++"+informObjectId+"imformId++"+imformId+"type++"+type);
		Inform inform=admin.findById(Inform.class, imformId);
		
		//忽略
		if(type.equals("1")){
			admin.delete(inform);
			return new ModelAndView("redirect:showInformList.htm");
		}
		//接受
		if(type.equals("2")){
			System.out.println("$$$$$$$$$$$$$");
			if(informObjectType.equals("user")){
				User user=admin.findById(User.class, informObjectId);
				user.setUserState("锁定");
				admin.update(user);
				inform.setInformState("已处理");
				admin.update(inform);
				return new ModelAndView("redirect:showInformList.htm");
			}
			if(informObjectType.equals("course")){
				Course course=admin.findById(Course.class, informObjectId);
				course.setCourseState("封禁");
				admin.update(course);
				inform.setInformState("已处理");
				admin.update(inform);
				return new ModelAndView("redirect:showInformList.htm");
			}
			if(informObjectType.equals("note")){
				Note note=admin.findById(Note.class, informObjectId);
				note.setPublic_("封禁");
				admin.update(note);
				inform.setInformState("已处理");
				admin.update(inform);
				return new ModelAndView("redirect:showInformList.htm");
			}
			if(informObjectType.equals("team")){
				Team team=admin.findById(Team.class, informObjectId);
				team.setTeamState("封禁");
				admin.update(team);
				inform.setInformState("已处理");
				admin.update(inform);
				return new ModelAndView("redirect:showInformList.htm");
			}
			
		}
		
		return new ModelAndView("redirect:showInformList.htm");
	}
	/*##################管理员管理 小组##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToTeamManage.htm")
	public ModelAndView turnToTeamManage(HttpServletRequest req) throws Exception{
		
			User user=(User) req.getSession().getAttribute("admin");
			if(user==null){
				
				return new ModelAndView("redirect:goAdminLogin.htm");
			}else{
				
	        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Team.class);
	        detachedCriteria.addOrder(Order.desc("applyDate"));
	        int pageSize=8;
	        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
	        PageHelper.forPage(totalPage, pageSize);
	        List<Team> teamList=(List<Team>)admin.getByPage(detachedCriteria, pageSize);
			return new ModelAndView("/admin/teamManage","teamList",teamList);}
	}
	@RequestMapping("alterTeamState.htm")
	public ModelAndView alterTeamState(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
	
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
		String teamId=req.getParameter("teamId");
		System.out.println(teamId);
		String type=req.getParameter("type");
		
		
		Team team=admin.findById(Team.class, teamId);
		
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(UserTeam.class);
		
		detachedCriteria.add(Restrictions.eq("team", team));
		detachedCriteria.add(Restrictions.eq("userPosition", "组长"));

      //   DetachedCriteria.forClass(Discuss.class).add(Restrictions.eq("team",team));
		//获取userTeam表中，该小组（team）关联的对象
		List<UserTeam> userlist= admin.queryMaxNumOfCondition(UserTeam.class, detachedCriteria, 1);
          //获取discuss表中，该小组（team）关联的对象
        List<Discuss> discussList = admin.queryAllOfCondition(Discuss.class,  DetachedCriteria.forClass(Discuss.class).add(Restrictions.eq("team",team))) ;
		User user1=userlist.get(0).getUser();
		int gold=user1.getGold();
		int credit=user1.getCredit();
		if(type.equals("1")){
			team.setApproveDate(new Date());
			team.setTeamState("批准");
			admin.update(team);
			
			
			user1.setGold(gold+1);
			user1.setCredit(credit+10);
			admin.update(user);
			
			sendAmail(user1, "创建小组成功", "+1", "+10");
			return new ModelAndView("redirect:turnToTeamManage.htm");
		}
		if(type.equals("2")){
			
			team.setTeamState("封禁");
			admin.update(team);
			
			
			user1.setGold(gold-3);
			user1.setCredit(credit-30);
			admin.update(user);
			
			sendAmail(user1, "小组被封禁", "-3", "-30");
			return new ModelAndView("redirect:turnToTeamManage.htm");
		}

         if(type.equals("3")) {
                 System.out.println("删除该小组  :" + teamId);
             //1、删除discuss表中 <== teamId
                for(int i = 0; i <discussList.size() ;i ++) {
                    admin.delete(discussList.get(i));
                }
              //2、删除userteam表 <== teamId
               admin.delete(userlist.get(0));
             //3、删除team
             admin.delete(team);
         }
        
		return new ModelAndView("redirect:turnToTeamManage.htm");
		
		
		}
	}
	
	/*##################管理员发邮件##################*/
	public void sendAmail(User receiver,String action,String gold,String credit){
		
		User sender=admin.findById(User.class, "0");
		String context="尊敬的用户,由于您**"+action+"**,您的学分"+credit+",您的金币"+gold;
		Message message=new Message();
		message.setMessageId(UUIDGenerator.randomUUID());
		message.setMessageState("未读");
		message.setSendDate(new Date());
		message.setContent(context);
		message.setUserByReceiverId(receiver);
		message.setUserBySenderId(sender);
		admin.save(message);
	}

    /*##################管理员管理课程##################*/
    @SuppressWarnings("unchecked")
    @RequestMapping("turnToCourseManage.htm")
    public ModelAndView turnToCourseManage(HttpServletRequest req,
                                           HttpServletResponse res) throws Exception{
        User user=(User) req.getSession().getAttribute("admin");
        if(user==null){

            return new ModelAndView("redirect:goAdminLogin.htm");
        }else{

            DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Course.class);

            detachedCriteria.add(Restrictions.eq("courseState", "申请中"));
            detachedCriteria.add(Restrictions.isNull("course"));
            detachedCriteria.addOrder(Order.desc("applyDate"));

            int pageSize=8;
            int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
            PageHelper.forPage(totalPage, pageSize);
            List<Course> courseList=(List<Course>)admin.getByPage(detachedCriteria, pageSize);
            return new ModelAndView("/admin/courseManage","courseList",courseList);}
    }

	@RequestMapping("turnToLessonManage.htm")
	public ModelAndView turnToLessonManage(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
			
		String courseId=req.getParameter("courseId");
		
		Course course=admin.findById(Course.class, courseId);
		  System.out.println("从课程搜索课时，看size：course.getCourses().size()"+course.getCourses().size());
            System.out.println("从课程搜索课时，看直接输出效果：course.getCourses()"+course.getCourses());
		return new ModelAndView("/admin/courseManage1","course",course);}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToNormalCourse.htm")
	public ModelAndView turnToNormalCourse(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Course.class);
        
        detachedCriteria.add(Restrictions.eq("courseState", "批准"));
        detachedCriteria.add(Restrictions.isNull("course"));
        detachedCriteria.addOrder(Order.desc("applyDate"));
       
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<UserCourse> courseList=(List<UserCourse>)admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/normalCourse","courseList",courseList);}
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToLockCourse.htm")
	public ModelAndView turnToLockCourse(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Course.class);
       
        detachedCriteria.add(Restrictions.eq("courseState", "封禁"));
        detachedCriteria.addOrder(Order.desc("applyDate"));
        detachedCriteria.add(Restrictions.isNull("course"));
        
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<UserCourse> courseList=(List<UserCourse>)admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/lockCourse","courseList",courseList);}
	}

	@RequestMapping("alterCourseState.htm")
	public ModelAndView alterCourseState(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
	
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
		String courseId=req.getParameter("courseId");
		String type=req.getParameter("type");
		
		
		Course course=admin.findById(Course.class, courseId);
//                              //获取当前课时所在课程id
//            System.out.println(" 测试 course.getCourse().getCourseId()" + course.getCourse().getCourseId());
//                                //获取当前课时id
//            System.out.println(" 测试 course.getCourseId()" + course.getCourseId());
//                                   // 获取parentId 对应的Course
//            System.out.println(" 测试 course.getCourse" + course.getCourse());
		if(type.equals("1")){

            //更新cvs
            // FIXME
            System.out.println("====================进入boot.do======================");
         /*--------------------------准备FileId数据------------------------*/
            List<Video> videoList = videoService.queryAll(Video.class);
            String fileId = null;
            int count = 0;
            for (Video v : videoList) {
                String videoId = v.getTencentVideoId();
                // FIXME
                System.out.println("===============videoId="+videoId+"==============");
                if (videoId == null  || videoId.equals("")) {
                    System.out.println("====================进入if======================");
                    count++;
                    String vTitle = v.getVideoUrl().substring(0, v.getVideoUrl().lastIndexOf('.'));
                    //FIXME
                    System.out.println(v.getVideoUrl().lastIndexOf('.'));
                    System.out.println("=================vTitle=" + vTitle);
                    fileId = CSVUtil.core(new File("src/main/videoAddress.csv"), vTitle);
                    // FIXME
                    System.out.println("==================fileId=" + fileId);

                    v.setTencentVideoId(fileId);
                    videoService.update(v);
                    // FIXME
                    System.out.println("==================fileId=" + fileId);
                }
            }

			course.setApproveDate(new Date());
			course.setCourseState("批准");
			admin.update(course);
			return new ModelAndView("redirect:turnToCourseManage.htm");
		}
		if(type.equals("2")){
			course.setCourseState("封禁");
			admin.update(course);
			return new ModelAndView("redirect:turnToCourseManage.htm");
		}
		if(type.equals("3")){
			course.setCourseState("封禁");
			admin.update(course);
			// return new ModelAndView("redirect:turnToLessonManage.htm","courseId",course.getCourse().getCourseId());
            return new ModelAndView("redirect:turnToNormalCourse.htm");
		}
		if(type.equals("4")){
			course.setApproveDate(new Date());
			course.setCourseState("批准");
			admin.update(course);
            return new ModelAndView("redirect:turnToLockCourse.htm");
			// return new ModelAndView("redirect:turnToLessonManage.htm","courseId",course.getCourse().getCourseId());
		}
                  //删除课程  +  课时
            if(type.equals("7")){
//                course.setApproveDate(new Date());
//                course.setCourseState("批准");
                System.out.println("----------" + course.getCourseTitle());

                //1 删除UserCourse表的课程部分
                DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserCourse.class)    //根据课程id，得到usercourse表的id
  //                      .add(Restrictions.eq("courseId", courseId))    ;
//                        .add(Restrictions.eq("userPosition", "创建者"))
                        .createCriteria("course")
                        .add(Restrictions.eq("courseId",courseId));
//                        .add(Restrictions.isNull("course"));
//                DetachedCriteria delCours = DetachedCriteria.forClass(UserCourse.class)                       .

                List<UserCourse> delCourseList = admin.queryAllOfCondition(UserCourse.class, detachedCriteria); //只删除课程，所以这边List只有1个
                UserCourse delCourse = delCourseList.get(0);
                admin.delete(delCourse);
              //2 在couser表找到 该课程对应的课时
                DetachedCriteria delcourse1 = DetachedCriteria.forClass(Course.class)
                        .add(Restrictions.eq("course",course))   ;//course表 course（parentId）为该课程

                //3 删除UserCourse表中 该课程对应的课时
                List<Course> delCourseList1 = admin.queryAllOfCondition(Course.class,delcourse1)      ;
                        for (int i = 0; i < delCourseList1.size();i++) {
                            List<UserCourse> delCourseList11 = admin.queryAllOfCondition(UserCourse.class, DetachedCriteria.forClass(UserCourse.class)
                                    .createCriteria("course")
                                    .add(Restrictions.eq("courseId",delCourseList1.get(i).getCourseId()))); //只删除usercourse表的课时，所以这边List只有1个
                            System.out.println("第 " + i + " 课程:" + delCourseList11.get(0).getUserCourseId());
                            System.out.println("生成列表的大小：" + delCourseList11.size());
                            admin.delete(delCourseList11.get(0));
                            System.out.println("生成列表的大小：" + delCourseList11.size());     //List.get(0)删掉，List.size() 仍为1！！
                           // admin.delete(delCourse);
                        }


                // 4 先删course表中课时
                System.out.println("删除前生成列表的大小：" + delCourseList1.size());
                                 for (int i = 0; i<delCourseList1.size();i++) {
                                     if(delCourseList1.get(i).getLogoUrl() != "/resource/pic/courseLogo/course1.jpg") {
                                     File coursePicDel = new File(delCourseList1.get(i).getLogoUrl())  ;

                                     coursePicDel.getAbsoluteFile().delete();
                                         System.out.println("执行了删除课时操作！！");}
                                                  admin.delete(delCourseList1.get(i) );

                                 }

                // 5 最后删course表中课程
                if(course.getLogoUrl() != "/resource/pic/courseLogo/course1.jpg")  {
                File abc = new File (course.getLogoUrl());
                    abc.getAbsoluteFile().delete();
                    System.out.println("执行了删除课程操作！！");
                }
                admin.delete(course);
                                    System.out.println("删除后生成列表的大小：" + delCourseList1.size());



//                for (int i = 0; i < tempList.size(); i++) {
//                    Message message = tempList.get(i);
//                    message.setMessageState("已读");
//                    privateMailService.update(message);
//                }
//                admin.deleteById(UserCourse.class,courseId);
                return new ModelAndView("redirect:turnToLockCourse.htm");
                // return new ModelAndView("redirect:turnToLessonManage.htm","courseId",course.getCourse().getCourseId());
            }


            if(type.equals("5")){
                course.setCourseState("封禁");
                admin.update(course);
                 return new ModelAndView("redirect:turnToLessonManage.htm","courseId",course.getCourse().getCourseId());

               // return new ModelAndView("redirect:turnToNormalCourse.htm");
            }

            if(type.equals("6")){
                course.setApproveDate(new Date());
                course.setCourseState("批准");
                admin.update(course);
               // return new ModelAndView("redirect:turnToLockCourse.htm");
                 return new ModelAndView("redirect:turnToLessonManage.htm","courseId",course.getCourse().getCourseId());
            }

        
		return new ModelAndView("redirect:turnToLockCourse.htm");
		
		
		}
	
	
	
	}
	
	/*##################管理员管理日志##################*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToLogManage.htm")
	public ModelAndView turnToLogManage(HttpServletRequest req,
			HttpServletResponse res) {
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(OperationLog.class)
        		.addOrder(Order.desc("logDate"));
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<OperationLog> logs=(List<OperationLog>) admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/logManage","logs",logs);
	}
	/*##################管理员管理敏感词汇##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("sensitiveWorlList.htm")
	public ModelAndView sensitiveWordList(HttpServletRequest request) throws Exception{		
		DetachedCriteria dCriteria = DetachedCriteria.forClass(SensitiveWords.class);
		int pageSize = 10;
		int totalPage = admin.countTotalPage(dCriteria, pageSize);
		PageHelper.forPage(totalPage, pageSize);
		List<SensitiveWords> sensitiveWordList = (List<SensitiveWords>) admin.getByPage(dCriteria, pageSize);
		return new ModelAndView("/admin/sensitiveWManage","sensitiveWordList", sensitiveWordList);
	}
	
	@RequestMapping("addSensitiveWord.htm")
	public ModelAndView addSensitiveWord(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String sensitiveWord = ServletRequestUtils.getStringParameter(request, "sensitiveWord", "");
		String replaceWord = ServletRequestUtils.getStringParameter(request, "replaceWord", "");
		SensitiveWords sensitive = new SensitiveWords();
		sensitive.setReplaceWord(replaceWord);
		sensitive.setSensitiveWord(sensitiveWord);
		sensitive.setSensitiveWordsId(UUIDGenerator.randomUUID().toString());
		admin.save(sensitive);
		return new ModelAndView("redirect:sensitiveWorlList.htm");
	}
	
	@RequestMapping("delSensitiveWord.htm")
	public ModelAndView delSensitiveWord(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String sensitiveWordId = ServletRequestUtils.getStringParameter(request, "sensitiveWordId", "");
		SensitiveWords sensitive = admin.findById(SensitiveWords.class, sensitiveWordId);
		admin.delete(sensitive);
		return new ModelAndView("redirect:sensitiveWorlList.htm");
	}
	/*##################管理员管理报表##################*/
	@RequestMapping("turnToChartManage.htm")
	public ModelAndView turnToChartManage(HttpServletRequest request){
		
		
		
		
		return new ModelAndView();
	}
	
	
	
	
	
	
	/*##################管理员管理爬虫##################*/
	/*##################管理员管理权限##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToAuthorManage.htm")
	public ModelAndView turnToAuthorManage(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Authority.class);
        DetachedCriteria dCriteria=DetachedCriteria.forClass(Level.class);
        
        List<Authority> authorityList=(List<Authority>)admin.queryAllOfCondition(Authority.class, detachedCriteria);		
        
        int pageSize=8;
        int totalPage=admin.countTotalPage(dCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<Level> levelList=(List<Level>) admin.getByPage(dCriteria, pageSize);
        
        req.setAttribute("authorityList", authorityList);
        
		return new ModelAndView("/admin/authorManage","levelList",levelList);}
	}
	@RequestMapping("addAuthority.htm")
	public ModelAndView addAuthority(HttpServletRequest request){
		String levelId=request.getParameter("levelId");
		System.out.println("levelId=======-----"+levelId);
		
		String authorityId=request.getParameter("authorityId");
		
		System.out.println("authorityId=======-----"+authorityId);
		Level level=admin.findById(Level.class, levelId);
		Authority authority=admin.findById(Authority.class, authorityId);
		
		DetachedCriteria dCriteria=DetachedCriteria.forClass(LevelAuthority.class);
		dCriteria.add(Restrictions.eq("level", level));
		dCriteria.add(Restrictions.eq("authority", authority));
		
		List<LevelAuthority> lvAuthority=admin.queryAllOfCondition(LevelAuthority.class, dCriteria);
		System.out.println("lvAuthority.size()"+lvAuthority.size());
		if(lvAuthority.size()==0){
			LevelAuthority lev=new LevelAuthority();
			lev.setAuthority(authority);
			lev.setLevel(level);
			lev.setLevelAuthorityId(UUIDGenerator.randomUUID());
			admin.save(lev);
		}
		return new ModelAndView("redirect:turnToAuthorManage.htm");
	}
	@RequestMapping("deleteAuthority.htm")
	public ModelAndView deleteAuthority(HttpServletRequest request){
		String levelId=request.getParameter("levelId");
		Level level=admin.findById(Level.class, levelId);
		String authorityId=request.getParameter("authorityId");
		Authority authority=admin.findById(Authority.class, authorityId);
		
		DetachedCriteria dCriteria=DetachedCriteria.forClass(LevelAuthority.class);
		dCriteria.add(Restrictions.eq("level", level));
		dCriteria.add(Restrictions.eq("authority", authority));
		
		List<LevelAuthority> lvAuthority=admin.queryAllOfCondition(LevelAuthority.class, dCriteria);
		LevelAuthority lva=lvAuthority.get(0);
		admin.delete(lva);
		
		return new ModelAndView("redirect:turnToAuthorManage.htm");
	}
	
	/*##################管理员管理等级##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToLevelManage.htm")
	public ModelAndView turnToLevelManage(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Level.class);
        		
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<Level> levelList=(List<Level>)admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/levelManage","levelList",levelList);}
	}
	
	@RequestMapping("addLevel.htm")
	public ModelAndView addLevel(HttpServletRequest req,HttpServletResponse res)throws Exception {
      System.out.println("&^^^^%%%%$$$###@@");
		String lv=ServletRequestUtils.getStringParameter(req, "level", "");
       String title=ServletRequestUtils.getStringParameter(req, "title", "");
       int level1=Integer.parseInt(lv);
       String condition=ServletRequestUtils.getStringParameter(req, "condition", "");
       int condition1=Integer.parseInt(condition);
       String type=ServletRequestUtils.getStringParameter(req, "type", "");
       
      Level level=new Level();
      level.setLevelId(UUIDGenerator.randomUUID());
      level.setTitle(title);
      level.setLv(level1);
      level.setLvCondition(condition1);
      level.setType(type);
      admin.save(level);
		return new ModelAndView("redirect:turnToLevelManage.htm");
	}
	
	@RequestMapping("alterLevel.htm")
	public ModelAndView alterLevel(HttpServletRequest req,
			HttpServletResponse res) {
       String levelId=ServletRequestUtils.getStringParameter(req, "levelId", "");
       String lv1=ServletRequestUtils.getStringParameter(req, "level", "");
       int lv=Integer.parseInt(lv1);
       String condition1=ServletRequestUtils.getStringParameter(req, "condition", "");
       int condition=Integer.parseInt(condition1);
       String title=ServletRequestUtils.getStringParameter(req, "title", "");
       String type=ServletRequestUtils.getStringParameter(req, "type", "");
       
       Level level=admin.findById(Level.class, levelId);
       level.setLv(lv);
       level.setLvCondition(condition);
       level.setTitle(title);
       level.setType(type);
       
       admin.update(level);
       return new ModelAndView("redirect:turnToLevelManage.htm");
	}
	
	@RequestMapping("deletLevel.htm")
	public ModelAndView deletLevel(HttpServletRequest req,
			HttpServletResponse res) {
		 String levelId=ServletRequestUtils.getStringParameter(req, "levelId", "");
		 Level level=admin.findById(Level.class, levelId);
       admin.delete(level);
       return new ModelAndView("redirect:turnToLevelManage.htm");
	}
	/*##################管理员管理积分金币规则##################*/
	@SuppressWarnings("unchecked")
	@RequestMapping("turnToCreditAndGold.htm")
	public ModelAndView turnToCreditAndGold(HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		User user=(User) req.getSession().getAttribute("admin");
		if(user==null){
			
			return new ModelAndView("redirect:goAdminLogin.htm");
		}else{
			
        DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Rule.class);
        		
        int pageSize=8;
        int totalPage=admin.countTotalPage(detachedCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<Rule> rulelist=(List<Rule>)admin.getByPage(detachedCriteria, pageSize);
		return new ModelAndView("/admin/goldAndCreditManage","rulelist",rulelist);}
	}
	
	@RequestMapping("addCreditAndGold.htm")
	public ModelAndView addCreditAndGold(HttpServletRequest req,
			HttpServletResponse res)throws Exception {
       String action=ServletRequestUtils.getStringParameter(req, "action", "");
       String credit1=ServletRequestUtils.getStringParameter(req, "credit", "");
       int credit=Integer.parseInt(credit1);
       String gold1=ServletRequestUtils.getStringParameter(req, "gold", "");
       int gold=Integer.parseInt(gold1);
       String remark=ServletRequestUtils.getStringParameter(req, "remark", "");
       
       Rule rule=new Rule();
      rule.setRuleId(UUIDGenerator.randomUUID());
      rule.setCredit(credit);
      rule.setGold(gold);
      rule.setAction(action);
      rule.setRemark(remark);
       admin.save(rule);
		return new ModelAndView("redirect:turnToCreditAndGold.htm");
	}
	
	@RequestMapping("alterCreditAndGold.htm")
	public ModelAndView alterCreditAndGold(HttpServletRequest req,
			HttpServletResponse res) {
       String ruleId=ServletRequestUtils.getStringParameter(req, "ruleId", "");
       String credit1=ServletRequestUtils.getStringParameter(req, "credit", "");
       int credit=Integer.parseInt(credit1);
       String gold1=ServletRequestUtils.getStringParameter(req, "gold", "");
       int gold=Integer.parseInt(gold1);

       Rule rule=admin.findById(Rule.class, ruleId);
       rule.setCredit(credit);
       rule.setGold(gold);
       
       admin.update(rule);
       return new ModelAndView("redirect:turnToCreditAndGold.htm");
	}
	
	@RequestMapping("deletCreditAndGold.htm")
	public ModelAndView deletCreditAndGold(HttpServletRequest req,
			HttpServletResponse res) {
		String ruleId=ServletRequestUtils.getStringParameter(req, "ruleId", "");
		 Rule rule=admin.findById(Rule.class, ruleId);
       admin.delete(rule);
       return new ModelAndView("redirect:turnToCreditAndGold.htm");
	}
	
}
