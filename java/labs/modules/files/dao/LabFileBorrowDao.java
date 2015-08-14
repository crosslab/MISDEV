/**
 * 
 */
package labs.modules.files.dao;

import java.util.List;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.files.entity.LabFileBorrow;

/**
 * 文件资料借阅记录DAO接口
 * @author YL
 * @version 2015-05-30
 */
@MyBatisDao
public interface LabFileBorrowDao extends CrudDao<LabFileBorrow> {

	
	/**
	 * 根据借用申请单号查询借用申请单
	 * @param reqNo
	 * @return
	 */
	List<LabFileBorrow> selectByReqNo(String reqNo);
	
	/**
	 * 查询状态为待审批带所有借用申请单，供设备申请页面选择使用
	 * @return
	 */
	List<LabFileBorrow> selectRequestNo();

	/**
	 * 借用记录，根据文件id关联“关联表”查询借用记录
	 * @param fileid
	 * @return
	 */
	List<LabFileBorrow> findByFileId(String fileid);
	
}