/**
 * 
 */
package labs.modules.files.entity;

import org.hibernate.validator.constraints.Length;
import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import labs.common.persistence.DataEntity;

/**
 * 文件资料借阅记录Entity
 * @author YL
 * @version 2015-05-30
 */
public class LabFileBorrow extends DataEntity<LabFileBorrow> {
	
	private static final long serialVersionUID = 1L;
	private String t1;		// 备用1
	private String t2;		// 备用2
	private BigDecimal t3;		// 备用3
	private String fileborrowid;		// 文件资料借阅单号
	private Integer fileborrowstatus;		// 文件资料借阅状态
	private String reqdepartment;		// 申请借阅部门
	private Date reqstartdate;		// 预计申请开始日期
	private Date reqenddate;		// 预计申请截止日期
	private String approvename;		// 审批人姓名
	private String approveopinion;		// 审批人意见
	private String reqname;		// 申请人姓名
	private String reqreason;		// 申请借阅原因
	private Date approvedate;		// 审批的日期
	private String borrowexecuter;		// 借阅经办人
	private String borrowrecheck;		// 借阅复核人
	private Date borrowrecheckdate;		// 借阅执行日期
	private String revertexecuter;		// 归还经办人
	private String revertrecheck;		// 归还复核人
	private Date revertrecheckdate;		// 归还执行日期
	private String reqcontentcount;		// 申请文件资料名称及数量
	
	public LabFileBorrow() {
		super();
	}

	public LabFileBorrow(String id){
		super(id);
	}

	@Length(min=0, max=20, message="备用1长度必须介于 0 和 20 之间")
	public String getT1() {
		return t1;
	}

	public void setT1(String t1) {
		this.t1 = t1;
	}
	
	@Length(min=0, max=40, message="备用2长度必须介于 0 和 40 之间")
	public String getT2() {
		return t2;
	}

	public void setT2(String t2) {
		this.t2 = t2;
	}
	
	public BigDecimal getT3() {
		return t3;
	}

	public void setT3(BigDecimal t3) {
		this.t3 = t3;
	}
	
	@Length(min=0, max=64, message="文件资料借阅单号长度必须介于 0 和 64 之间")
	public String getFileborrowid() {
		return fileborrowid;
	}

	public void setFileborrowid(String fileborrowid) {
		this.fileborrowid = fileborrowid;
	}
	
	public Integer getFileborrowstatus() {
		return fileborrowstatus;
	}

	public void setFileborrowstatus(Integer fileborrowstatus) {
		this.fileborrowstatus = fileborrowstatus;
	}
	
	@Length(min=0, max=128, message="申请借阅部门长度必须介于 0 和 128 之间")
	public String getReqdepartment() {
		return reqdepartment;
	}

	public void setReqdepartment(String reqdepartment) {
		this.reqdepartment = reqdepartment;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getReqstartdate() {
		return reqstartdate;
	}

	public void setReqstartdate(Date reqstartdate) {
		this.reqstartdate = reqstartdate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getReqenddate() {
		return reqenddate;
	}

	public void setReqenddate(Date reqenddate) {
		this.reqenddate = reqenddate;
	}
	
	@Length(min=0, max=64, message="审批人姓名长度必须介于 0 和 64 之间")
	public String getApprovename() {
		return approvename;
	}

	public void setApprovename(String approvename) {
		this.approvename = approvename;
	}
	
	@Length(min=0, max=256, message="审批人意见长度必须介于 0 和 256 之间")
	public String getApproveopinion() {
		return approveopinion;
	}

	public void setApproveopinion(String approveopinion) {
		this.approveopinion = approveopinion;
	}
	
	@Length(min=0, max=64, message="申请人姓名长度必须介于 0 和 64 之间")
	public String getReqname() {
		return reqname;
	}

	public void setReqname(String reqname) {
		this.reqname = reqname;
	}
	
	@Length(min=0, max=256, message="申请借阅原因长度必须介于 0 和 256 之间")
	public String getReqreason() {
		return reqreason;
	}

	public void setReqreason(String reqreason) {
		this.reqreason = reqreason;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApprovedate() {
		return approvedate;
	}

	public void setApprovedate(Date approvedate) {
		this.approvedate = approvedate;
	}
	
	@Length(min=0, max=64, message="借阅经办人长度必须介于 0 和 64 之间")
	public String getBorrowexecuter() {
		return borrowexecuter;
	}

	public void setBorrowexecuter(String borrowexecuter) {
		this.borrowexecuter = borrowexecuter;
	}
	
	@Length(min=0, max=64, message="借阅复核人长度必须介于 0 和 64 之间")
	public String getBorrowrecheck() {
		return borrowrecheck;
	}

	public void setBorrowrecheck(String borrowrecheck) {
		this.borrowrecheck = borrowrecheck;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBorrowrecheckdate() {
		return borrowrecheckdate;
	}

	public void setBorrowrecheckdate(Date borrowrecheckdate) {
		this.borrowrecheckdate = borrowrecheckdate;
	}
	
	@Length(min=0, max=64, message="归还经办人长度必须介于 0 和 64 之间")
	public String getRevertexecuter() {
		return revertexecuter;
	}

	public void setRevertexecuter(String revertexecuter) {
		this.revertexecuter = revertexecuter;
	}
	
	@Length(min=0, max=64, message="归还复核人长度必须介于 0 和 64 之间")
	public String getRevertrecheck() {
		return revertrecheck;
	}

	public void setRevertrecheck(String revertrecheck) {
		this.revertrecheck = revertrecheck;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRevertrecheckdate() {
		return revertrecheckdate;
	}

	public void setRevertrecheckdate(Date revertrecheckdate) {
		this.revertrecheckdate = revertrecheckdate;
	}
	
	@Length(min=0, max=1024, message="申请文件资料名称及数量长度必须介于 0 和 1024 之间")
	public String getReqcontentcount() {
		return reqcontentcount;
	}

	public void setReqcontentcount(String reqcontentcount) {
		this.reqcontentcount = reqcontentcount;
	}
	
}