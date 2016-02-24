package com.tinymooc.handler.team.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tinymooc.authority.annotation.CheckAuthority;
import com.tinymooc.common.domain.*;
import com.tinymooc.handler.label.service.LabelService;
import com.tinymooc.handler.team.service.TeamService;
import com.tinymooc.util.UUIDGenerator;
import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TeamController {

    @Autowired
    private TeamService teamService;
    @Autowired
    private LabelService labelService;

    private String labels;
    private String previousLabels;

    @RequestMapping("teamPage.htm")
    public ModelAndView teamPage(HttpServletRequest req, HttpServletResponse res) {
        String message = req.getParameter("message");
        // FIXME
        System.out.println("============message========="+message);
        User user = (User) req.getSession().getAttribute("user");
        // 1 我的小组 - 我管理的小组
        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("userPosition", "组长"));
        // 先建立team的引用
        DetachedCriteria criteria1 = detachedCriteria1.createCriteria("team")
                .add(Restrictions.eq("teamState", "批准"));

        // 2 我的小组 - 我加入的小组
        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("user", user))
                .add(Restrictions.eq("userPosition", "组员"));
        DetachedCriteria criteria2 = detachedCriteria2.createCriteria("team")
                .add(Restrictions.eq("teamState", "批准"));

        // 3 查询活跃小组（小组建设度降序）
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(Team.class)
                .add(Restrictions.eq("teamState", "批准"))
                .addOrder(Order.desc("construction"));

        //查询数据字典
        DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(DataDic.class)
                .add(Restrictions.eq("dicKey", "专业分类"));

        //查询热门话题
        DetachedCriteria detachedCriteria5 = DetachedCriteria.forClass(Discuss.class)
                .addOrder(Order.desc("publishDate"))
                .addOrder(Order.desc("scanNum"));

        List<UserTeam> userTeam1 = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, criteria1);
        List<UserTeam> userTeam2 = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, criteria2);
        List<Team> hotTeams = (List<Team>) teamService.queryAllOfCondition(Team.class, detachedCriteria3);
        List<DataDic> dictionaries = (List<DataDic>) teamService.queryAllOfCondition(DataDic.class, detachedCriteria4);
        List<Discuss> discussList = (List<Discuss>) teamService.queryAllOfCondition(Discuss.class, detachedCriteria5);

        req.setAttribute("userTeam1", userTeam1);
        req.setAttribute("userTeam2", userTeam2);
        req.setAttribute("hotTeams", hotTeams);
        req.setAttribute("dictionaries", dictionaries);
        req.setAttribute(" discussList", discussList);
        return new ModelAndView("/team/team", "message", message);
    }

    @RequestMapping("teamHomePage.htm")
    public ModelAndView teamHomePage(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");

        // FIXME
        System.out.println("==============teamId" + teamId + "===============");
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:login.htm");
        }
        Team team = teamService.findById(Team.class, teamId);

        DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("userState", "批准"))
                .addOrder(Order.desc("approveDate"));

        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(Discuss.class)
                .add(Restrictions.eq("team", team))
                .addOrder(Order.desc("top"))
                .addOrder(Order.desc("publishDate"));

        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, detachedCriteria1);
        List<Discuss> discusses = (List<Discuss>) teamService.queryAllOfCondition(Discuss.class, detachedCriteria2);


        UserTeam userTeam1 = new UserTeam();
        UserTeam userTeam2 = new UserTeam();

        for (int i = 0; i < userTeams.size(); i++) {
            if (userTeams.get(i).getUser().getUserId().equals(user.getUserId())) {
                // 与当前用户关联的UserTeam
                userTeam1 = userTeams.get(i);
            }
            if (userTeams.get(i).getUserPosition().equals("组长")) {
                // 组长的UserTeam
                userTeam2 = userTeams.get(i);
            }
        }

        int discussNum = discusses.size();
        int memberNum = userTeams.size();

        // 获取小组成员等级及其称号
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(Level.class)
                .add(Restrictions.eq("type", "小组用户"))
                .addOrder(Order.asc("lvCondition"));
        List<Level> teamUserLevels = (List<Level>) teamService.queryAllOfCondition(Level.class, detachedCriteria3);

        // FIXME
        for (Level l: teamUserLevels)
            System.out.println("==========测试小组成员========="+l.getTitle());

        // 获取小组等级及其称号
        DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(Level.class)
                .add(Restrictions.eq("type", "小组"))
                .addOrder(Order.asc("lvCondition"));
        List<Level> teamLevels = (List<Level>) teamService.queryAllOfCondition(Level.class, detachedCriteria4);

        // 获取小组标签
        DetachedCriteria detachedCriteria5 = DetachedCriteria.forClass(LabelObject.class)
                .add(Restrictions.eq("objectId", team.getTeamId()));
        List<LabelObject> labelObjects = (List<LabelObject>) teamService.queryAllOfCondition(LabelObject.class, detachedCriteria5);

        // 组内成员等级
        Level level1 = new Level();

        // 小组等级
        Level level2 = new Level();
        for (int j = 0; j < teamUserLevels.size(); j++) {
            if (j == teamUserLevels.size() - 1) {
                level1 = teamUserLevels.get(j);
                break;
            }

            if (userTeam1.getContribution() != null) {
                if (userTeam1.getContribution() < teamUserLevels.get(j).getLvCondition()) {
                    level1 = teamUserLevels.get(j - 1);
                    break;
                }
            }
        }
        for (int k = 0; k < teamLevels.size(); k++) {
            if (k == teamLevels.size() - 1) {
                level2 = teamLevels.get(k);
                break;
            }
            if (team.getConstruction() < teamLevels.get(k).getLvCondition()) {
                level2 = teamLevels.get(k - 1);
                break;
            }
        }
        req.setAttribute("userTeams", userTeams);
        req.setAttribute("userTeam1", userTeam1);
        req.setAttribute("userTeam2", userTeam2);
        req.setAttribute("discussNum", discussNum);
        req.setAttribute("memberNum", memberNum);
        req.setAttribute("discusses", discusses);
        req.setAttribute("level1", level1);
        req.setAttribute("level2", level2);
        req.setAttribute("labelList", labelObjects);
        return new ModelAndView("/team/teamHome");
    }

    @RequestMapping("createGuidePage.htm")
    public ModelAndView createGuidePage(HttpServletRequest req, HttpServletResponse res) {

        return new ModelAndView("/team/createGuide");
    }

    @RequestMapping("createTeamPage.htm")
    public ModelAndView createTeamPage(HttpServletRequest req, HttpServletResponse res) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(DataDic.class)
                .add(Restrictions.eq("dicKey", "专业分类"));
        List<DataDic> majorType = (List<DataDic>) teamService.queryAllOfCondition(DataDic.class, detachedCriteria);

        return new ModelAndView("/team/createPublicTeam", "majorType", majorType);
    }

    @CheckAuthority(name = "创建小组")
    @RequestMapping("createTeam.htm")
    public ModelAndView createTeam(HttpServletRequest req, HttpServletResponse res) {
        String teamName = ServletRequestUtils.getStringParameter(req, "teamName", "");
        String teamIntro = ServletRequestUtils.getStringParameter(req, "teamIntro", "");
        String teamType = ServletRequestUtils.getStringParameter(req, "teamType", "");
        User user = (User) req.getSession().getAttribute("user");

        Team team = new Team();
        team.setTeamId(UUIDGenerator.randomUUID());
        team.setTeamName(teamName);
        team.setTeamIntro(teamIntro);
        team.setType(teamType);
        team.setConstruction(0);
        team.setTeamState("申请中");
        team.setHeadImage(new HeadImage("70328611d330411ca1d438ba70a10ccc"));
        team.setApplyDate(new Date());
        teamService.save(team);

        UserTeam userTeam = new UserTeam();
        userTeam.setUserTeamId(UUIDGenerator.randomUUID());
        userTeam.setApplyDate(new Date());
        userTeam.setApproveDate(new Date());
        userTeam.setUser(user);
        userTeam.setUserPosition("组长");
        userTeam.setContribution(0);
        userTeam.setTeam(team);
        userTeam.setUserState("批准");
        teamService.save(userTeam);

        String message = "创建成功，请等待批准";
        return new ModelAndView("redirect:teamPage.htm", "message", message);
    }


    @RequestMapping("takePartInTeam.htm")
    public ModelAndView takePartInTeam(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        User user = (User) req.getSession().getAttribute("user");
        Team team = teamService.findById(Team.class, teamId);
        UserTeam userTeam = new UserTeam();
        userTeam.setUserTeamId(UUIDGenerator.randomUUID());
        userTeam.setApplyDate(new Date());
        userTeam.setUser(user);
        userTeam.setUserState("申请中");
        userTeam.setTeam(team);
        teamService.save(userTeam);
        return new ModelAndView("redirect:teamHomePage.htm?teamId=" + teamId);
    }

    @RequestMapping("membersAdminPage.htm")
    public ModelAndView membersAdminPage(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        User user = (User) req.getSession().getAttribute("user");
        Team team = teamService.findById(Team.class, teamId);

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("userState", "批准"))
                .addOrder(Order.desc("approveDate"));
        // 批准的UserTeam
        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, detachedCriteria);

        // 申请中的UserTeam
        DetachedCriteria detachedCriteria2 = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("userState", "申请中"))
                .addOrder(Order.desc("applyDate"));
        List<UserTeam> userTeams2 = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, detachedCriteria2);

        // 个人UserTeam
        UserTeam userTeam1 = new UserTeam();
        // 组长UserTeam2
        UserTeam userTeam2 = new UserTeam();

        for (int i = 0; i < userTeams.size(); i++) {
            if (userTeams.get(i).getUser().getUserId().equals(user.getUserId())) {
                userTeam1 = userTeams.get(i);
            }
            if (userTeams.get(i).getUserPosition().equals("组长")) {
                userTeam2 = userTeams.get(i);
            }
        }

        // 获取小组成员等级及其称号
        DetachedCriteria detachedCriteria3 = DetachedCriteria.forClass(Level.class)
                .add(Restrictions.eq("type", "小组用户"))
                .addOrder(Order.asc("lvCondition"));
        List<Level> teamUserLevels = (List<Level>) teamService.queryAllOfCondition(Level.class, detachedCriteria3);

        // 组内成员等级
        Level level1 = new Level();
        // 小组等级
        Level level2 = new Level();
        for (int j = 0; j < teamUserLevels.size(); j++) {
            if (j == teamUserLevels.size() - 1) {
                level1 = teamUserLevels.get(j);
                break;
            }

            if (userTeam1.getContribution() != null) {
                if (userTeam1.getContribution() < teamUserLevels.get(j).getLvCondition()) {
                    level1 = teamUserLevels.get(j - 1);
                    break;
                }
            }
        }

        // 获取小组等级及其称号
        DetachedCriteria detachedCriteria4 = DetachedCriteria.forClass(Level.class)
                .add(Restrictions.eq("type", "小组"))
                .addOrder(Order.asc("lvCondition"));
        List<Level> teamLevels = (List<Level>) teamService.queryAllOfCondition(Level.class, detachedCriteria4);

        for (int k = 0; k < teamLevels.size(); k++) {
            if (k == teamLevels.size() - 1) {
                level2 = teamLevels.get(k);
                break;
            }
            if (team.getConstruction() < teamLevels.get(k).getLvCondition()) {
                level2 = teamLevels.get(k - 1);
                break;
            }
        }

        int memberNum = userTeams.size();
        req.setAttribute("userTeams", userTeams);
        req.setAttribute("userTeams2", userTeams2);
        req.setAttribute("memberNum", memberNum);
        req.setAttribute("userTeam1", userTeam1);
        req.setAttribute("userTeam2", userTeam2);
        req.setAttribute("level1", level1);
        req.setAttribute("level2", level2);
        return new ModelAndView("/team/membersAdmin");
    }

    @RequestMapping("kickOutTeam.htm")
    public ModelAndView kickOutTeam(HttpServletRequest req, HttpServletResponse res) {
        String userTeamId = ServletRequestUtils.getStringParameter(req, "userTeamId", "");
        UserTeam userTeam = teamService.findById(UserTeam.class, userTeamId);
        String teamId = userTeam.getTeam().getTeamId();
        teamService.delete(userTeam);
        return new ModelAndView("redirect:membersAdminPage.htm?teamId=" + teamId);
    }

    @RequestMapping("banTeamUser.htm")
    public ModelAndView banTeamUser(HttpServletRequest req, HttpServletResponse res) {
        String userTeamId = ServletRequestUtils.getStringParameter(req, "userTeamId", "");
        UserTeam userTeam = teamService.findById(UserTeam.class, userTeamId);
        String teamId = userTeam.getTeam().getTeamId();
        userTeam.setUserState("封禁");
        teamService.update(userTeam);
        return new ModelAndView("redirect:membersAdminPage.htm?teamId=" + teamId);
    }

    @RequestMapping("addApplyUser.htm")
    public ModelAndView addApplyUser(HttpServletRequest req, HttpServletResponse res) {
        String userTeamId = ServletRequestUtils.getStringParameter(req, "userTeamId", "");
        UserTeam userTeam = teamService.findById(UserTeam.class, userTeamId);
        String teamId = userTeam.getTeam().getTeamId();
        userTeam.setUserState("批准");
        userTeam.setApproveDate(new Date());
        userTeam.setContribution(0);
        userTeam.setUserPosition("组员");
        teamService.update(userTeam);
        return new ModelAndView("redirect:membersAdminPage.htm?teamId=" + teamId);
    }

    @RequestMapping("manageTeam.htm")
    public ModelAndView manageTeam(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        User user = (User) req.getSession().getAttribute("user");
        Team team = teamService.findById(Team.class, teamId);
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("userState", "批准"))
                .addOrder(Order.desc("approveDate"));
        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, detachedCriteria);
        labels = labelService.getTenHotLabels();
        previousLabels = labelService.getObjectLabels(team.getTeamId(), "team");
        UserTeam userTeam = new UserTeam();
        UserTeam userTeam2 = new UserTeam();
        for (int i = 0; i < userTeams.size(); i++) {
            if (userTeams.get(i).getUser().getUserId().equals(user.getUserId())) {
                userTeam = userTeams.get(i);
            }
            if (userTeams.get(i).getUserPosition().equals("组长")) {
                userTeam2 = userTeams.get(i);
            }
        }
        int memberNum = userTeams.size();
        req.setAttribute("userTeams", userTeams);
        req.setAttribute("memberNum", memberNum);
        req.setAttribute("userTeam", userTeam);
        req.setAttribute("userTeam2", userTeam2);
        req.setAttribute("labels", labels);
        req.setAttribute("previousLabels", previousLabels);
        return new ModelAndView("/team/admin");
    }

    @RequestMapping("updateTeamInfo.htm")
    public ModelAndView updateTeamInfo(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        String teamName = ServletRequestUtils.getStringParameter(req, "teamName", "");
        String teamIntro = ServletRequestUtils.getStringParameter(req, "teamIntro", "");
        String labels = ServletRequestUtils.getStringParameter(req, "teamTag", "");

        labelService.saveObjectLabels(labels, teamId, "team");

        Team team = teamService.findById(Team.class, teamId);
        team.setTeamName(teamName);
        team.setTeamIntro(teamIntro);
        teamService.update(team);
        return new ModelAndView("redirect:manageTeam.htm?teamId=" + teamId);
    }

    @RequestMapping("discussPage.htm")
    public ModelAndView discussPage(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        User user = (User) req.getSession().getAttribute("user");
        Team team = teamService.findById(Team.class, teamId);
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("userState", "批准"))
                .addOrder(Order.desc("approveDate"));
        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, detachedCriteria);
        UserTeam userTeam = new UserTeam();
        UserTeam userTeam2 = new UserTeam();
        for (int i = 0; i < userTeams.size(); i++) {
            if (userTeams.get(i).getUser().getUserId().equals(user.getUserId())) {
                userTeam = userTeams.get(i);
            }
            if (userTeams.get(i).getUserPosition().equals("组长")) {
                userTeam2 = userTeams.get(i);
            }
        }
        DetachedCriteria criteria = DetachedCriteria.forClass(Discuss.class)
                .add(Restrictions.eq("team", team))
                .addOrder(Order.desc("top"))
                .addOrder(Order.desc("publishDate"));
        List<Discuss> discusses = (List<Discuss>) teamService.queryAllOfCondition(Discuss.class, criteria);

        int memberNum = userTeams.size();
        int discussNum = team.getDiscusses().size();
        req.setAttribute("userTeams", userTeams);
        req.setAttribute("memberNum", memberNum);
        req.setAttribute("userTeam", userTeam);
        req.setAttribute("userTeam2", userTeam2);
        req.setAttribute("discussNum", discussNum);
        req.setAttribute("discusses", discusses);
        return new ModelAndView("/team/discuss");
    }

    @RequestMapping("createDiscussPage.htm")
    public ModelAndView createDiscussPage(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        Team team = teamService.findById(Team.class, teamId);
        req.setAttribute("team", team);
        return new ModelAndView("/team/createDiscuss");
    }

    @CheckAuthority(name = "发表话题")
    @RequestMapping("createDiscuss.htm")
    public ModelAndView createDiscuss(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        String topic = ServletRequestUtils.getStringParameter(req, "topic", "");
        String content = ServletRequestUtils.getStringParameter(req, "content", "");
        User user = (User) req.getSession().getAttribute("user");
        Discuss discuss = new Discuss();
        discuss.setDiscussId(UUIDGenerator.randomUUID());
        discuss.setPublishDate(new Date());
        discuss.setTeam(teamService.findById(Team.class, teamId));
        discuss.setUser(user);
        discuss.setTopic(topic);
        discuss.setTop(0);
        discuss.setScanNum(0);
        teamService.save(discuss);

        Resource resource = new Resource();
        resource.setResourceId(UUIDGenerator.randomUUID());
        resource.setResourceObject(discuss.getDiscussId());
        teamService.save(resource);

        ImageText imageText = new ImageText();
        imageText.setResourceId(resource.getResourceId());
        imageText.setContent(content);
        imageText.setResource(resource);
        teamService.save(imageText);
        return new ModelAndView("redirect:discussPage.htm?teamId=" + teamId);
    }

    @RequestMapping("discussDetailPage.htm")
    public ModelAndView discussDetailPage(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        //String userId=ServletRequestUtils.getStringParameter(req, "userId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        User user = discuss.getUser();
        User user2 = (User) req.getSession().getAttribute("user");
        DetachedCriteria criteria = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", user2))
                .add(Restrictions.eq("userByAttentionedUserId", user));
        DetachedCriteria criteria2 = DetachedCriteria.forClass(Discuss.class)
                .addOrder(Order.desc("publishDate"))
                .createCriteria("team")
                .add(Restrictions.eq("teamId", discuss.getTeam().getTeamId()));
        DetachedCriteria criteria3 = DetachedCriteria.forClass(Resource.class)
                .add(Restrictions.eq("resourceObject", discuss.getDiscussId()));
        DetachedCriteria criteria4 = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("userPosition", "创建者"))
                .createCriteria("user")
                .add(Restrictions.eq("userId", user.getUserId()));
        DetachedCriteria criteria5 = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("userPosition", "组长"))
                .createCriteria("team")
                .add(Restrictions.eq("teamId", discuss.getTeam().getTeamId()));
//        DetachedCriteria criteria6 = DetachedCriteria.forClass(Favorite.class)
//                .add(Restrictions.eq("user", user2))
//                .add(Restrictions.eq("objectId", discuss.getDiscussId()));
        DetachedCriteria criteria7 = DetachedCriteria.forClass(Comment.class)
                .add(Restrictions.eq("commentObject", discussId))
                .add(Restrictions.isNull("comment"))
                .addOrder(Order.asc("commentDate"));
        DetachedCriteria criteria8 = DetachedCriteria.forClass(Comment.class)
                .add(Restrictions.eq("commentObject", discussId))
                .add(Restrictions.isNotNull("comment"))
                .addOrder(Order.asc("commentDate"));
        DetachedCriteria criteria9 = DetachedCriteria.forClass(Attention.class)
                .add(Restrictions.eq("userByUserId", user));
        List<Attention> attentions = (List<Attention>) teamService.queryAllOfCondition(Attention.class, criteria);
        List<Discuss> discusses = (List<Discuss>) teamService.queryAllOfCondition(Discuss.class, criteria2);
        List<Resource> resources = (List<Resource>) teamService.queryAllOfCondition(Resource.class, criteria3);
        List<UserCourse> userCourses = (List<UserCourse>) teamService.queryAllOfCondition(UserCourse.class, criteria4);
        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, criteria5);
//        List<Favorite> favorites = (List<Favorite>) teamService.queryAllOfCondition(Favorite.class, criteria6);
        List<Comment> comments = (List<Comment>) teamService.queryAllOfCondition(Comment.class, criteria7);
        List<Comment> comments2 = (List<Comment>) teamService.queryAllOfCondition(Comment.class, criteria8);
        List<Attention> attentions2 = (List<Attention>) teamService.queryAllOfCondition(Attention.class, criteria9);
        Resource resource = resources.get(0);
        UserTeam userTeam = userTeams.get(0);
        int courseNum = userCourses.size();
        int fansNum = attentions2.size();

        int isAttention = 0;
        if (! attentions.isEmpty()) {
            isAttention = 1;
        }

        int commentNum = comments.size() + comments2.size();
        discuss.setScanNum(discuss.getScanNum() + 1);
        teamService.update(discuss);

        req.setAttribute("discuss", discuss);
        req.setAttribute("fansNum", fansNum);
        req.setAttribute("isAttention", isAttention);
        req.setAttribute("discusses", discusses);
        req.setAttribute("resource", resource);
        req.setAttribute("courseNum", courseNum);
        req.setAttribute("userTeam", userTeam);
//        req.setAttribute("flag", flag);
        req.setAttribute("comments", comments);
        req.setAttribute("comments2", comments2);
        req.setAttribute("commentNum", commentNum);
        return new ModelAndView("/team/discussDetail");
    }

    @RequestMapping("makeEssence.htm")
    public ModelAndView makeEssence(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        discuss.setEssence("精华");
        teamService.update(discuss);
        return new ModelAndView("redirect:discussDetailPage.htm?discussId=" + discussId);
    }

    @RequestMapping("cancelEssence.htm")
    public ModelAndView cancelEssence(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        discuss.setEssence("");
        teamService.update(discuss);
        return new ModelAndView("redirect:discussDetailPage.htm?discussId=" + discussId);
    }

    @RequestMapping("makeTop.htm")
    public ModelAndView makeTop(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        discuss.setTop(1);
        teamService.update(discuss);
        return new ModelAndView("redirect:discussDetailPage.htm?discussId=" + discussId);
    }

    @RequestMapping("cancelTop.htm")
    public ModelAndView cancelTop(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        discuss.setTop(0);
        teamService.update(discuss);
        return new ModelAndView("redirect:discussDetailPage.htm?discussId=" + discussId);
    }

    @CheckAuthority(name = "删除话题")
    @RequestMapping("deleteDiscuss.htm")
    public ModelAndView deleteDiscuss(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        teamService.delete(discuss);
        //删除评论
        return new ModelAndView("redirect:discussDetailPage.htm?discussId=" + discussId);
    }

    @RequestMapping("addInform.htm")
    public ModelAndView addInform(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        req.setAttribute("discussId", discussId);
        return new ModelAndView("/inform/addinform");
    }

    @RequestMapping("informDiscuss.htm")
    public ModelAndView informDiscuss(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        String informreason = ServletRequestUtils.getStringParameter(req, "informreason", "");
        User user = (User) req.getSession().getAttribute("user");
        Inform inform = new Inform();
        inform.setInformId(UUIDGenerator.randomUUID());
        inform.setInformDate(new Date());
        inform.setInformObject(discussId);
        inform.setUser(user);
        inform.setInformReason(informreason);
        inform.setInformType("话题");
        inform.setInformState("未处理");
        teamService.save(inform);
        return new ModelAndView("/common/outSuccess");
    }

    @RequestMapping("editDiscussPage.htm")
    public ModelAndView editDiscussPage(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        DetachedCriteria criteria = DetachedCriteria.forClass(ImageText.class)
                .createCriteria("resource")
                .add(Restrictions.eq("resourceObject", discussId));
        List<ImageText> texts = (List<ImageText>) teamService.queryAllOfCondition(ImageText.class, criteria);
        ImageText text = texts.get(0);
        req.setAttribute("discuss", discuss);
        req.setAttribute("text", text);
        return new ModelAndView("/team/editDiscuss");
    }

    @RequestMapping("updateDiscuss.htm")
    public ModelAndView updateDiscuss(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        String topic = ServletRequestUtils.getStringParameter(req, "topic", "");
        String content = ServletRequestUtils.getStringParameter(req, "content", "");
        Discuss discuss = teamService.findById(Discuss.class, discussId);
        discuss.setTopic(topic);
        teamService.update(discuss);
        DetachedCriteria criteria = DetachedCriteria.forClass(ImageText.class)
                .createCriteria("resource")
                .add(Restrictions.eq("resourceObject", discussId));
        List<ImageText> texts = (List<ImageText>) teamService.queryAllOfCondition(ImageText.class, criteria);
        ImageText text = texts.get(0);
        text.setContent(content);
        teamService.update(text);
        return new ModelAndView("/common/outSuccess");
    }

    @CheckAuthority(name = "回复话题")
    @RequestMapping("createContent.htm")
    public ModelAndView createContent(HttpServletRequest req, HttpServletResponse res) {
        String discussId = ServletRequestUtils.getStringParameter(req, "discussId", "");
        String content = ServletRequestUtils.getStringParameter(req, "content", "");
        String parentId = ServletRequestUtils.getStringParameter(req, "parentId", "");
        User user = (User) req.getSession().getAttribute("user");
        Comment comment = new Comment();
        comment.setCommentId(UUIDGenerator.randomUUID());
        comment.setCommentDate(new Date());
        comment.setCommentContent(content);
        comment.setCommentObject(discussId);
        comment.setUser(user);
        comment.setType("话题");
        if (!parentId.equals(null)) {
            comment.setComment(teamService.findById(Comment.class, parentId));
        }
        teamService.save(comment);
        return new ModelAndView("redirect:discussDetailPage.htm?discussId=" + discussId);
    }

    @RequestMapping("constructTeam.htm")
    public ModelAndView constructTeam(HttpServletRequest req, HttpServletResponse res) {
        String teamId = ServletRequestUtils.getStringParameter(req, "teamId", "");
        String gold = ServletRequestUtils.getStringParameter(req, "gold", "");
        User user = (User) req.getSession().getAttribute("user");
        Team team = teamService.findById(Team.class, teamId);
        team.setConstruction(team.getConstruction() + Integer.parseInt(gold));
        teamService.update(team);
        DetachedCriteria criteria = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("user", user));
        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, criteria);
        UserTeam userTeam = userTeams.get(0);
        userTeam.setContribution(userTeam.getContribution() + Integer.parseInt(gold));
        teamService.update(userTeam);
        user.setGold(user.getGold() - Integer.parseInt(gold));
        teamService.update(user);
        return new ModelAndView("redirect:teamHomePage.htm?teamId=" + teamId);
    }


    @RequestMapping("goTeamPicture.htm")
    public ModelAndView goteampicture(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //teamId
        String teamId = request.getParameter("teamId");
        Team team = teamService.findById(Team.class, teamId);

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UserTeam.class)
                .add(Restrictions.eq("team", team))
                .add(Restrictions.eq("userState", "批准"))
                .addOrder(Order.desc("approveDate"));
        List<UserTeam> userTeams = (List<UserTeam>) teamService.queryAllOfCondition(UserTeam.class, detachedCriteria);

        int memberNum = userTeams.size();

        Team teamforpicture = new Team();
        teamforpicture = (Team) teamService.getCurrentSession().createCriteria(Team.class).add(Restrictions.eq("teamId", teamId)).uniqueResult();
        HttpSession hs = request.getSession();
        hs.setAttribute("teamforpicture", teamforpicture);
//        hs.setMaxInactiveInterval(100);
        request.setAttribute("memberNum" , memberNum);
        return new ModelAndView("/team/picture");
    }

    @RequestMapping("teamPicture.htm")
    public void teamPicture(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession hs = request.getSession();
        Team team0 = (Team) hs.getAttribute("teamforpicture");
        Team team = (Team) teamService.getCurrentSession().createCriteria(Team.class).add(Restrictions.eq("teamId", team0.getTeamId())).uniqueResult();
        System.out.println(team.getTeamId());
        //存两份一份供用户读取，如下
        //设置基本路径
        String uploadPath = request.getSession().getServletContext().getRealPath("/") + "";

        String PathToService = uploadPath.split(".metadata")[0] + "/Supper_Microlecture/src/main/webapp/pic/imagehead/";


        System.out.println("uploadPath" + uploadPath);


        System.out.println("uploadPath*********************" + uploadPath);
        File upPath = new File(PathToService);
        if (!upPath.exists()) upPath.mkdirs();
        //创建小头像
        String jsn = request.getParameter("dataAll");

        System.out.println("+++++++jsn:" + jsn.substring(0, 50));
        JSONObject jsonObject = JSONObject.fromObject(jsn);
        String img1 = ((String) jsonObject.get("data1")).substring(22);
        img1 = img1.replaceAll("_", "+");
        System.out.println("+++++++img1：" + img1.substring(0, 30));
        //byte[] b1=img1.getBytes();
        Base64 base64 = new Base64();
        byte[] b1 = base64.decode(img1);
        for (int i = 0; i < b1.length; ++i) {
            if (b1[i] < 0) {// 调整异常数据
                b1[i] += 256;
            }
        }
        String uploadPath1 = "/pic/imagehead/" + team.getTeamId() + "3.jpg";
        System.out.println(uploadPath + uploadPath1);
        File folder1 = new File(uploadPath + uploadPath1);
        //检查文件存在与否
        if (!folder1.exists())
            folder1.createNewFile();
        File folder1S = new File(PathToService + team.getTeamId() + "3.jpg");
        if (!folder1S.exists()) folder1S.createNewFile();
        // 创建文件输出流对象
        OutputStream d1 = new FileOutputStream(folder1);
        // 写入输出流
        d1.write(b1);
        d1.flush();
        // 关闭输出流
        d1.close();
        OutputStream d1S = new FileOutputStream(folder1S);
        d1S.write(b1);
        d1S.flush();
//		         关闭输出流   
        d1S.close();
        System.out.println("唯一小组头像已保存到" + uploadPath + uploadPath1);


        //存头像数据
        if (folder1.length() >= 0) {
            HeadImage hi = new HeadImage();
            if (team.getHeadImage() == null) {
                hi.setImageId(UUIDGenerator.randomUUID());
                hi.setImageSmall(uploadPath1);
            } else {
                hi = (HeadImage) teamService.getCurrentSession().createCriteria(HeadImage.class).add(Restrictions.eq("imageId", team.getHeadImage().getImageId())).uniqueResult();

                hi.setImageSmall(uploadPath1);

            }
            teamService.saveOrUpdate(hi);
            team.setHeadImage(hi);
            teamService.update(team);
            hs.setAttribute("teamforpicture", team);
        }

        //返回后台数据
        PrintWriter pw = response.getWriter();

        String math = "?" + Math.random();
        uploadPath1 = "<c:url value=\"" + uploadPath1 + "\"/>";

        String data = uploadPath1;

        System.out.println(data);
        pw.println(data);
        //hs.removeAttribute("teamId");

    }
}
