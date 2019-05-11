package limit.beyond.explore.img;

import java.io.File;
import java.util.List;

import limit.beyond.explore.util.utils.PageBean;

import org.springframework.transaction.annotation.Transactional;


@Transactional             
public class ImgService{
	private ImgDao imgDao;

	public ImgDao getImgDao() {
		return imgDao;
	}

	public void setImgDao(ImgDao imgDao) {
		this.imgDao = imgDao;
	}

	public void save(Img img) {
		System.out.println(imgDao);
		imgDao.save(img);
	}

	public PageBean<Img> findByPage(Integer page) {
		PageBean<Img> pageBean = new PageBean<Img>();
		int limit = 9;//每页显示的记录数
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		
		// 总记录数
		int totalCount = imgDao.findCount();
		
		pageBean.setTotalCount(totalCount);
		// 总页数:
		int totalPage = 0;
		
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page -1 )*limit;
		List<Img> list = imgDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	public void delete(Img img) {
		Img imgMsg = imgDao.get(img.getId());
		File file =new File("C:\\apache-tomcat-6.0.14\\webapps\\e\\picture\\"+imgMsg.getName()+".jpg");
		if(file.exists()){
			System.out.println("文件存在");
			file.delete();
		}else {
			System.out.println("文件不存在");
		}
		
		/**
		 * 根绝  id  删除 信息
		 */
		imgDao.delete(imgDao.get(img.getId()));
	}

	
}
