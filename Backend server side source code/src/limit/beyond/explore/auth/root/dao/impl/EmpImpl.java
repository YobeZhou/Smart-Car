package limit.beyond.explore.auth.root.dao.impl;

import java.util.Date;
import java.util.List;

import limit.beyond.explore.auth.root.dao.dao.EmpDao;
import limit.beyond.explore.auth.root.vo.EmpModel;
import limit.beyond.explore.auth.root.vo.EmpQueryModel;
import limit.beyond.explore.util.base.BaseImpl;
import limit.beyond.explore.util.base.BaseQueryModel;

import org.apache.log4j.lf5.PassingLogRecordFilter;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;


public class EmpImpl extends BaseImpl<EmpModel> implements EmpDao{

	public void doQbc(DetachedCriteria dc,BaseQueryModel qm){
	
	}
	
	public EmpModel getByUserNameAndPwd(Long uuid) {
		String hql ="from EmpModel where uuid = ?";
		List<EmpModel> temp = this.getHibernateTemplate().find(hql,uuid);
		return	temp.size()>0 ? temp.get(0):null; 
	}

	public boolean updatePwdByUserNameAndPwd(String userName, String pwd,String newPwd) {
		String hql = " update EmpModel set pwd = ? where userName = ? and pwd = ?";
		int row = this.getHibernateTemplate().bulkUpdate(hql,newPwd,userName,pwd);
		return row > 0;
	}

	public EmpModel getByUserNameAndPwd(String userName, String pwd) {
		String hql ="from EmpModel where userName = ? and pwd = ?";
		List<EmpModel> temp = this.getHibernateTemplate().find(hql,userName,pwd);
		return	temp.size()>0 ? temp.get(0):null; 
	}

}




