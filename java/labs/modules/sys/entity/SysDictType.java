/**
 * 
 */
package labs.modules.sys.entity;

import org.hibernate.validator.constraints.Length;
import java.math.BigDecimal;

import labs.common.persistence.DataEntity;

/**
 * 数据字典类型Entity
 * @author 数据字典类型
 * @version 2015-05-12
 */
public class SysDictType extends DataEntity<SysDictType> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 类型代码
	private String name;		// 类别名称
	private String t1;		// 备用1
	private String t2;		// 备用2
	private BigDecimal t3;		// 备用3
	
	public SysDictType() {
		super();
	}

	public SysDictType(String id){
		super(id);
	}

	@Length(min=1, max=30, message="类型代码长度必须介于 1 和 30 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=64, message="类别名称长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
}