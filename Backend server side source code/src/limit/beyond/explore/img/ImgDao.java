package limit.beyond.explore.img;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import limit.beyond.explore.util.base.BaseImpl;
import limit.beyond.explore.util.base.BaseQueryModel;
import limit.beyond.explore.util.utils.PageHibernateCallback;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;


/**
 * 用户模块Dao层代码
 * 
 * 
 */
public class ImgDao extends BaseImpl<Img>{ 
	
	private SessionFactory sessionFactory;
	private HibernateTemplate hibernateTemplate;

	public void setSessonFactory(SessionFactory sessionFactory) {
		hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	public Integer findCount() {
		final String sql = "select count(*) from tbl_img";

		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
				List list = query.list();
				return list;
			}
		});

		if(list.size()>0){
			
			String getCount = list.toString();
			System.out.println(getCount);
			String count  = getCount.substring(11, getCount.indexOf("}"));
			System.out.println(count);
			Integer it = Integer.valueOf(count);
			return it;
		}
		return null;
	}

	public List<Img> findByPage(int begin, int limit) {
		final String sql = "select * from tbl_img limit "+begin+" , "+limit;

		System.out.println(sql);
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
				List list = query.list();
				return list;
			}
		});
		if(list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm) {
		// TODO Auto-generated method stub
		
	}

}
