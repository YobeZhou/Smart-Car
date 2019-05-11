package limit.beyond.explore.auth.root.business.ebo;

import java.io.Serializable;
import java.util.List;

import limit.beyond.explore.auth.root.business.ebi.EmpEbi;
import limit.beyond.explore.auth.root.dao.dao.EmpDao;
import limit.beyond.explore.auth.root.vo.EmpModel;
import limit.beyond.explore.util.base.BaseQueryModel;
import limit.beyond.explore.util.exception.AppException;
import limit.beyond.explore.util.format.MD5Utils;


public class EmpEbo implements EmpEbi{
	private EmpDao empDao;
	public void setEmpDao(EmpDao empDao) {
		this.empDao = empDao;
	}

	public void save(EmpModel em) {
		if(em.getUserName()==null || em.getUserName().trim().length() == 0){
			throw new AppException("INFO_EMP_USERNAME_IS_EMPTY");
		}
		em.setPwd(MD5Utils.md5(em.getPwd()));
		em.setLastLoginTime(System.currentTimeMillis());
		em.setLastLoginIp("-");
		em.setLoginTimes(0);
		empDao.save(em);
	}

	public void update(EmpModel em) {
		EmpModel temp = empDao.get(em.getUuid());
		temp.setName(em.getName());
		temp.setEmail(em.getEmail());
		temp.setTele(em.getTele());
		temp.setGender(em.getGender());
		temp.setAddress(em.getAddress());

		temp.setUserName(em.getUserName());
		temp.setBirthday(em.getBirthday());
		
	}

	public void delete(EmpModel em) {
		empDao.delete(em);
	}

	public EmpModel get(Serializable uuid) {
		return empDao.get(uuid);
	}

	public List<EmpModel> getAll() {
		return empDao.getAll();
	}

	public List<EmpModel> getAll(BaseQueryModel qm, Integer pageNum,Integer pageCount) {
		return empDao.getAll(qm,pageNum,pageCount);
	}

	public Integer getCount(BaseQueryModel qm) {
		return empDao.getCount(qm);
	}

	public EmpModel login(String userName, String pwd,String lastLoginIp) {
		pwd = MD5Utils.md5(pwd);
		EmpModel loginEm = empDao.getByUserNameAndPwd(userName,pwd);
		if(loginEm != null){ 
			loginEm.setLoginTimes(loginEm.getLoginTimes()+1);
			loginEm.setLastLoginTime(System.currentTimeMillis());
			loginEm.setLastLoginIp(lastLoginIp);
		}
		return loginEm;
	}

	public boolean changePwd(String userName, String pwd, String newPwd) {
		pwd = MD5Utils.md5(pwd);
		newPwd = MD5Utils.md5(newPwd);
		return empDao.updatePwdByUserNameAndPwd(userName,pwd,newPwd);
	}

	public EmpModel getByUserNameAndPwd(Long uuid) {
		// TODO Auto-generated method stub
		return empDao.getByUserNameAndPwd(uuid);
	}
}
