package com.tinymooc.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import com.tinymooc.common.domain.Course;

import org.springframework.jdbc.core.RowMapper;


/**
 * @Author fenglong
 * @CreateDate Jun 4, 2010 1:31:54 PM
 * @Version V 1.0
 * @CopyRight 2010 jushi
 */
public class CourseRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course course = new Course();
		ResultSetMetaData meta = rs.getMetaData();
		int colNum = meta.getColumnCount();
		for (int i = 1; i <= colNum; i++) {
			String colName = meta.getColumnName(i).toLowerCase();

                if ("course_intro".equals(colName)) {
                course.setCourseTitle(rs.getString(i));
			} else if ("course_title".equals(colName)) {
                course.setCourseIntro(rs.getString(i));
			}    else if ("course_id".equals(colName)) {
                course.setCourseId(rs.getString(i));
            }
                else if ("type".equals(colName)) {
                course.setType(rs.getString(i));
				//...
			}
            else if("course_state".equals(colName))     {
                    course.setCourseState(rs.getString(i));
                }
                else if("parent_id".equals(colName))     {
                    course.setCourseState(rs.getString(i));
                }
		}
		return course;
	}
}
