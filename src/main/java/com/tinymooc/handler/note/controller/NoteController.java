package com.tinymooc.handler.note.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tinymooc.common.domain.*;
import com.tinymooc.handler.note.service.NoteService;
import com.tinymooc.handler.user.service.UserService;
import com.tinymooc.util.UUIDGenerator;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class NoteController {
    private static final Logger log = LoggerFactory.getLogger(NoteController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private NoteService noteService;


    @RequestMapping("turnCreateNote.htm")
    public ModelAndView turnCreateNote(HttpServletRequest request) {
        return new ModelAndView("/note/createNote");
    }


    @RequestMapping("goNote.htm")
    public ModelAndView goNote(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {

            return new ModelAndView("/login/login");

        } else {

            DetachedCriteria dCriteria = DetachedCriteria.forClass(UserCourse.class);

            dCriteria.add(Restrictions.eq("user", user));

            List<UserCourse> notelist = noteService.queryAllOfCondition(UserCourse.class, dCriteria);

            int credit = user.getCredit();
            System.out.println("credit----" + credit);
            Level level = userService.getUserLevel(credit);
            request.setAttribute("level", level);
            return new ModelAndView("/note/myNote", "notelist", notelist);
        }


    }

    @RequestMapping("deleteNote.htm")
    public ModelAndView deleteNote(HttpServletRequest request) {
        String noteId = request.getParameter("noteId");

        Note note = noteService.findById(Note.class, noteId);

        noteService.delete(note);


        return new ModelAndView("redirect:goNote.htm");
    }

    @RequestMapping("goCreateNote.htm")
    public void goCreateNote(HttpServletRequest request, HttpServletResponse response) throws Exception {

        User user = (User) request.getSession().getAttribute("user");
        PrintWriter out = response.getWriter();

        String courseId = request.getParameter("courseId");

        Course course = noteService.findById(Course.class, courseId);

        DetachedCriteria dCriteria = DetachedCriteria.forClass(UserCourse.class)
                .add(Restrictions.eq("course", course)).add(Restrictions.eq("user", user));

        List<UserCourse> ucourselist = noteService.queryAllOfCondition(UserCourse.class, dCriteria);
        UserCourse userCourse = ucourselist.get(0);

        String noteContent = request.getParameter("content");
        //System.out.println("sssssssssssss"+noteContent);
        String public_ = request.getParameter("isPublic");
        Note note = new Note();

        note.setNoteId(UUIDGenerator.randomUUID());
        note.setAddDate(new Date());
        note.setNoteContent(noteContent);
        note.setUserCourse(userCourse);
        note.setPublic_(public_);

        noteService.save(note);

        out.write("ok");
        out.close();

    }

    @RequestMapping("gocourseNote.htm")
    public ModelAndView gocourseNote(HttpServletRequest request) {

        String courseId = request.getParameter("courseId");

        User user = (User) request.getSession().getAttribute("user");
        Course course = noteService.findById(Course.class, courseId);

        DetachedCriteria dCriteria3 = DetachedCriteria.forClass(UserCourse.class);

        dCriteria3.add(Restrictions.eq("course", course));
        dCriteria3.add(Restrictions.eq("user", user));
        List<UserCourse> courseList1 = noteService.queryAllOfCondition(UserCourse.class, dCriteria3);


        DetachedCriteria dCriteria = DetachedCriteria.forClass(UserCourse.class);

        dCriteria.add(Restrictions.eq("course", course));

        List<UserCourse> courseList = noteService.queryAllOfCondition(UserCourse.class, dCriteria);

        int userNum = courseList.size();

        int noteSum = 0;

        for (int i = 0; i < courseList.size(); i++) {

            UserCourse userCourse = courseList.get(i);

            DetachedCriteria dCriteria2 = DetachedCriteria.forClass(Note.class);

            dCriteria2.add(Restrictions.eq("userCourse", userCourse));

            List<Note> noteList = noteService.queryAllOfCondition(Note.class, dCriteria2);

            int noteNum1 = noteList.size();

            noteSum = noteSum + noteNum1;
        }
        int credit = user.getCredit();
        System.out.println("credit----" + credit);
        Level level = userService.getUserLevel(credit);
        request.setAttribute("level", level);
        request.setAttribute("course", course);
        request.setAttribute("userNum", userNum);
        request.setAttribute("noteSum", noteSum);
        request.setAttribute("courseList1", courseList1);
        return new ModelAndView("/note/courseNote", "courseList", courseList);
    }

    @RequestMapping("objGrade.htm")
    public ModelAndView objGrade(HttpServletRequest re) {
        String ObjId = re.getParameter("courseId");

        DetachedCriteria dCriteria = DetachedCriteria.forClass(Grade.class);

        dCriteria.add(Restrictions.eq("gradeObject", ObjId));
        List<Grade> list = noteService.queryAllOfCondition(Grade.class, dCriteria);
        double a = 0;
        if (list.size() != 0) {
            a = noteService.queryGrade(ObjId);
        } else {

            a = 0;
        }

        System.out.println(a);

        re.setAttribute("a", a);
        return new ModelAndView("/homePage/test");
    }

    @RequestMapping("doGrade.htm")
    public void doGrade(HttpServletRequest req, HttpServletResponse response) throws Exception {
        // FIXME
        log.info("==================doGrade->START==========");

        PrintWriter out = response.getWriter();
        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            //FIXME
            log.info("===================user={}", user);
            out.print("go");
        } else {
            String objectId = req.getParameter("courseId");
            String score = req.getParameter("score");
//            int mark = Integer.parseInt(score);
            double mark = Double.parseDouble(score);
            // FIXME
            System.out.println("================mark=========="+mark);

            boolean flag = noteService.isAreadyGrade(user, objectId);
            if (flag) {
                Grade grade = new Grade();
                grade.setGradeId(UUIDGenerator.randomUUID());
                grade.setGradeObject(objectId);
                grade.setMark(mark);
                grade.setUser(user);
                noteService.save(grade);
                out.print("ok");
            } else {
                out.print("no");
            }
        }
        //FIXME
        log.info("===================doGrade->END=============");
        out.close();
    }
}
