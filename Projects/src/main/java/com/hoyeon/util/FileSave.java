package com.hoyeon.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

//파일 저장하기
@Component
public class FileSave {
	public String save(String realPath, MultipartFile file) {
		File f = new File(realPath);

		if (!f.exists()) {
			f.mkdirs();
		}

		String fileName = UUID.randomUUID().toString();
		fileName = fileName + "_" + file.getOriginalFilename();

		f = new File(f, fileName);
		try {
			FileCopyUtils.copy(file.getBytes(), f);

		} catch (IOException e) {
			e.printStackTrace();
		}

		// file.transferTo(f);

		return fileName;
	}
}
