package limit.beyond.explore.auth.sensors.dao.dao;

import java.util.List;

import limit.beyond.explore.auth.sensors.vo.SensorsModel;
import limit.beyond.explore.auth.sensors.vo.SensorsQueryModel;
import limit.beyond.explore.util.base.BaseDao;

public interface SensorsDao extends BaseDao<SensorsModel>{

	List<SensorsQueryModel> checkTime(String string);

	List<SensorsQueryModel> chartTime(String temp, String t1, String t2);

	List<SensorsModel>  getNew();

}
