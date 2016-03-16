package com.tinymooc.handler.boot;

import com.tinymooc.common.domain.Video;
import com.tinymooc.handler.video.service.VideoService;
import com.tinymooc.util.CSVUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * Created by 哓哓 on 2016/1/19 0019.
 */
@Controller
public class PrepareData {
    @Autowired
    private VideoService videoService;

    @RequestMapping("boot.do")
    public ModelAndView boot(HttpServletRequest request) {
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
        return new ModelAndView("/test/prepareData", "count", count);
    }
}
