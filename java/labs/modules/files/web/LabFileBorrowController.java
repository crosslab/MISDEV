/**
 * 
 */
package labs.modules.files.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import labs.common.config.Global;
import labs.common.persistence.Page;
import labs.common.web.BaseController;
import labs.common.service.ServiceException;
import labs.common.utils.StringUtils;
import labs.modules.files.entity.LabFileAttributes;
import labs.modules.files.entity.LabFileBorrow;
import labs.modules.files.service.LabFileBorrowService;
import labs.modules.yq.commons.Commons;

/**
 * 文件资料借阅记录Controller
 * @author YL
 * @version 2015-05-30
 */
@Controller
@RequestMapping(value = "${adminPath}/files/labFileBorrow")
public class LabFileBorrowController extends BaseController {

	@Autowired
	private LabFileBorrowService labFileBorrowService;
	
	@ModelAttribute
	public LabFileBorrow get(@RequestParam(required=false) String id) {
		LabFileBorrow entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = labFileBorrowService.get(id);
		}
		if (entity == null){
			entity = new LabFileBorrow();
		}
		return entity;
	}
	
	@RequiresPermissions("files:labFileBorrow:view")
	@RequestMapping(value = {"list", ""})
	public String list(LabFileBorrow labFileBorrow, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LabFileBorrow> page = labFileBorrowService.findPage(new Page<LabFileBorrow>(request, response), labFileBorrow); 
		model.addAttribute("page", page);
		return "modules/files/labFileBorrowList";
	}

	@RequiresPermissions("files:labFileBorrow:view")
	@RequestMapping(value = "form")
	public String form(LabFileBorrow labFileBorrow, Model model) {
		model.addAttribute("labFileBorrow", labFileBorrow);
		return "modules/files/labFileBorrowForm";
	}


	@RequiresPermissions("files:labFileBorrow:view")
	@RequestMapping(value = "view")
	public String view(LabFileBorrow labFileBorrow, Model model) {
		model.addAttribute("labFileBorrow", labFileBorrow);
		return "modules/files/labFileBorrowView";
	}
	
	@RequiresPermissions("files:labFileBorrow:edit")
	@RequestMapping(value = "save")
	public String save(LabFileBorrow labFileBorrow, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, labFileBorrow)){
			return form(labFileBorrow, model);
		}
		labFileBorrowService.save(labFileBorrow);
		addMessage(redirectAttributes, "保存文件资料借阅记录成功");
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrow/?repage";
	}
	
	@RequiresPermissions("files:labFileBorrow:edit")
	@RequestMapping(value = "delete")
	public String delete(LabFileBorrow labFileBorrow, RedirectAttributes redirectAttributes) {
		labFileBorrowService.delete(labFileBorrow);
		addMessage(redirectAttributes, "删除文件资料借阅记录成功");
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrow/?repage";
	}

	
	@RequiresPermissions("files:labFileBorrow:approve")
	@RequestMapping(value = "approve")
	public String approve(LabFileBorrow labFileBorrow, RedirectAttributes redirectAttributes) {
		
		try{
			labFileBorrowService.approve(labFileBorrow);
			addMessage(redirectAttributes, "审批通过成功");
		}catch(Exception e){
			addMessage(redirectAttributes, "审批失败。");
		}
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrow/?repage";
	}


	@RequiresPermissions("files:labFileBorrow:approve")
	@RequestMapping(value = "deny")
	public String deny(LabFileBorrow labFileBorrow, RedirectAttributes redirectAttributes) {
		
		try{
			labFileBorrowService.deny(labFileBorrow);
			addMessage(redirectAttributes, "审批拒绝成功");
		}catch(Exception e){
			addMessage(redirectAttributes, "审批失败。");
		}
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrow/?repage";
	}

	
	/**
	 * 获取申请借阅文件资料
	 * @param labFileBorrow
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("files:labFileAttributes:lend")
	@RequestMapping(value = "request")
	@ResponseBody
	public List<LabFileBorrow> request(@RequestBody LabFileAttributes labFileAttr,HttpServletRequest request, HttpServletResponse response, Model model) {
		response.setContentType("application/json;charset=utf-8"); 
		
		List<LabFileBorrow> list = labFileBorrowService.getRequestNo();
		model.addAttribute("applyNoList",list);
		return list;
	}
	

	/**
	 * 申请预订借阅文件资料
	 * @param labFileBorrow
	 * @param redirectAttributes
	 * @return
	 * @throws Exception 
	 */
	@RequiresPermissions("files:labFileAttributes:view")
	@RequestMapping(value = "revserveOK")
	public String revserveOK(LabFileBorrow labFileBorrow,LabFileAttributes labFileAttributes, RedirectAttributes redirectAttributes) throws Exception {
		
		try {
			labFileBorrowService.reserve(labFileAttributes);
		} catch(ServiceException se) {
			addMessage(redirectAttributes, "预定<b>"+labFileAttributes.getFilename() + "</b>失败。"+se.getMessage());
			return "redirect:"+Global.getAdminPath()+"/files/labFileAttributes/?repage";
		} catch(Exception e) {
			logger.error(e.getMessage());
			throw e;
		}
		addMessage(redirectAttributes, "预定<b>" + labFileAttributes.getFilename() + "</b>成功,预定单号：" + labFileAttributes.getT2());
		return "redirect:"+Global.getAdminPath()+"/files/labFileAttributes/?repage";
	}

	/**
	 * 借出借阅文件资料
	 * @param labFileBorrow
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("files:labFileAttributes:lend")
	@RequestMapping(value = "lend")
	public String lend(LabFileBorrow labFileBorrow, RedirectAttributes redirectAttributes) {
		
		try{
			labFileBorrowService.lend(labFileBorrow);
			addMessage(redirectAttributes, "借出成功");
		}catch(ServiceException se){
			addMessage(redirectAttributes, "借出失败："+se.getMessage());
		}catch(Exception e){
			addMessage(redirectAttributes, Commons.CM_MSG_FAIL);
		}
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrow/?repage";
	}
	
	/**
	 * 借阅文件资料-归还操作
	 * @param labFileBorrow
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("files:labFileAttributes:lend")
	@RequestMapping(value = "giveBack")
	public String giveBack(LabFileBorrow labFileBorrow, RedirectAttributes redirectAttributes) {
		try{
			labFileBorrowService.giveBack(labFileBorrow);
			addMessage(redirectAttributes, "归还成功");
		}catch(ServiceException se){
			addMessage(redirectAttributes, "归还失败：" + se.getMessage());
		}catch(Exception e){
			addMessage(redirectAttributes, Commons.CM_MSG_FAIL);
		}
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrow/?repage";
	}	
}