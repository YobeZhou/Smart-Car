package limit.beyond.explore.auth.sensors.dao.impl;

import java.sql.SQLException;
import java.util.List;

import limit.beyond.explore.auth.sensors.dao.dao.SensorsDao;
import limit.beyond.explore.auth.sensors.vo.SensorsModel;
import limit.beyond.explore.auth.sensors.vo.SensorsQueryModel;
import limit.beyond.explore.util.base.BaseImpl;
import limit.beyond.explore.util.base.BaseQueryModel;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;



public class SensorsImpl extends BaseImpl<SensorsModel> implements SensorsDao {

	@Override
	public void doQbc(DetachedCriteria dc, BaseQueryModel qm) {
		// TODO Auto-generated method stub

	}

	public List<SensorsQueryModel> checkTime(String string) {
		final String sql = "SELECT max(time),min(time) from tbl_sensors";

		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
				List list = query.list();
				return list;
			}
		});
		System.err.println(sql);
		return list;
	}

	public List<SensorsQueryModel> chartTime(String temp, String t1, String t2) {

		final String sql = "SELECT temp,time from tbl_sensors where time>'"+ t1 +"' and time < '"+ t2 +"' ";
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
				List list = query.list();
				System.out.println("成功查询到数据");
				return list;
			}
		});
		return list;

	}

	public List<SensorsModel>  getNew() {
		 
		 final String sql = "SELECT * from tbl_sensors  order by time desc limit 1";
			List list = getHibernateTemplate().executeFind(new HibernateCallback() {
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createSQLQuery(sql);
					query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
					List list = query.list();
					return list;
				}
			});
			return  list;
	}
}
