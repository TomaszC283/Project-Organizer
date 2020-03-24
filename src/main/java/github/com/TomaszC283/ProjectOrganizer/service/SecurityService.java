package github.com.TomaszC283.ProjectOrganizer.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String email, String password);
}
