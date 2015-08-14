/**
 * 
 */
package labs.modules.files.entity;

import org.hibernate.validator.constraints.Length;
import java.math.BigDecimal;

import labs.common.persistence.DataEntity;

/**
 * 文件资料与借阅单号关联Entity
 * @author YL
 * @version 2015-05-30
 */
public class LabFileBorrowRelationship extends DataEntity<LabFileBorrowRelationship> {
	
	private static final long serialVersionUID = 1L;
	private String t1;		// 备用1
	private String t2;		// 备用2
	private BigDecimal t3;		// 备用3
	private String fileid;		// 文件资料编号
	private String borrowid;		// 文件资料借阅编号
	
	public LabFileBorrowRelationship() {
		super();
	}

	public LabFileBorrowRelationship(String id){
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
	
	@Length(min=0, max=64, message="文件资料编号长度必须介于 0 和 64 之间")
	public String getFileid() {
		return fileid;
	}

	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	
	@Length(min=0, max=64, message="文件资料借阅编号长度必须介于 0 和 64 之间")
	public String getBorrowid() {
		return borrowid;
	}

	public void setBorrowid(String borrowid) {
		this.borrowid = borrowid;
	}
	
}