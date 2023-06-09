package swp12.gym.dto;

public class UserDto {
    private int u_id;
    private String u_full_name;
    private String u_email;
    private String u_password;
    private String u_dob;
    private int u_gender;
    private String u_phone_number;
    private String u_address;
    private String u_img;
    private String u_identity_card;
    private int r_id;
    private String r_name;
    private int u_enable;
    private String u_create_date;
    private int t_experience;
    private int tp_price;
    private int tp_id;

    public UserDto() {
    }

    public UserDto(int u_id, String u_full_name, String u_email, String u_password, String u_dob, int u_gender, String u_phone_number, String u_address, String u_img, String u_identity_card, int r_id, String r_name, int u_enable, String u_create_date, int t_experience, int tp_price, int tp_id) {
        this.u_id = u_id;
        this.u_full_name = u_full_name;
        this.u_email = u_email;
        this.u_password = u_password;
        this.u_dob = u_dob;
        this.u_gender = u_gender;
        this.u_phone_number = u_phone_number;
        this.u_address = u_address;
        this.u_img = u_img;
        this.u_identity_card = u_identity_card;
        this.r_id = r_id;
        this.r_name = r_name;
        this.u_enable = u_enable;
        this.u_create_date = u_create_date;
        this.t_experience = t_experience;
        this.tp_price = tp_price;
        this.tp_id = tp_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_full_name() {
        return u_full_name;
    }

    public void setU_full_name(String u_full_name) {
        this.u_full_name = u_full_name;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_dob() {
        return u_dob;
    }

    public void setU_dob(String u_dob) {
        this.u_dob = u_dob;
    }

    public int getU_gender() {
        return u_gender;
    }

    public void setU_gender(int u_gender) {
        this.u_gender = u_gender;
    }

    public String getU_phone_number() {
        return u_phone_number;
    }

    public void setU_phone_number(String u_phone_number) {
        this.u_phone_number = u_phone_number;
    }

    public String getU_address() {
        return u_address;
    }

    public void setU_address(String u_address) {
        this.u_address = u_address;
    }

    public int getU_enable() { return u_enable; }

    public void setU_enable(int u_enable) { this.u_enable = u_enable; }

    public String getU_img() {
        return u_img;
    }

    public void setU_img(String u_img) {
        this.u_img = u_img;
    }

    public String getU_identity_card() {
        return u_identity_card;
    }

    public void setU_identity_card(String u_identity_card) {
        this.u_identity_card = u_identity_card;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getU_create_date() {
        return u_create_date;
    }

    public void setU_create_date(String u_create_date) {
        this.u_create_date = u_create_date;
    }

    public String getR_name() { return r_name; }

    public void setR_name(String r_name) { this.r_name = r_name; }

    public int getT_experience() {
        return t_experience;
    }

    public void setT_experience(int t_experience) {
        this.t_experience = t_experience;
    }

    public int getTp_price() {
        return tp_price;
    }

    public void setTp_price(int tp_price) {
        this.tp_price = tp_price;
    }

    public int getTp_id() {
        return tp_id;
    }

    public void setTp_id(int tp_id) {
        this.tp_id = tp_id;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "u_id=" + u_id +
                ", u_full_name='" + u_full_name + '\'' +
                ", u_email='" + u_email + '\'' +
                ", u_password='" + u_password + '\'' +
                ", u_dob='" + u_dob + '\'' +
                ", u_gender=" + u_gender +
                ", u_phone_number='" + u_phone_number + '\'' +
                ", u_address='" + u_address + '\'' +
                ", u_img='" + u_img + '\'' +
                ", u_identity_card='" + u_identity_card + '\'' +
                ", r_id=" + r_id +
                ", u_enable=" + u_enable +
                '}';
    }
}
