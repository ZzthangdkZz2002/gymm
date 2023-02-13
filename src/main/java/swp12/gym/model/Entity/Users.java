package swp12.gym.model.Entity;

public class Users {
    private int id;
    private String email;
    private String username;
    private String password;
    private int enable;

    public Users() {
    }

    public Users(int id, String email, String username, String password, int enable) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.enable = enable;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEnable() {
        return enable;
    }

    public void setEnable(int enable) {
        this.enable = enable;
    }

    @Override
    public String toString() {
        return "Users{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enable=" + enable +
                '}';
    }
}
