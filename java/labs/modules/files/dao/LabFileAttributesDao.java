/**
 * 
 */
package labs.modules.files.dao;

import java.util.HashMap;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.files.entity.LabFileAttributes;

/**
 * 文件资料管理DAO接口
 * @author YL
 * @version 2015-05-30
 */
@MyBatisDao
public interface LabFileAttributesDao extends CrudDao<LabFileAttributes> {

	/**
	 * 根据申请单号 更新资料状态
	 * @param hm,必须包含等key:fileStatus(状态),borrowId(申请单号)
	 */
	public void updateDqztByBorrowId(HashMap<String,String> hm);
}