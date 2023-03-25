package com.ck.util;

import java.io.File;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public class FileUpDownLoad {

	public static String upload(String path, MultipartFile file) {
		if (!file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();
			String newFilename = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf('.'));
			try {
				file.transferTo(new File(path + newFilename));
				return newFilename;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;
	}

	public static ResponseEntity<byte[]> download(HttpServletRequest request, String path) {
		try {
			File file = new File(path);
			path = getFilename(request, path);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment", path);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static String getFilename(HttpServletRequest request, String filename) throws Exception {
		String[] IEBrowserKeyWords = { "MSIE", "Trident", "Edge" };
		String userAgent = request.getHeader("User-Agent");
		for (String keyWord : IEBrowserKeyWords) {
			if (userAgent.contains(keyWord)) {
				return URLEncoder.encode(filename, "UTF-8");
			}
		}
		return new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	}
}
