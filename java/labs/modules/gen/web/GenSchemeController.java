/**
 * 
 */
package labs.modules.gen.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import labs.common.persistence.Page;
import labs.common.utils.StringUtils;
import labs.common.web.BaseController;
import labs.modules.gen.entity.GenScheme;
import labs.modules.gen.service.GenSchemeService;
import labs.modules.gen.service.GenTableService;
import labs.modules.gen.util.GenUtils;
import labs.modules.sys.entity.User;
import labs.modules.sys.utils.UserUtils;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 生成方案Controller
 * @author labs
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genScheme")
public class GenSchemeController extends BaseController {

	@Autowired
	private GenSchemeService genSchemeService;
	
	@Autowired
	private GenTableService genTableService;
	
	@ModelAttribute
	public GenScheme get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genSchemeService.get(id);
		}else{
			return new GenScheme();
		}
	}
	
	@RequiresPermissions("gen:genScheme:view")
	@RequestMapping(value = {"list", ""})
	public String list(GenScheme genScheme, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			genScheme.setCreateBy(user);
		}
        Page<GenScheme> page = genSchemeService.find(new Page<GenScheme>(request, response), genScheme); 
        model.addAttribute("page", page);
		
		return "modules/gen/genSchemeList";
	}

	@RequiresPermissions("gen:genScheme:view")
	@RequestMapping(value = "form")
	public String form(GenScheme genScheme, Model model) {
		if (StringUtils.isBlank(genScheme.getPackageName())){
			genScheme.setPackageName("labs.modules");
		}
//		if (StringUtils.isBlank(genScheme.getFunctionAuthor())){
//			genScheme.setFunctionAuthor(UserUtils.getUser().getName());
//		}
		model.addAttribute("genScheme", genScheme);
		model.addAttribute("config", GenUtils.getConfig());
		model.addAttribute("tableList", genTableService.findAll());
		return "modules/gen/genSchemeForm";
	}

	@RequiresPermissions("gen:genScheme:edit")
	@RequestMapping(value = "save")
	public String save(GenScheme genScheme, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, genScheme)){
			return form(genScheme, model);
		}
		
		String result = genSchemeService.save(genScheme);
		addMessage(redirectAttributes, "操作生成方案'" + genScheme.getName() + "'成功<br/>"+result);
		return "redirect:" + adminPath + "/gen/genScheme/?repage";
	}
	
	@RequiresPermissions("gen:genScheme:edit")
	@RequestMapping(value = "delete")
	public String delete(GenScheme genScheme, RedirectAttributes redirectAttributes) {
		genSchemeService.delete(genScheme);
		addMessage(redirectAttributes, "删除生成方案成功");
		return "redirect:" + adminPath + "/gen/genScheme/?repage";
	}
	
	@RequiresPermissions("gen:genScheme:edit")
	@RequestMapping(value = "code")
	public String code(@RequestParam String id, RedirectAttributes redirectAttributes,HttpServletRequest request,HttpServletResponse response) {
		if(StringUtils.isBlank(id)){
			addMessage(redirectAttributes, "没有传递参数:id");
			return "modules/gen/genSchemeList/?repage";
		}
		GenScheme genScheme = genSchemeService.get(id);
		if(null == genScheme){
			logger.error("方案不存在！id："+id);
			addMessage(redirectAttributes, "方案不存在！");
			return "modules/gen/genSchemeList/?repage";
		}
		response.reset();
        response.setContentType("application/octet-stream; charset=utf-8");
		try {
			String fileName = encodeAttachmentFilename(genScheme.getName()+".zip",request.getHeader("user-agent"));
			response.setHeader("Content-Disposition", "attachment;"+fileName);
			genSchemeService.generateCode(genScheme,response.getOutputStream());
			addMessage(redirectAttributes, "生成方案'" + genScheme.getName() + "'成功<br/>");
			return null;
		} catch (IOException e) {
			addMessage(redirectAttributes, "生成方案'" + genScheme.getName() + "'失败<br/>");
		}
		return "modules/gen/genSchemeList/?repage";
	}
}
