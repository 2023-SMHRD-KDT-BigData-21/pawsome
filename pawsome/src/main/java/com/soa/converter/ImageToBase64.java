package com.soa.converter;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

public class ImageToBase64 {
	public String convert(File f) {
		String result = null;
		// 1. 파일(f)을 가져와서 바이트 배열형태로 읽기
		try {
			byte[] fileContent = FileUtils.readFileToByteArray(f);
			result = Base64.getEncoder().encodeToString(fileContent);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

}
