/**
 * 
 */
package labs.modules.files.service;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import labs.common.persistence.Page;
import labs.common.service.CrudService;
import labs.common.service.ServiceException;
import labs.modules.files.entity.LabFileAttributes;
import labs.modules.files.dao.LabFileAttributesDao;
import labs.modules.yq.commons.Commons;

/**
 * 文件资料管理Service
 * @author YL
 * @version 2015-05-30
 */
@Service
@Transactional(readOnly = true)
public class LabFileAttributesService extends CrudService<LabFileAttributesDao, LabFileAttributes> {

	public LabFileAttributes get(String id) {
		return super.get(id);
	}
	
	public List<LabFileAttributes> findList(LabFileAttributes labFileAttributes) {
		return super.findList(labFileAttributes);
	}
	
	public Page<LabFileAttributes> findPage(Page<LabFileAttributes> page, LabFileAttributes labFileAttributes) {
		return super.findPage(page, labFileAttributes);
	}

	/**
	 * 生成文件资料编号
	 * @param seq
	 * @return
	 */
	private String createFileSerial(String key) {
		String seq = super.genSeq(key);
//		String date = new SimpleDateFormat("MMdd").format(new Date());
		return Commons.FILE_ID_PREFIX + StringUtils.leftPad(seq, 8, '0');
	}
	
	
	@Transactional(readOnly = false)
	public void save(LabFileAttributes labFileAttributes) {

		try{
			//新增操作，设置非空默认值
			if(StringUtils.isEmpty(labFileAttributes.getId())){
				labFileAttributes.setFilestatus(Commons.FILE_STATUS_IDLE);  //当前状态-空闲
				labFileAttributes.setFileid(createFileSerial(LabFileAttributes.class.getSimpleName()));
				
			}
			super.save(labFileAttributes);
		}catch(ServiceException e){
			logger.error(e.getMessage());
			throw e;
		}catch(Exception e){
			logger.error(e.getMessage());
			throw new ServiceException(Commons.CM_MSG_FAIL);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(LabFileAttributes labFileAttributes) {
		super.delete(labFileAttributes);
	}
	
	/**
	 * 根据申请单号更新资料状态
	 * @param hm,必须包含参数： borrowId 借用单号 ，dqzt 当前状态
	 */
	public void updateDqztByBorrowId(HashMap<String,String> hm){
		dao.updateDqztByBorrowId(hm);
	}
}