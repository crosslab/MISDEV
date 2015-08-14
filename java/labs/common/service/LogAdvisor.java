package labs.common.service;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import labs.common.persistence.Page;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class LogAdvisor {
	static ExecutorService threads;
	static {
		threads = Executors.newCachedThreadPool();
	}
	@Pointcut("execution(* labs.modules.**.service.*.*(..))")
	public void pointCut(){}
	
	@Before(value = "pointCut()")
	public void before(JoinPoint jp) {
		BeforeRunner br = new BeforeRunner(jp);
		threads.submit(br);
	}

	//@After(value = "pointCut()")
	public void after(JoinPoint jp) {
		System.out.println("调用之后");
	}
	
	@AfterReturning(pointcut="pointCut()",returning="rtn")
	public void afterReturn(JoinPoint jp,Object rtn){
		AfterRunner ar = new AfterRunner(jp, rtn);
		threads.submit(ar);
	}
	
	//@Around(value = "pointCut()")
	public Object arround(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("调用时。。。。。。");
		return pjp.proceed();
	}

	@AfterThrowing(pointcut="pointCut()",throwing="ex")
	public void throwing(JoinPoint jp, Throwable ex) {
		ThrowingRunner tr = new ThrowingRunner(jp, ex);
		threads.submit(tr);
	}
}

class BeforeRunner implements Runnable{
	private JoinPoint jp;
	public BeforeRunner(JoinPoint p) {
		this.jp = p;
	}
	public void run() {
		Logger logger = LoggerFactory.getLogger(jp.getTarget().getClass());
		if (Loggable.class.isAssignableFrom(jp.getTarget().getClass()))
			logger.info("----------服务名："+((Loggable) jp.getTarget()).getServiceName());
		
		logger.info("----------方法签名:" + jp.getSignature().toShortString());
		logger.info("----------方法参数:" );
		Object[] objs = jp.getArgs();
		for (int i = 0; i < objs.length; i++) {
			if(objs[i]==null)continue;
			if(objs[i].getClass().isAssignableFrom(Page.class))continue;
			logger.info("----------参数："+i+objs[i].getClass().getName());
			logger.info("----------"+ReflectionToStringBuilder.toString(objs[i]));
		}
	}
	
}

class ProceedRunner implements Runnable{

	private ProceedingJoinPoint jp;
	public ProceedRunner(ProceedingJoinPoint p) {
		jp=p;
	}
	public void run() {
		jp.getArgs();
	}
	
}

class AfterRunner  implements Runnable{

	private JoinPoint jp;
	private Object rtn;
	public AfterRunner(JoinPoint p,Object rtn) {
		jp=p;
		this.rtn = rtn;
	}
	public void run() {
		Logger logger = LoggerFactory.getLogger(jp.getTarget().getClass());
		logger.info("----------完成方法签名:" + jp.getSignature().toShortString());
		if(rtn == null) return;
		logger.info("----------返回值:");
		logger.info("----------"+ReflectionToStringBuilder.toString(rtn));
	}
	
}

class ThrowingRunner implements Runnable{

	private JoinPoint jp;
	private Throwable e;
	public ThrowingRunner(JoinPoint p,Throwable ex) {
		jp=p;
		this.e = ex;
	}
	public void run() {
		Logger logger = LoggerFactory.getLogger(jp.getTarget().getClass());
		logger.error("----------出现异常情况：");
		logger.error("----------"+e.getMessage());
		if (Loggable.class.isAssignableFrom(jp.getTarget().getClass()))
			logger.error("----------服务名："+((Loggable) jp.getTarget()).getServiceName());
		logger.error("----------方法签名:" + jp.getSignature().toShortString());
		logger.error("----------方法参数:" );
		Object[] objs = jp.getArgs();
		for (int i = 0; i < objs.length; i++) {
			if(objs[i]==null)continue;
			if(objs[i].getClass().isAssignableFrom(Page.class))continue;
			logger.info("----------参数："+i+objs[i].getClass().getName());
			logger.info("----------"+ReflectionToStringBuilder.toString(objs[i]));
		}
	}
	
}