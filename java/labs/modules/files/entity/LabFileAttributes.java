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
 * 文件资料管理Entity
 * @author YL
 * @version 2015-05-30
 */
public class LabFileAttributes extends DataEntity<LabFileAttributes> {
	
	private static final long serialVersionUID = 1L;
	private String t1;		// 备用1
	private String t2;		// 备用2
	private BigDecimal t3;		// 备用3
	private String t4;		// 备用4
	private String fileid;		// 文件资料ID
	private String filename;		// 文件资料名称
	private String filecontrolid;		// 文件资料控制编号
	private String filestandard;		// 图书标准名称
	private Integer filetype;		// 文件资料类型
	private Date filearchivedate;		// 文件资料归档日期
	private Date usedate;		// 投入使用日期
	private String placeaddress;		// 目前存在地点
	private Integer filestatus;		// 当前状态
	
	public LabFileAttributes() {
		super();
	}

	public LabFileAttributes(String id){
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
	
	@Length(min=0, max=40, message="备用2长度必须介于 0 和 40 之间")
	public String getT4() {
		return t4;
	}

	public void setT4(String t4) {
		this.t4 = t4;
	}
	
	@Length(min=0, max=64, message="文件资料ID长度必须介于 0 和 64 之间")
	public String getFileid() {
		return fileid;
	}

	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	
	@Length(min=0, max=256, message="文件资料名称长度必须介于 0 和 256 之间")
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Length(min=0, max=64, message="文件资料控制编号长度必须介于 0 和 64 之间")
	public String getFilecontrolid() {
		return filecontrolid;
	}

	public void setFilecontrolid(String filecontrolid) {
		this.filecontrolid = filecontrolid;
	}
	
	@Length(min=0, max=128, message="图书标准名称长度必须介于 0 和 128 之间")
	public String getFilestandard() {
		return filestandard;
	}

	public void setFilestandard(String filestandard) {
		this.filestandard = filestandard;
	}
	
	public Integer getFiletype() {
		return filetype;
	}

	public void setFiletype(Integer filetype) {
		this.filetype = filetype;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getFilearchivedate() {
		return filearchivedate;
	}

	public void setFilearchivedate(Date filearchivedate) {
		this.filearchivedate = filearchivedate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUsedate() {
		return usedate;
	}

	public void setUsedate(Date usedate) {
		this.usedate = usedate;
	}
	
	@Length(min=0, max=256, message="目前存在地点长度必须介于 0 和 256 之间")
	public String getPlaceaddress() {
		return placeaddress;
	}

	public void setPlaceaddress(String placeaddress) {
		this.placeaddress = placeaddress;
	}
	
	public Integer getFilestatus() {
		return filestatus;
	}

	public void setFilestatus(Integer filestatus) {
		this.filestatus = filestatus;
	}
	
}