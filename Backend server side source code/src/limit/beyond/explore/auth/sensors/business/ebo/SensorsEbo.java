package limit.beyond.explore.auth.sensors.business.ebo;

import java.io.Serializable;
import java.util.List;

import limit.beyond.explore.auth.sensors.business.ebi.SensorsEbi;
import limit.beyond.explore.auth.sensors.dao.dao.SensorsDao;
import limit.beyond.explore.auth.sensors.vo.SensorsModel;
import limit.beyond.explore.auth.sensors.vo.SensorsQueryModel;
import limit.beyond.explore.util.base.BaseQueryModel;

public class SensorsEbo implements SensorsEbi{

	private SensorsDao sensorsDao;
	public void setSensorsDao(SensorsDao sensorsDao) {
		this.sensorsDao = sensorsDao;
	}

	public void save(SensorsModel t) {
		// TODO Auto-generated method stub
		 sensorsDao.save(t);
	}

	public void update(SensorsModel t) {
		// TODO Auto-generated method stub
		 sensorsDao.update(t);
	}

	public void delete(SensorsModel t) {
		 sensorsDao.delete(t);
	}

	public List<SensorsModel> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public SensorsModel get(Serializable uuid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<SensorsModel> getAll(BaseQueryModel qm, Integer pageNum,
			Integer pageCount) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer getCount(BaseQueryModel qm) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<SensorsQueryModel> checkTime(String string) {
		// TODO Auto-generated method stub
		return sensorsDao.checkTime(string);
	}

	public List<SensorsQueryModel> chartTime(String temp, String t1, String t2) {
		// TODO Auto-generated method stub
		return sensorsDao.chartTime(temp,t1,t2);
	}

	public List<SensorsModel>  getNew() {
		// TODO Auto-generated method stub
		return sensorsDao.getNew();
	}

}
