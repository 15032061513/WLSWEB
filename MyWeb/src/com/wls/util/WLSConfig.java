package com.wls.util;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
/**
 * 所有配置文件的路径
 * @author wls
 * time 2015-07-27
 */
@Component
public class WLSConfig {

	// 分页条数
	@Value("#{configProperties['wls.pageSize']}")
	protected String pageSize;
	
	
	
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}



	public File get_file(String path) {
		File file = new File(path);
		return file;
	}
}
