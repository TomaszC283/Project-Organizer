package github.com.TomaszC283.ProjectOrganizer.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JSPValues extends HttpServlet {
	
	String role_employee;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		setRole_employee(request.getParameter("role_employee"));
	}

	public String getRole_employee() {
		return request.getParameter("role_employee");
	}

	public void setRole_employee(String role_employee) {
		this.role_employee = role_employee;
	}
}
