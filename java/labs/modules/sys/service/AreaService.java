/**
 * 
 */
package labs.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import labs.common.service.TreeService;
import labs.modules.sys.dao.AreaDao;
import labs.modules.sys.entity.Area;
import labs.modules.sys.utils.UserUtils;

/**
 * 区域Service
 * @author labs
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends TreeService<AreaDao, Area> {

	public List<Area> findAll(){
		return UserUtils.getAreaList();
	}

	@Transactional(readOnly = false)
	public void save(Area area) {
		super.save(area);
		UserUtils.removeTmpCache();
	}
	
	@Transactional(readOnly = false)
	public void delete(Area area) {
		super.delete(area);
		UserUtils.removeTmpCache();
	}
	
}
