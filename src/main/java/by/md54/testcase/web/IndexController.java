package by.md54.testcase.web;

import by.md54.testcase.entity.Area;
import by.md54.testcase.entity.Specialisation;
import by.md54.testcase.service.AreaService;
import by.md54.testcase.service.SpecialisationService;
import by.md54.testcase.service.VacancyService;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

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
    private static final long DEFAULT_AREA_ID = 4L;
    private static final long DEFAULT_SPECIALISATION_ID = 1L;
    private static final int DEFAULT_PER_PAGE_VALUE = 5;
    private static final int DEFAULT_PAGE_NUMBER = 1;

    private static final Log logger = LogFactoryUtil.getLog("portlet=test-cate");

    @RenderMapping
    public String showContainer(RenderRequest request, Model model) {

        areaService.loadAreas();
        specialisationService.loadSpec();
        vacancyService.loadVacancy(DEFAULT_SPECIALISATION_ID, DEFAULT_AREA_ID);
//        model.addAttribute("releaseInfo", ReleaseInfo.getReleaseInfo());
//        ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
//        User loggedUser = themeDisplay.getUser();
//        try {
//            loggedUser.getGroup();
//        } catch (PortalException | SystemException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("userName", loggedUser.getFullName());

        changeModel(request, model);
//        model.addAttribute("areas", areaService.getAreas());
//        model.addAttribute("specialisations", specialisationService.getSpec());
        return "portlet-test-case/view";
    }


    @RenderMapping(params = "act=changePagination")
    public String changePagination(RenderRequest request, RenderResponse response, Model model) {
        changeModel(request, model);
//        model.addAttribute("areas", areaService.getAreas());
//        model.addAttribute("specialisations", specialisationService.getSpec());
        return "portlet-test-case/view";
    }

    @RenderMapping(params = "act=configRequest")
    public String changeFilter(RenderRequest request, RenderResponse response, Model model) {
        long areaId = ParamUtil.getLong(request, "areaId", DEFAULT_AREA_ID);
        long specId = ParamUtil.getLong(request, "specId", DEFAULT_SPECIALISATION_ID);
        int found = vacancyService.loadVacancy(specId, areaId);
        logger.info("Change filter, areaId = " + areaId + " specId = " + specId + " found = " + found);
        changeModel(request, model);
//        model.addAttribute("areas", areaService.getAreas());
//        model.addAttribute("specialisations", specialisationService.getSpec());
        return "portlet-test-case/view";
    }

    private void changeModel(RenderRequest request, Model model) {
        int perPage = ParamUtil.getInteger(request, "delta", DEFAULT_PER_PAGE_VALUE);
        int page = ParamUtil.getInteger(request, "cur", DEFAULT_PAGE_NUMBER) - 1;
        Pageable pageRequest = new PageRequest(page, perPage);
        long areaId = ParamUtil.getLong(request, "areaId", DEFAULT_AREA_ID);
        Area area = areaService.getArea(areaId);
        long specId = ParamUtil.getLong(request, "specId", DEFAULT_SPECIALISATION_ID);
        Specialisation spec = specialisationService.getSpecById(specId);
        int totalCount = vacancyService.getVacancyCount(specId, areaId);

        logger.debug(String.format("Change model, areaId = %d, specId = %d, page = %d, perPage = %d, totalCount = %d",
                areaId, specId, page, perPage, totalCount));
        model.addAttribute("vacancies", vacancyService.getVacancyPerPage(specId, areaId, pageRequest));
//        model.addAttribute("vacancies", vacancyService.getVacancy(specId, areaId));
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("area", area);
        model.addAttribute("specialisation", spec);
        model.addAttribute("pageNumber", page);
        model.addAttribute("perPage", perPage);
    }


    @ActionMapping(params = "action=showVacancies")
    public void showVacancies(ActionRequest request, ActionResponse response) {
        response.setRenderParameter("act", "changePagination");

    }


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


//    @RenderMapping(params = "action=loadFilter")
//    public String filteringQuery(RenderRequest request, Model model) {
//        long area = ParamUtil.getLong(request, "area", 4L);
//        long specId = ParamUtil.getLong(request, "specId", 1L);
//        model.addAttribute("areaId", area);
//        model.addAttribute("areas", areaService.getAreas());
//        model.addAttribute("specialisations", specialisationService.getAll());
//        model.addAttribute("specId", specId);
//        return "portlet-test-case/addForm";
//    }


}
