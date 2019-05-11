package limit.beyond.explore.img;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import limit.beyond.explore.util.utils.PageBean;
import limit.beyond.explore.util.utils.loadImg;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ImgAction extends ActionSupport implements ModelDriven<Img> {

	private static final long serialVersionUID = 1L;
	private Img img = new Img();
	private PageBean<Img> pageBean;
	private ImgService imgService;

	public ImgService getImgService() {
		return imgService;
	}

	public void setImgService(ImgService imgService) {
		this.imgService = imgService;
	}

	private Integer page;

	public Img getModel() {
		return img;
	}

	public PageBean<Img> getPageBean() {
		return pageBean;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String p() {

		String path;
		String name = new SimpleDateFormat("yyyyMMddHHmmssSSS")
				.format(new Date());
	
		path = ServletActionContext.getServletContext().getRealPath("/")
				+ "picture/";
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdir();
		} 
		path += name + ".jpg";
		try {
			URL url = new URL("http://100.100.100.4:8080/?action=snapshot");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setConnectTimeout(10 * 1000);
			InputStream inStream = conn.getInputStream();
			byte[] data = loadImg.readInputStream(inStream);
			FileOutputStream outStream = new FileOutputStream(path);
			outStream.write(data);
			// C:\apache-tomcat-6.0.14\webapps\EBL\picture/20170526232627689.jpg
			String ViewPath = path.substring(path.indexOf("picture"),
					path.indexOf("g") + 1);

			img.setPath(ViewPath);
			img.setName(name);
			imgService.save(img);

		} catch (Exception e) {
			// TODO: 
			e.printStackTrace();
		}

		return "save";
	}

	public String adminFindAll() {

		pageBean = imgService.findByPage(page);
		return "list";
	}

	public String delete() {
		imgService.delete(img);
		return "toGetList";
	}

	public String toVideo() {

		return "toVideo";
	}

	
}
