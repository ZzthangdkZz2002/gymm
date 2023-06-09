package swp12.gym.controller.security;

import swp12.gym.common.DataUtil;
import swp12.gym.common.EmailUtil;
import swp12.gym.common.GooglePojo;
import swp12.gym.common.GoogleUtils;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import swp12.gym.service.LogUserService;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private GoogleUtils googleUtils;
    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private LogUserService logUserService;
    @Autowired
    private EmailUtil emailUtil;



    @RequestMapping("/login")
    public String login(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.equals("")) {
            if (message.equals("logout")) {
                model.addAttribute("message", "logout");
            }
            if (message.equals("account_error")) {
                model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
            }
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "Không đủ quyền truy cập.");
            }
            if (message.equals("session_error")) {
                model.addAttribute("message", "Lỗi thông tin.<br>Vui lòng đăng nhập lại!");
            }
            if (message.equals("google_error")) {
                model.addAttribute("message", "Đăng nhập bằng tài khoản google thất bại!");
            }
        }
        return "base/login";
    }

    @RequestMapping("/login-google")
    public String loginGoogle(HttpServletRequest request,  HttpSession session) throws IOException {
        String code = request.getParameter("code");

        if (code == null || code.equals("")) {
            return "redirect:/login?message=google_error";
        }
        String accessToken = googleUtils.getToken(code);
        GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);

        UserDto userDto = userService.getUserByEmail(googlePojo.getEmail().trim());

        if(userDto != null){
            logUserService.saveLog(userDto.getU_id(),1,dataUtil.getIntToDate(),"Đăng nhập thành công");

            session.setAttribute("display_email", userDto.getU_email());
            session.setAttribute("display_name", userDto.getU_full_name());
            session.setAttribute("display_img", userDto.getU_img());
            if(userDto.getR_id() == 1){
                UserDetails userDetail = googleUtils.buildAdmin(googlePojo);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                return "redirect:/admin/dashboard/users";
            }
            if(userDto.getR_id() == 2){
                UserDetails userDetail = googleUtils.buildEmployee(googlePojo);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                return "redirect:/employee/index";
            }
            if(userDto.getR_id() == 3){
                UserDetails userDetail = googleUtils.buildTrainer(googlePojo);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                return "redirect:/trainer/index";
            }
            session.setAttribute("display_email", userDto.getU_email());
            session.setAttribute("display_name", userDto.getU_full_name());
            session.setAttribute("display_img", userDto.getU_img());

            UserDetails userDetail = googleUtils.buildCustomer(googlePojo);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return "redirect:/customer/home";
        }


        UserDetails userDetail = googleUtils.buildCustomer(googlePojo);
        int ids = userService.getMaxIdUserInSystem() + 1;
        userService.saveCustomerForGoogle(ids,googlePojo.getEmail().trim(), googlePojo.getPicture().trim(),1);
        roleService.saveRoleForUser(ids,4);

        session.setAttribute("display_email", googlePojo.getEmail().trim());
        session.setAttribute("display_name", googlePojo.getEmail().trim());
        session.setAttribute("display_img", googlePojo.getPicture().trim());

        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        logUserService.saveLog(ids,1,dataUtil.getIntToDate(),"Đăng nhập thành công");
        return "redirect:/customer/home";
    }

    @RequestMapping("/login_success")
    public String loginSuccess(HttpServletRequest request, HttpSession session, Authentication authentication){

        if (authentication != null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();

            // quyền của tài khoản hiện tại
            User user = userService.getNameAndImgByEmail(userName);

            session.setAttribute("display_email", userName);
            session.setAttribute("display_id", user.getU_id());
            session.setAttribute("display_name", user.getU_full_name());
            session.setAttribute("display_img", user.getU_img());

            int ids = userService.findIdByUsername(userName);

//            sendMail.sendMail();
            logUserService.saveLog(ids,1,dataUtil.getIntToDate(),"Đăng nhập thành công");

            // Check user's role and then redirect
            if (request.isUserInRole("ROLE_ADMIN")) {
                return "redirect:/admin/dashboard/users";
            }
            if (request.isUserInRole("ROLE_EMPLOYEE")) {
                return "redirect:/employee/index";
            }
            if (request.isUserInRole("ROLE_TRAINER")) {
                return "redirect:/trainer/index";
            }
            // End: Check user's role and then redirect
        }
        return "redirect:/customer/home";
    }

    @RequestMapping("/access_denied")
    public String loginError(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.equals("")) {
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "Không đủ quyền hạn để truy cập!");
            }
        }
        return "base/access_denied";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String goRegisterPage(Model model){
        model.addAttribute("new_users", new User());
        return "base/register";
    }

    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public String goForgotPassword(){
        return "base/forgot-password";
    }

    @RequestMapping(value = "/forgot-password/sent_pass", method = RequestMethod.GET)
    public String goSentNewPasswordForUser(){
        String subject = "Test send mail";
        String text = "Example email";

        boolean check = emailUtil.sentMail("luonghdhe141257@fpt.edu.vn", subject,text);
        if(check){
            System.out.println("finish");
        }else {
            System.out.println("NO");
        }
        return "base/forgot-password";
    }

    @RequestMapping(value = "/register/create_user", method = RequestMethod.POST)
    public String saveNewUsers(@ModelAttribute("new_users")User user, final Model model){

        UserDto userDto = userService.getUserByEmail(user.getU_email());

        if(userDto == null){
            int id_u = userService.getMaxIdUserInSystem() + 1;
            user.setU_id(id_u);
            user.setU_password(BCrypt.hashpw(user.getU_password(), BCrypt.gensalt(10)));
            userService.createUserForGuest(user);
        }else {
            model.addAttribute("new_users", user);
            model.addAttribute("message", "Email đã tồn tại xin vui long nhập email khác");
            return "base/register";
        }

        return "redirect:/login";
    }
}
