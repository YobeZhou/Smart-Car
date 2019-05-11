package limit.beyond.explore.util.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import limit.beyond.explore.util.exception.AppException;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;



public abstract class BaseImpl<T> extends HibernateDaoSupport{
	
	private Class<T> entityClass ;
	//将entityClass初始化
	public BaseImpl(){
		Type genType = getClass().getGenericSuperclass();   
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();   
		entityClass =  (Class)params[0];  
	}
	
	public void save(T t) {
		try {
			this.getHibernateTemplate().save(t);
		} catch (Exception e) {
			throw new AppException("ERR_EMP_DATABASE_IS_ERROR",e);
		}
	}

	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}
	
	/**
	 * @param entityClass
	 * @param entityId
	 * @return
	 */
/*	public <T> T find(Class<T> entityClass, Object entityId) {
	    return (T)this.getHibernateTemplate().get(entityClass, (Serializable) entityId);
	}*/
	
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}
	
	public T get(Serializable uuid) {
		return this.getHibernateTemplate().get(entityClass,uuid);
	}
	
	public List<T> getAll() {
		DetachedCriteria dc = DetachedCriteria.forClass(entityClass);
		return this.getHibernateTemplate().findByCriteria(dc);
	}

	public List<T> getAll(BaseQueryModel qm, Integer pageNum,Integer pageCount) {
		DetachedCriteria dc = DetachedCriteria.forClass(entityClass);
		
		doQbc(dc,qm);
		
		return this.getHibernateTemplate().findByCriteria(dc,(pageNum-1)*pageCount,pageCount);
	}

	public Integer getCount(BaseQueryModel qm) {
		DetachedCriteria dc = DetachedCriteria.forClass(entityClass);
		dc.setProjection(Projections.rowCount());
		
		doQbc(dc,qm);
		
		List<Long> count = this.getHibernateTemplate().findByCriteria(dc);
		return count.get(0).intValue();
	}
	
	public abstract void doQbc(DetachedCriteria dc,BaseQueryModel qm);

}
