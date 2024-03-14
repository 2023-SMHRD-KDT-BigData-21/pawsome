package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ImageFile {
	private String product_id;
	private String file_name1;
	private String file_name2;
	private String file_name3;
	private String file_name4;
	private String file_name5;
	
	public ImageFile(String file_name1, String file_name2, String file_name3, String file_name4, String file_name5) {
		this.file_name1 = file_name1;
		this.file_name2 = file_name2;
		this.file_name3 = file_name3;
		this.file_name4 = file_name4;
		this.file_name5 = file_name5;
	}
}
