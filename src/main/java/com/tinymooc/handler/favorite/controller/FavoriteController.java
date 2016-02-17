package com.tinymooc.handler.favorite.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.common.domain.Course;
import com.tinymooc.common.domain.Favorite;
import com.tinymooc.common.domain.User;
import com.tinymooc.common.tag.pageTag.PageHelper;
import com.tinymooc.handler.course.service.CourseService;
import com.tinymooc.handler.favorite.service.FavoriteService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.marswork.core.exceptions.messaging.MarsException;

@Controller
public class FavoriteController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private FavoriteService favoriteService;

//	@RequestMapping("addFavorite.htm")
//	public ModelAndView addFavorite(HttpServletRequest req,
//			HttpServletResponse res) throws MarsException {
//
//		String url = ServletRequestUtils.getStringParameter(req, "url", "");
//		String title = ServletRequestUtils.getStringParameter(req, "title", "");
//		String objectId=ServletRequestUtils.getStringParameter(req, "objectId", "");
//		ModelMap map = new ModelMap();
//		map.addAttribute("url", url);
//		map.addAttribute("title", title);
//		map.addAttribute("objectId", objectId);
//		return new ModelAndView("/favorite/addFavorite", map);
//	}

    @RequestMapping("createFavorite.htm")
    public void createFavorite(HttpServletRequest req, HttpServletResponse res) throws MarsException, IOException {
        // FIXME
        System.out.println("================createFavorite.htm被执行==============");
        PrintWriter pw = res.getWriter();

        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            pw.print("login");
        }
        String url = ServletRequestUtils.getStringParameter(req, "url", "");
        System.out.println("======url=" + url);
        String courseId = ServletRequestUtils.getStringParameter(req, "courseId", "");
        System.out.println("=========courseId=" + courseId);

        Course course = courseService.findById(Course.class, courseId);

        Date favoriteDate = new Date();

        try {
            Favorite favorite = new Favorite();
            favorite.setUser(user);
            favorite.setFavoriteId(UUIDGenerator.randomUUID());
            favorite.setFavoriteDate(favoriteDate);
            favorite.setUrl(url);
            favorite.setCourseName(course.getCourseTitle());
            favorite.setCourseId(courseId);
            favoriteService.save(favorite);
            pw.print("true");
        } catch (Exception e) {
            pw.print("false");
        }
        pw.close();
    }

    @SuppressWarnings("unchecked")
    @RequestMapping("myFavorite.htm")
    public ModelAndView myFavotite(HttpServletRequest req, HttpServletResponse res) throws MarsException {

        User user = (User) req.getSession().getAttribute("user");
        DetachedCriteria dCriteria = DetachedCriteria.forClass(Favorite.class)
                .add(Restrictions.eq("user", user));

        int pageSize = 5;
        int totalPage = favoriteService.countTotalPage(dCriteria, pageSize);
        PageHelper.forPage(totalPage, pageSize);
        List<Favorite> favorites = (List<Favorite>) favoriteService.getByPage(dCriteria, pageSize);
        req.setAttribute("favorites", favorites);
        return new ModelAndView("/favorite/myFavorite");
    }

    @RequestMapping("deleteFavorite.htm")
    public ModelAndView ddeleteFavotite(HttpServletRequest req, HttpServletResponse res) throws MarsException {

        String favoriteId = ServletRequestUtils.getStringParameter(req, "favoriteId", "");
        Favorite favorite = favoriteService.findById(Favorite.class, favoriteId);

        favoriteService.delete(favorite);

        return new ModelAndView("redirect:myFavorite.htm");
    }
}
