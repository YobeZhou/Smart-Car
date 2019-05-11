package limit.beyond.explore.auth.root.dao.dao;

import limit.beyond.explore.auth.root.vo.EmpModel;
import limit.beyond.explore.util.base.BaseDao;


public interface EmpDao extends BaseDao<EmpModel> {
	public EmpModel getByUserNameAndPwd(String userName, String pwd);

	public boolean updatePwdByUserNameAndPwd(String userName, String pwd,
			String newPwd);

	public EmpModel getByUserNameAndPwd(Long uuid);
}
