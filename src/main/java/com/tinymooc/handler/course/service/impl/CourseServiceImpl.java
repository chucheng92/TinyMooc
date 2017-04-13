package com.tinymooc.handler.course.service.impl;

import java.util.List;
import java.util.ArrayList;
import java.io.File;
import java.util.Date;
import java.io.StringReader;
import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.Course;
import com.tinymooc.common.domain.Grade;
import com.tinymooc.common.domain.User;
import com.tinymooc.handler.course.service.CourseService;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.util.CourseRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class CourseServiceImpl extends BaseServiceImpl implements CourseService {

	@Override
	public boolean isAreadyGrade(User user, String ObjId) {
		// TODO Auto-generated method stub
		
		List<Grade> list=getCurrentSession().createCriteria(Grade.class).add(Restrictions.eq("user", user)).add(Restrictions.eq("gradeObject", ObjId)).list();
		
		if(list.size()!=0){
			return false;
		}else{
			return true;	
		}
	}

	@Override
	public double queryGrade(String ObjId) {
		// TODO Auto-generated method stub
        String sql="select avg(mark) from Grade where GRADE_OBJECT='"+ObjId+"'";
		double avgGrade=(double) getCurrentSession().createQuery(sql).uniqueResult();

		double userGrade = avgGrade+4.9;

        return userGrade;
	}

    public List<Course> getCourses() {
        String sql = "SELECT * FROM course";
        return (List<Course>)this.getJdbcTemplate().query(sql, new CourseRowMapper());
    }

   // private IArticleDAO articleDAO;


    private final String indexTest = null;
    private final String INDEXPATH = "d:\\search\\index";

     //1、字符串创建内存索引
    private Analyzer analyzer = new StandardAnalyzer();

    public List<Course> getCourses(String query) {

        try{
//            String path = req.getSession().getServletContext().getRealPath("/");
              System.out.println("寻求index合适路径：" + indexTest);
            List<Course> qlist = new ArrayList<Course>();

            IndexSearcher indexSearcher = new IndexSearcher(INDEXPATH);

//		 System.out.println("rootPath:" + rootPath);
            //QueryParser parser = new QueryParser(fieldName, analyzer); //单 key 搜索
            //Query queryOBJ = parser.parse(query);
            System.out.println(">>> 2.开始读取索引... ... 通过关键字：【 "+ query +" 】");
            long begin = new Date().getTime();

            //下面的是进行title,content 两个范围内进行收索. SHOULD 表示OR
            BooleanClause.Occur[] clauses = { BooleanClause.Occur.SHOULD,BooleanClause.Occur.SHOULD };
            Query queryOBJ = MultiFieldQueryParser.parse(query, new String[]{"courseIntro","courseTitle"}, clauses, new StandardAnalyzer());//parser.parse(query);
            Filter filter = null;

            //################# 搜索相似度最高的记录 ###################
            TopDocs topDocs = indexSearcher.search(queryOBJ, filter, 1000);
            //TopDocs topDocs = indexSearcher.search(queryOBJ , 10000);
            System.out.println("*** 共匹配：" + topDocs.totalHits + "个 ***");

            Course course = null;

            //输出结果
            for (ScoreDoc scoreDoc : topDocs.scoreDocs){
                Document targetDoc = indexSearcher.doc(scoreDoc.doc);
                course = new Course();

                //设置高亮显示格式
             ///   SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<font color='red'><strong>", "</strong></font>");
				/* 语法高亮显示设置 */
            ///    Highlighter highlighter = new Highlighter(simpleHTMLFormatter,new QueryScorer(queryOBJ));
          ///      highlighter.setTextFragmenter(new SimpleFragmenter(100));

                // 设置高亮 设置 title,content 字段
                String courseIntro = targetDoc.get("courseIntro");
                String courseTitle = targetDoc.get("courseTitle");
                String courseId = targetDoc.get("courseId");

                TokenStream contentTokenStream = analyzer.tokenStream("courseIntro",new StringReader(courseIntro));
                TokenStream titleTokenStream = analyzer.tokenStream("courseTitle",new StringReader(courseTitle));

          ///      String highLightContent = highlighter.getBestFragment(contentTokenStream, courseIntro);
          ///      String highLightTitle = highlighter.getBestFragment(titleTokenStream, courseTitle);


//                if(highLightTitle == null)
//                    highLightTitle = courseTitle;
//
//                if(highLightContent == null)
//                    highLightContent = courseIntro;
                course.setCourseIntro(courseIntro);
                course.setCourseTitle(courseTitle);
                course.setCourseId(courseId);

                course.setType(targetDoc.get("type"));
                course.setCourseState(targetDoc.get("courseState"));
              //命中率  course.setTotalHits(topDocs.totalHits);

                qlist.add(course);
            }

            long end = new Date().getTime();
            System.out.println(">>> 3.搜索完毕... ... 共花费：" + (end - begin) +"毫秒...");

            indexSearcher.close();

            return qlist;

        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public boolean createCourseIndex()
    {
        //检查索引是否存在
//		if(this.isIndexExisted())
//			return this.isIndexExisted();

        List<Course> list = this.getCourses();

        try
        {
            Directory directory = FSDirectory.getDirectory(INDEXPATH);
            IndexWriter indexWriter = new IndexWriter(directory, analyzer ,true, IndexWriter.MaxFieldLength.LIMITED);

            long begin = new Date().getTime();
            System.out.println("***所有课程数量***" + list.size());
            System.out.println("***所有课程id***" + list.get(1).getCourseId());
            System.out.println("***所有课程1的Title***" + list.get(1).getCourseTitle());
            for(Course course: list)
            {
                Document doc = new Document();

                String courseTitle = course.getCourseTitle() == null ? "" : course.getCourseTitle().trim();
//                System.out.println("###" + courseTitle);
                String courseIntro = course.getCourseIntro() == null ? "" : course.getCourseIntro();
//                System.out.println("***" + courseIntro);
                String courseId = course.getCourseId() == null ? "" : course.getCourseId();
//                System.out.println("***" + courseId);
                String type = course.getType() == null ? "" : course.getType();
                String courseState = course.getCourseState() == null ? "" : course.getCourseState();
           //     Object course1 = course.getCourse() == null ? "" : course.getCourse();
//                System.out.println("***" + type);
                doc.add(new Field("courseIntro", courseIntro, Field.Store.YES, Field.Index.ANALYZED, Field.TermVector.YES));
                doc.add(new Field("courseTitle", courseTitle, Field.Store.YES, Field.Index.ANALYZED, Field.TermVector.YES));
                doc.add(new Field("courseId", courseId, Field.Store.COMPRESS,Field.Index.NO));
                doc.add(new Field("type", type, Field.Store.COMPRESS,Field.Index.NO));
                doc.add(new Field("courseState", courseState, Field.Store.COMPRESS,Field.Index.NO));
          //      doc.add(new Field("course", course1, Field.Store.COMPRESS,Field.Index.NO));

                indexWriter.addDocument(doc);
            }
            long end = new Date().getTime();
            System.out.println(">>> 1.存入索引完毕.. 共花费：" + (end - begin) +"毫秒...");

            indexWriter.optimize();
            indexWriter.close();
            return true;

        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * check Index is Existed
     * @return true or false
     */
    private boolean isIndexExisted()
    {
        try
        {
            File dir = new File(INDEXPATH);
            if(dir.listFiles().length>0)
                return true;
            else
                return false;

        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }





}
