/**
 * 
 */
package labs.modules.files.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import labs.common.config.Global;
import labs.common.persistence.Page;
import labs.common.web.BaseController;
import labs.common.utils.StringUtils;
import labs.modules.files.entity.LabFileBorrowRelationship;
import labs.modules.files.service.LabFileBorrowRelationshipService;

/**
 * 文件资料与借阅单号关联Controller
 * @author YL
 * @version 2015-05-30
 */
@Controller
@RequestMapping(value = "${adminPath}/files/labFileBorrowRelationship")
public class LabFileBorrowRelationshipController extends BaseController {

	@Autowired
	private LabFileBorrowRelationshipService labFileBorrowRelationshipService;
	
	@ModelAttribute
	public LabFileBorrowRelationship get(@RequestParam(required=false) String id) {
		LabFileBorrowRelationship entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = labFileBorrowRelationshipService.get(id);
		}
		if (entity == null){
			entity = new LabFileBorrowRelationship();
		}
		return entity;
	}
	
	@RequiresPermissions("files:labFileBorrowRelationship:view")
	@RequestMapping(value = {"list", ""})
	public String list(LabFileBorrowRelationship labFileBorrowRelationship, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LabFileBorrowRelationship> page = labFileBorrowRelationshipService.findPage(new Page<LabFileBorrowRelationship>(request, response), labFileBorrowRelationship); 
		model.addAttribute("page", page);
		return "modules/files/labFileBorrowRelationshipList";
	}

	@RequiresPermissions("files:labFileBorrowRelationship:view")
	@RequestMapping(value = "form")
	public String form(LabFileBorrowRelationship labFileBorrowRelationship, Model model) {
		model.addAttribute("labFileBorrowRelationship", labFileBorrowRelationship);
		return "modules/files/labFileBorrowRelationshipForm";
	}

	@RequiresPermissions("files:labFileBorrowRelationship:edit")
	@RequestMapping(value = "save")
	public String save(LabFileBorrowRelationship labFileBorrowRelationship, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, labFileBorrowRelationship)){
			return form(labFileBorrowRelationship, model);
		}
		labFileBorrowRelationshipService.save(labFileBorrowRelationship);
		addMessage(redirectAttributes, "保存文件资料与借阅单号关联成功");
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrowRelationship/?repage";
	}
	
	@RequiresPermissions("files:labFileBorrowRelationship:edit")
	@RequestMapping(value = "delete")
	public String delete(LabFileBorrowRelationship labFileBorrowRelationship, RedirectAttributes redirectAttributes) {
		labFileBorrowRelationshipService.delete(labFileBorrowRelationship);
		addMessage(redirectAttributes, "删除文件资料与借阅单号关联成功");
		return "redirect:"+Global.getAdminPath()+"/files/labFileBorrowRelationship/?repage";
	}

}