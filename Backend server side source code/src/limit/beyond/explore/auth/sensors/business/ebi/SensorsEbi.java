package limit.beyond.explore.auth.sensors.business.ebi;
import java.util.List;

import limit.beyond.explore.auth.sensors.vo.SensorsModel;
import limit.beyond.explore.auth.sensors.vo.SensorsQueryModel;
import limit.beyond.explore.util.base.BaseEbi;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface SensorsEbi extends BaseEbi<SensorsModel>{

	List<SensorsQueryModel> checkTime(String string);

	List<SensorsQueryModel> chartTime(String temp, String t1, String t2);

	List<SensorsModel>  getNew();

}
