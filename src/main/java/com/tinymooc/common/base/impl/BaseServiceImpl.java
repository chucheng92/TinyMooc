package com.tinymooc.common.base.impl;

/**
 * Created by 哓哓 on 2015/11/26 0026.
 */

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import com.tinymooc.common.base.BaseService;
import org.hibernate.criterion.Restrictions;
import com.tinymooc.common.domain.DataDic;
import com.tinymooc.common.tag.pageTag.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @date 2015年11月24日12:30:03
 * DetachedCriteria:
 * 在Hibernate2中，Criteria实例是与创建它的Session实例具有相同的生命周期的，也就是说，Session实例是它所创建的Criteria实例的宿主，
 * 当Session关闭时，寄生于Session实例的Criteria都将失效。这就对Criteria的重用造成了困难，为了实现Criteria实例的重用，
 * 在Hibernate3中提供了一个DetachedCriteria类，DetachedCriteria实例的生命周期与Session实例的生命周期无关，
 * 我们可以利用DetachedCriteria对一些常用的Criteria查询条件进行抽离，
 * 当需要进行检索时再与Session实例关联，从而获得运行期的Criteria实例。
 * 正如我们所见，DetachedCriteria的生存周期与session实例无关，当需要进行检索时，通过getExecutableCriteria(session)方法，
 * 与当前的Session实例关联并获得运行期的Criteria实例，完成检索。
 */
@Transactional
@Service
public class BaseServiceImpl extends JdbcDaoSupport implements BaseService {

    @Autowired(required = true)
    private SessionFactory sessionFactory;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional()
    public void delete(Object object) {
        getCurrentSession().delete(object);

    }

    @Transactional()
    public void saveOrUpdate(Object object) {
        getCurrentSession().saveOrUpdate(object);

    }

    @SuppressWarnings("unchecked")
    @Transactional(readOnly = true)
    public <T> List<T> queryAll(Class<T> clazz) {
        Criteria criteria = getCurrentSession().createCriteria(clazz);
        List<T> list = criteria.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    @Transactional(readOnly = true)
    public <T> T findById(Class<T> clazz, String id) {

        return (T) getCurrentSession().get(clazz, id);
    }

    @Transactional
    public void deleteById(Class<?> clazz, String id) {
        delete(findById(clazz, id));
    }

    @Transactional
    public void save(Object object) {
        getCurrentSession().save(object);

    }

    @Transactional
    public void update(Object object) {
        getCurrentSession().update(object);

    }

    /**
     * 计算总页数（Criteria）
     *
     * @param clazz
     * @param pageSize
     * @return 总页数
     */
    @Transactional(readOnly = true)
    public int countTotalPage(Class<?> clazz, int pageSize) {
        Criteria criteria = getCurrentSession().createCriteria(clazz);

        // 查询总记录数 使用Criteria和Projections的静态方法
        int totalRecord = ((Long) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();

        int totalPage = (int) Math.ceil(((double) totalRecord / pageSize));
        return totalPage;
    }

    /**
     * 当前页数据
     *
     * @param clazz
     * @param pageSize
     * @param <T>
     * @return List<T>
     */
    @SuppressWarnings("unchecked")
    @Transactional(readOnly = true)
    public <T> List<T> getByPage(Class<T> clazz, int pageSize) {
        int curPage = PageHelper.getCurPage();
        if (curPage < 1)
            curPage = 1;
        Criteria criteria = getCurrentSession().createCriteria(clazz);
        criteria.setFirstResult((curPage - 1) * pageSize);
        criteria.setMaxResults(pageSize);
        List<T> list = criteria.list();
        return list;
    }

    /**
     * 计算总页数（入参为detachedCriteria）
     *
     * @param dCriteria
     * @param pageSize
     * @return
     */
    @Transactional(readOnly = true)
    public int countTotalPage(DetachedCriteria dCriteria, int pageSize) {
        Criteria criteria = dCriteria.getExecutableCriteria(getCurrentSession());
        int totalRecord = ((Long) criteria
                .setProjection(Projections.rowCount()).uniqueResult())
                .intValue();
        criteria.setProjection(null);
        int totalPage = (int) Math.ceil(((double) totalRecord / pageSize));
        return totalPage;
    }

    @Transactional(readOnly = true)
    public int countNum(DetachedCriteria dCriteria) {
        Criteria criteria = dCriteria
                .getExecutableCriteria(getCurrentSession());
        int num = ((Long) criteria
                .setProjection(Projections.rowCount()).uniqueResult())
                .intValue();
        return num;
    }

    @Transactional(readOnly = true)
    public List<?> getByPage(DetachedCriteria dCriteria, int pageSize) {

        int curPage = PageHelper.getCurPage();
//		System.out.println(curPage);
        Criteria criteria = dCriteria.getExecutableCriteria(getCurrentSession());
        criteria.setFirstResult((curPage - 1) * pageSize);
        criteria.setMaxResults(pageSize);
//		criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
        List<?> list = criteria.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    @Transactional(readOnly = true)
    public <T> List<T> queryAllOfCondition(Class<T> clazz, DetachedCriteria dCriteria) {
        Criteria criteria = dCriteria.getExecutableCriteria(getCurrentSession());
        List<T> list = criteria.list();
        return list;
    }

    @Transactional
    public <T> void deleteAll(List<T> list) {
        for (T object : list) {
            getCurrentSession().delete(object);
        }
    }

    @Transactional
    public <T> void saveAll(List<T> list) {
        for (T object : list) {
            getCurrentSession().save(object);
        }
    }

    @Transactional
    public <T> void updateAll(List<T> objList) {
        for (T object : objList) {
            getCurrentSession().update(object);
        }
    }

//	 @Transactional(readOnly=true)
//		public List<DataDic> getDataDicByDescription(String description) {
//			Criteria criteria=getCurrentSession().createCriteria(DataDic.class);
//			criteria.add(Restrictions.eq("dataDicDescription", description));
//			List<DataDic> list=criteria.list();
//			return list;
//		}
//	    @Transactional(readOnly=true)
//		public List<DataDic> getDataDicByKey(String key) {
//			Criteria criteria=getCurrentSession().createCriteria(DataDic.class);
//			criteria.add(Restrictions.eq("dataDicKey", key));
//			List<DataDic> list=criteria.list();
//			return list;
//		}

    @SuppressWarnings("unchecked")
    @Transactional(readOnly = true)
    public <T> List<T> queryMaxNumOfCondition(Class<T> clazz, DetachedCriteria dCriteria, int num) {
        Criteria criteria = dCriteria.getExecutableCriteria(getCurrentSession());
        List<T> list = criteria.setMaxResults(num).list();
        return list;
    }

}
