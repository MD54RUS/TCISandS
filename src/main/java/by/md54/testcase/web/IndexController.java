package by.md54.testcase.web;

import by.md54.testcase.entity.Area;
import by.md54.testcase.entity.Specialisation;
import by.md54.testcase.service.AreaService;
import by.md54.testcase.service.SpecialisationService;
import by.md54.testcase.service.VacancyService;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.ReleaseInfo;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import javax.portlet.RenderRequest;

/**
 * ViewRecordController renders the portlet; shows the records from the database in html table.
 *
 * @author phomal
 */


@Controller
@RequestMapping("VIEW")
@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
public class IndexController {

    private final VacancyService vacancyService;
    private final AreaService areaService;
    private final SpecialisationService specialisationService;
    private static final String DEFAULT_AREA_NAME = "Новосибирск";
    private static final long DEFAULT_AREA_ID = 4L;
    private static final long DEFAULT_AREA_PARENT_ID = 1202L;
    private static final long DEFAULT_SPECIALISATION_ID = 1L;
    private static final String DEFAULT_SPECIALISATION_NAME = "Информационные технологии, интернет, телеком";
    private static final int DEFAULT_PER_PAGE_VALUE = 20;
    private static final int DEFAULT_PAGE_NUMBER = 0;


    @RenderMapping
    public String showContainer(RenderRequest request, Model model) {

        areaService.loadAreas();
        specialisationService.loadSpec();
        model.addAttribute("releaseInfo", ReleaseInfo.getReleaseInfo());
        ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
        User loggedUser = themeDisplay.getUser();
        try {
            loggedUser.getGroup();
        } catch (PortalException | SystemException e) {
            e.printStackTrace();
        }
        model.addAttribute("userName", loggedUser.getFullName());

        int perPage = ParamUtil.getInteger(request, "perPage", DEFAULT_PER_PAGE_VALUE);
        int pageCount = ParamUtil.getInteger(request, "page", DEFAULT_PAGE_NUMBER);
        Pageable page = new PageRequest(pageCount, perPage);

        long areaId = ParamUtil.getLong(request, "areaId", DEFAULT_AREA_ID);
        Area area = areaService.getArea(areaId);

        long specId = ParamUtil.getLong(request, "specId", DEFAULT_SPECIALISATION_ID);
        Specialisation spec = specialisationService.getSpecById(specId);

        vacancyService.loadVacancy(specId, areaId);

        model.addAttribute("vacancies", vacancyService.getVacancyPerPage(specId, areaId, page));
        model.addAttribute("area", area);
        model.addAttribute("specialisation", spec);

//        model.addAttribute("areas", areaService.getAreas());
//        model.addAttribute("specialisations", specialisationService.getSpec());
        return "portlet-test-case/view";
    }

//
//    @ActionMapping(params = "act=addRecord")
//    public void loadVacancy() {
//        vacancyService.loadVacancy();
//        areaService.loadAreas();
//    }


//    @RequestMapping(value = "?page={page},perPage={perPage}", method = RequestMethod.GET)
//    @ResponseBody
//    public String printHello(@PathVariable("page") int page, @PathVariable("perPage") int perPage, ModelMap model) {
//
//        Pageable pageReq = new PageRequest(page, perPage);
//
//        model.addAttribute("vacancies", vacancyService.getVacancyPerPage(pageReq));
//
//        return "portlet-test-case/view";
//        }


//    @RequestMapping("VIEW")
//    @RenderMapping(params = {"action=getVacancy"})
//    public String reload(RenderRequest request, Model model) {
//
//        int pageCount, perPage;
//        perPage = ParamUtil.getInteger(request, "perPage", 20);
//        pageCount = ParamUtil.getInteger(request, "page", 0);
//
//        Pageable page = new PageRequest(pageCount, perPage);
//
//        model.addAttribute("vacancies", vacancyService.getVacancyPerPage(page));
//
////        model.addAttribute("userName", loggedUser.getFullName());
//
//        return "portlet-test-case/view";
//
//
//    }


//    @RenderMapping(params = "act=editRecordForm")
//    public String showEditRecordForm() {
//        return "portlet-test-case/editForm";
//    }
//


    @RenderMapping(params = "action=loadFilter")
    public String filteringQuery(RenderRequest request, Model model) {
        long area = ParamUtil.getLong(request, "area", 4L);
        long specId = ParamUtil.getLong(request, "specId", 1L);
        model.addAttribute("areaId", area);
        model.addAttribute("areas", areaService.getAreas());
        model.addAttribute("specialisations", specialisationService.getAll());
        model.addAttribute("specId", specId);
        return "portlet-test-case/addForm";
    }


}
