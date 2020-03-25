package github.com.TomaszC283.ProjectOrganizer.admin;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	private MultipartFile filename;

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
}
