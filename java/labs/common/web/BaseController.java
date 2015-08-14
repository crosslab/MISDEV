/**
 * 
 */
package labs.common.web;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.validation.Validator;

import labs.common.beanvalidator.BeanValidators;
import labs.common.mapper.JsonMapper;
import labs.common.persistence.Page;
import labs.common.utils.DateUtils;
import labs.common.utils.StringUtils;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 控制器支持类
 * @author labs
 * @version 2013-3-23
 */
public abstract class BaseController {

	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 管理基础路径
	 */
	@Value("${adminPath}")
	protected String adminPath;
	
	/**
	 * 前端基础路径
	 */
	@Value("${frontPath}")
	protected String frontPath;
	
	/**
	 * 前端URL后缀
	 */
	@Value("${urlSuffix}")
	protected String urlSuffix;
	
	/**
	 * 验证Bean实例对象
	 */
	@Autowired
	protected Validator validator;

	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组
	 * @return 验证成功：返回true；严重失败：将错误信息添加到 message 中
	 */
	protected boolean beanValidator(Model model, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "数据验证失败：");
			addMessage(model, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组
	 * @return 验证成功：返回true；严重失败：将错误信息添加到 flash message 中
	 */
	protected boolean beanValidator(RedirectAttributes redirectAttributes, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "数据验证失败：");
			addMessage(redirectAttributes, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组，不传入此参数时，同@Valid注解验证
	 * @return 验证成功：继续执行；验证失败：抛出异常跳转400页面。
	 */
	protected void beanValidator(Object object, Class<?>... groups) {
		BeanValidators.validateWithException(validator, object, groups);
	}
	
	/**
	 * 添加Model消息
	 * @param message
	 */
	protected void addMessage(Model model, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		model.addAttribute("message", sb.toString());
	}
	
	/**
	 * 添加Flash消息
	 * @param message
	 */
	protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		redirectAttributes.addFlashAttribute("message", sb.toString());
	}
	
	/**
	 * 客户端返回JSON字符串
	 * @param response
	 * @param object
	 * @return
	 */
	protected String renderString(HttpServletResponse response, Object object) {
		return renderString(response, JsonMapper.toJsonString(object), "application/json");
	}
	
	/**
	 * 客户端返回字符串
	 * @param response
	 * @param string
	 * @return
	 */
	protected String renderString(HttpServletResponse response, String string, String type) {
		try {
			response.reset();
	        response.setContentType(type);
	        response.setCharacterEncoding("utf-8");
			response.getWriter().print(string);
			return null;
		} catch (IOException e) {
			return null;
		}
	}

	/**
	 * 参数绑定异常
	 */
	@ExceptionHandler({BindException.class, ConstraintViolationException.class, ValidationException.class})
    public String bindException() {  
        return "error/400";
    }
	
	/**
	 * 授权登录异常
	 */
	@ExceptionHandler({AuthenticationException.class})
    public String authenticationException() {  
        return "error/403";
    }

	/**
	 * 初始化数据绑定
	 * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
	 * 2. 将字段中Date类型转换为String类型
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
//			@Override
//			public String getAsText() {
//				Object value = getValue();
//				return value != null ? DateUtils.formatDateTime((Date)value) : "";
//			}
		});
	}
	
	/**
	 * 各浏览器支持的附件文件名编码格式：<br/>
	 * IE URLEncoder编码;<br/>
	 * Opera 采用filename*方式；<br/>
	 * Safari 采用ISO编码的中文；<br/>
	 * Chrome 采用Base64编码或者采用ISO编码的中文；<br/>
	 * FireFox Base64或者filename*或者采用ISO编码的中文<br/>
	 * <br/>
	 * response.reset();<br/>
       response.setContentType("application/octet-stream; charset=utf-8");<br/>
	   String fileName = encodeAttachmentFilename(genScheme.getName()+".zip",request.getHeader("user-agent"));<br/>
	   response.setHeader("Content-Disposition", "attachment;"+fileName);<br/>
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	protected String encodeAttachmentFilename(String fileName,String ua) throws UnsupportedEncodingException{
		String enc = System.getProperty("file.encoding");
		//默认的编码方式URLEncoder
		String newFilename = URLEncoder.encode(fileName, enc);
		if(null!=ua){
			ua = ua.toLowerCase();
			if(ua.indexOf("msie")>-1){
				newFilename="filename=\""+newFilename+"\"";
				return newFilename;
			}
			if(ua.indexOf("opera")>-1){
				newFilename="filename=*"+enc+"\""+newFilename+"\"";
				return newFilename;
			}
			if(ua.indexOf("safari")>-1){
				newFilename="filename=\""+new String(fileName.getBytes(enc),"ISO-8859-1")+"\"";
				return newFilename;
			}
			//chrome
			if(ua.indexOf("applewebkit")>-1){
				newFilename=MimeUtility.encodeText(newFilename, enc, "B");
				newFilename="filename=\""+newFilename+"\"";
				return newFilename;
			}
			//firefox
			if(ua.indexOf("mozilla")>-1){
				newFilename="filename=\""+new String(fileName.getBytes(enc),"ISO-8859-1")+"\"";
				return newFilename;
			}
		}
		return newFilename;
	}
	
	/**
	 * 根据Bootstrap table page参数，生成框架Page对象
	 * @param request
	 * @return
	 */
	public <T> Page<T> getBootstrapTablePage(HttpServletRequest request) {
		String  sLimit = request.getParameter("limit");//每页大小 比如 10
		String sOffset = request.getParameter("offset");//当前页数据序号偏移，比如第1页10,2页20，，，
		String sOrder = request.getParameter("order");
		String sSort = request.getParameter("sort");
		int iLimit = 0,iOffset=0;
		try{
			iLimit = sLimit==null?10:Integer.parseInt(sLimit);
			iOffset = sLimit==null?10:Integer.parseInt(sOffset);
			sOrder=sOrder==null?"":sOrder;
			sSort=sSort==null?"":sSort;
			
			Page<T> page = new Page<T>();
			page.setPageSize(iLimit);
			page.setPageNo(iOffset/iLimit + 1);
			if(!StringUtils.isEmpty(sSort)){
				page.setOrderBy(" convert(`"+sSort+"` using gbk ) "+sOrder);
			}
			return page;
		}catch(Exception e){
			iLimit=10;
			iOffset=0;
		}
		return null;
	}
}
	
