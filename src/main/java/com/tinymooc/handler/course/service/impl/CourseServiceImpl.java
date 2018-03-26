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
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class CourseServiceImpl extends BaseServiceImpl implements CourseService {

    private static final Logger logger = LoggerFactory.getLogger(CourseServiceImpl.class);

    @Override
    public boolean isAreadyGrade(User user, String ObjId) {
        List<Grade> list = getCurrentSession().createCriteria(Grade.class).add(Restrictions.eq("user", user)).add(Restrictions.eq("gradeObject", ObjId)).list();
        if (list.size() != 0) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public double queryGrade(String ObjId) {
        String sql = "select avg(mark) from Grade where GRADE_OBJECT='" + ObjId + "'";
        double avgGrade = (double) getCurrentSession().createQuery(sql).uniqueResult();
        double userGrade = avgGrade + 4.9;
        return userGrade;
    }

    public List<Course> getCourses() {
        String sql = "SELECT * FROM course";
        return (List<Course>) this.getJdbcTemplate().query(sql, new CourseRowMapper());
    }

    private final String INDEXPATH = "d:\\search\\index";
    private Analyzer analyzer = new StandardAnalyzer();

    public List<Course> getCourses(String query) {
        try {
            List<Course> qlist = new ArrayList<Course>();
            IndexSearcher indexSearcher = new IndexSearcher(INDEXPATH);
            long begin = new Date().getTime();
            //下面的是进行title,content 两个范围内进行收索. SHOULD 表示OR
            BooleanClause.Occur[] clauses = {BooleanClause.Occur.SHOULD, BooleanClause.Occur.SHOULD};
            Query queryOBJ = MultiFieldQueryParser.parse(query, new String[]{"courseIntro", "courseTitle"}, clauses, new StandardAnalyzer());//parser.parse(query);
            Filter filter = null;
            //################# 搜索相似度最高的记录 ###################
            TopDocs topDocs = indexSearcher.search(queryOBJ, filter, 1000);
            Course course = null;

            //输出结果
            for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
                Document targetDoc = indexSearcher.doc(scoreDoc.doc);
                course = new Course();
                String courseIntro = targetDoc.get("courseIntro");
                String courseTitle = targetDoc.get("courseTitle");
                String courseId = targetDoc.get("courseId");
                TokenStream contentTokenStream = analyzer.tokenStream("courseIntro", new StringReader(courseIntro));
                TokenStream titleTokenStream = analyzer.tokenStream("courseTitle", new StringReader(courseTitle));
                course.setCourseIntro(courseIntro);
                course.setCourseTitle(courseTitle);
                course.setCourseId(courseId);
                course.setType(targetDoc.get("type"));
                course.setCourseState(targetDoc.get("courseState"));
                qlist.add(course);
            }
            indexSearcher.close();
            return qlist;
        } catch (Exception e) {
            logger.error("getCourses error.");
            return null;
        }
    }

    public boolean createCourseIndex() {
        List<Course> list = this.getCourses();
        try {
            Directory directory = FSDirectory.getDirectory(INDEXPATH);
            IndexWriter indexWriter = new IndexWriter(directory, analyzer, true, IndexWriter.MaxFieldLength.LIMITED);
            for (Course course : list) {
                Document doc = new Document();
                String courseTitle = course.getCourseTitle() == null ? "" : course.getCourseTitle().trim();
                String courseIntro = course.getCourseIntro() == null ? "" : course.getCourseIntro();
                String courseId = course.getCourseId() == null ? "" : course.getCourseId();
                String type = course.getType() == null ? "" : course.getType();
                String courseState = course.getCourseState() == null ? "" : course.getCourseState();
                doc.add(new Field("courseIntro", courseIntro, Field.Store.YES, Field.Index.ANALYZED, Field.TermVector.YES));
                doc.add(new Field("courseTitle", courseTitle, Field.Store.YES, Field.Index.ANALYZED, Field.TermVector.YES));
                doc.add(new Field("courseId", courseId, Field.Store.COMPRESS, Field.Index.NO));
                doc.add(new Field("type", type, Field.Store.COMPRESS, Field.Index.NO));
                doc.add(new Field("courseState", courseState, Field.Store.COMPRESS, Field.Index.NO));

                indexWriter.addDocument(doc);
            }
            indexWriter.optimize();
            indexWriter.close();
            return true;
        } catch (Exception e) {
            logger.error("createCourseIndex error.");
            return false;
        }
    }

    /**
     * check Index is Existed
     *
     * @return true or false
     */
    private boolean isIndexExisted() {
        try {
            File dir = new File(INDEXPATH);
            if (dir.listFiles().length > 0)
                return true;
            else
                return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
