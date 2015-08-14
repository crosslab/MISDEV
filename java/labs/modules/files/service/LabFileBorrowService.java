/**
 * 
 */
package labs.modules.files.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import labs.common.persistence.Page;
import labs.common.service.CrudService;
import labs.common.service.ServiceException;
import labs.modules.files.dao.LabFileBorrowDao;
import labs.modules.files.entity.LabFileAttributes;
import labs.modules.files.entity.LabFileBorrow;
import labs.modules.files.entity.LabFileBorrowRelationship;
import labs.modules.sys.entity.User;
import labs.modules.sys.service.SystemService;
import labs.modules.sys.utils.UserUtils;
import labs.modules.yq.commons.Commons;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 文件资料借阅记录Service
 * @author YL
 * @version 2015-05-30
 */
@Service
@Transactional(readOnly = true)
public class LabFileBorrowService extends CrudService<LabFileBorrowDao, LabFileBorrow> {

	@Autowired
	LabFileAttributesService fileAttrService;
	
	@Autowired
	LabFileBorrowRelationshipService relationshipService ;
	
	public LabFileBorrow get(String id) {
		return super.get(id);
	}
	
	public List<LabFileBorrow> findList(LabFileBorrow labFileBorrow) {
		return super.findList(labFileBorrow);
	}
	
	public Page<LabFileBorrow> findPage(Page<LabFileBorrow> page, LabFileBorrow labFileBorrow) {
		return super.findPage(page, labFileBorrow);
	}
	
	/**
	 * 生成文件资料借阅申请单编号
	 * @param seq
	 * @return
	 */
	private String createFileSerial(String key) {
		String seq = super.genSeq(key);
//		String date = new SimpleDateFormat("MMdd").format(new Date());
		return Commons.FILE_REQ_PREFIX + StringUtils.leftPad(seq, 8, '0');
	}
	
	@Transactional(readOnly = false)
	public void save(LabFileBorrow labFileBorrow) {
		try {
			//新增操作，设置非空默认值
			if(StringUtils.isEmpty(labFileBorrow.getId())){
				labFileBorrow.setFileborrowid(createFileSerial(LabFileBorrow.class.getSimpleName()));
				labFileBorrow.setFileborrowstatus(Commons.FILE_STATUS_REQE); //当前状态-待审批
			}
			super.save(labFileBorrow);
		}catch(ServiceException e){
			logger.error(e.getMessage());
			throw e;
		}catch(Exception e){
			logger.error(e.getMessage());
			throw new ServiceException(Commons.CM_MSG_FAIL);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(LabFileBorrow labFileBorrow) {
		super.delete(labFileBorrow);
	}
	
	/**
	 * 审批通过
	 * @param LabFileBorrow
	 */
	@Transactional(readOnly = false)
	public void approve(LabFileBorrow labFileApprove) {
	
		try {
			labFileApprove.setFileborrowstatus(Commons.FILE_STATUS_APPR); //当前状态-已审批
			labFileApprove.setApprovedate(new Date());
			super.save(labFileApprove);
		} catch (ServiceException e) {
			logger.error(e.getMessage());
			throw e;
		}catch(Exception e){
			logger.error(e.getMessage());
			throw new ServiceException(Commons.CM_MSG_FAIL);
		}
	}
	
	/**
	 * 审批拒绝
	 * @param LabFileBorrow
	 */
	@Transactional(readOnly = false)
	public void deny(LabFileBorrow labFileApprove) {
		
		try{
			labFileApprove.setFileborrowstatus(Commons.FILE_STATUS_REJT); //当前状态-已拒绝
			labFileApprove.setApprovedate(new Date());
			super.save(labFileApprove);
		}catch(ServiceException e){
			logger.error(e.getMessage());
			throw e;
		}catch(Exception e){
			logger.error(e.getMessage());
			throw new ServiceException(Commons.CM_MSG_FAIL);
		}
	}
	
	/**
	 * 查询状态为待审批的带所有文件资料借用申请单，供设备申请页面选择使用
	 * @return
	 */
	public List<LabFileBorrow> getRequestNo(){
		return dao.selectRequestNo();
	}
	
	/**
	 * 根据申请单号获得借用申请
	 * @param sqdh
	 * @return 
	 */
	private LabFileBorrow getReqNo(String borrowid){
		LabFileBorrow entity = new LabFileBorrow();
		entity.setFileborrowid(borrowid);
		List<LabFileBorrow> list = dao.selectByReqNo(borrowid);
		if(null == list || list.size()==0){
			throw new ServiceException("根据申请单号没有找到申请单信息。申请单号：" + borrowid);
		}
		return list.get(0);
	}

	/**
	 * 预定文件资料
	 * @param fileAttributes，页面绑定的文件属性
	 */
	@Transactional(readOnly = false)
	public void reserve(LabFileAttributes fileAttributes) {
		//获取最新文件资料，更新文件资料
		LabFileAttributes info  = fileAttrService.get(fileAttributes.getId());
		if(info.getFilestatus() == null || !info.getFilestatus().equals(Commons.FILE_STATUS_IDLE)){
			throw new ServiceException("只可预定空闲状态下的文件资料。");
		}
		info.setFilestatus(Commons.FILE_STATUS_BORR);//已借出
		fileAttrService.save(info);
		
		//获取预定申请单，更新预定单,预订单号，借用参数fileAttributes的t2属性，来自页面中的下拉框
		LabFileBorrow req = getReqNo(fileAttributes.getT2());
		req.setBorrowexecuter(fileAttributes.getT1());//预定经办人,页面中借用t1字段
		req.setBorrowrecheckdate(new Date());// 借阅执行日期
		req.setFileborrowstatus(Commons.FILE_STATUS_BORR);//已借出
		dao.update(req);
		
		//关联表
		LabFileBorrowRelationship lrs = new LabFileBorrowRelationship();
		lrs.setBorrowid(req.getId());
		lrs.setFileid(info.getFileid());
		relationshipService.save(lrs);
		//FIXME:新增履历
	}
	
	/**
	 * 借阅申请文件资料
	 * @param LabFileBorrow
	 */
	@Transactional(readOnly = false)
	public void lend(LabFileBorrow labFileBorrow) {
		//获取最新文件资料信息，更新文件资料状态
		LabFileBorrow info  = get(labFileBorrow.getId());
		if(info.getFileborrowstatus() == null || !info.getFileborrowstatus().equals(Commons.FILE_STATUS_APPR)){
			throw new ServiceException("只可借出已审批状态下的文件资料。");
		}
		info.setFileborrowstatus(Commons.FILE_STATUS_BORR);//已借出
		dao.update(info);
	
		//获取预定申请单，更新预定单
		LabFileBorrow req = getReqNo(labFileBorrow.getFileborrowid());
//		req.setReqstartdate(reqstartdate);   .setYdrq(new Date());//预定日期
		req.setReqname(labFileBorrow.getT1());//预定经办人,页面中借用t1字段
		req.setFileborrowstatus(Commons.FILE_STATUS_BORR);//已借出
		dao.update(req);
		
		//FIXME:新增履历
	}


	/**
	 * 归还文件资料
	 * @param labFileBorrow
	 */
	@Transactional(readOnly = false)
	public void giveBack(LabFileBorrow labFileBorrow) {
		
		try{
			//校验复核人、密码
			validPassword(labFileBorrow.getRevertrecheck(), labFileBorrow.getT1());
			//借用单状态为  已归还
			labFileBorrow.setFileborrowstatus(Commons.FILE_STATUS_RETU);
			labFileBorrow.setRevertrecheckdate(new Date());
			labFileBorrow.setT1(null);
			super.save(labFileBorrow);
			
			//文件资料状态
			//必须包含参数： borrowId 借用单号 ，dqzt 当前状态
			HashMap<String,String> hm = new HashMap<String, String>();
			hm.put("borrowId",labFileBorrow.getFileborrowid());
			hm.put("fileStatus", Commons.FILE_STATUS_IDLE+"");
			fileAttrService.updateDqztByBorrowId(hm);
		}catch(ServiceException e){
			logger.error(e.getMessage());
			throw e;
		}catch(Exception e){
			logger.error(e.getMessage());
			throw new ServiceException(Commons.CM_MSG_FAIL);
		}
	}
	
	/**
	 * 校验用户密码
	 * @param loginName
	 * @param password
	 * @return
	 */
	private void validPassword(String loginName, String password){
		User user = UserUtils.getByLoginName(loginName);
		if(user == null || user.getPassword()==null){
			throw new ServiceException("复核用户名不存在："+loginName);
		}
		
		if(!SystemService.validatePassword(password, user.getPassword())) {
			throw new ServiceException("复核密码错误："+loginName);
		}
	}

	/**
	 * 借用记录，根据文件id关联“关联表”查询借用记录
	 * @param fileid
	 * @return
	 */
	public List<LabFileBorrow> findByFileId(String fileid) {
		return dao.findByFileId(fileid);
	}
	
}