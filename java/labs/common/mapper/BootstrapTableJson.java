/**
 * 
 */
package labs.common.mapper;

import java.io.Serializable;
import java.util.List;

import labs.common.persistence.Page;

/**
 * bootstrap table json 格式
 * 
 * @author labs
 * @version 2014-05-16
 */
public class BootstrapTableJson<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	public BootstrapTableJson(Page<T> page){
		setTotal(page.getCount());
		setRows(page.getList());
	}
	long total;
	List<T> rows;
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
}
