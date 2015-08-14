package labs.modules.sys.entity;

import labs.common.persistence.DataEntity;

public class Sequence extends DataEntity<Sequence>{
	private static final long serialVersionUID = 2810806650749658870L;
	private String name;
	private long value;
	private long init;
	private long step;
	private long max;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getValue() {
		return value;
	}

	public void setValue(long value) {
		this.value = value;
	}

	public long getInit() {
		return init;
	}

	public void setInit(long init) {
		this.init = init;
	}

	public long getStep() {
		return step;
	}

	public void setStep(long step) {
		this.step = step;
	}

	public long getMax() {
		return max;
	}

	public void setMax(long max) {
		this.max = max;
	}

	@Override
	public void preInsert() {
		
	}

	@Override
	public void preUpdate() {
		
	}

}
