package com.example.demo.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class GenFile {
	private int id;
	private String regDate;
	private String updateDate;
	private boolean delStatus;
	private String delDate;
	private String typeCode;
	private String type2Code;
	private String relTypeCode;
	private int relId;
	private String fileExtTypeCode;
	private String fileExtType2Code;
	private int fileSize;
	private int fileNo;
	private String fileExt;
	private String fileDir;
	private String originFileName;

	@JsonIgnore // 이 메서드는 JSON 직렬화에서 무시됨
	public String getFilePath(String genFileDirPath) {
		return genFileDirPath + getBaseFileUri();
	}

	@JsonIgnore // 이 메서드는 JSON 직렬화에서 무시됨
	private String getBaseFileUri() { // 기본 파일 URI를 반환
		return "/" + relTypeCode + "/" + fileDir + "/" + getFileName(); // 관련 타입 코드, 파일 디렉토리, 파일 이름을 조합하여 URI 반환
	}

	public String getFileName() {  // 파일 이름을 반환
		return id + "." + fileExt; // 파일 ID와 확장자를 조합하여 파일 이름 반환
	}

	public String getForPrintUrl() { // 출력용 URL을 반환
		return "/gen" + getBaseFileUri() + "?updateDate=" + updateDate; // 기본 파일 URI에 업데이트 날짜를 쿼리 파라미터로 추가하여 반환
	}

	public String getDownloadUrl() { // 다운로드 URL을 반환
		return "/common/genFile/doDownload?id=" + id; // 파일 ID를 쿼리 파라미터로 추가한 다운로드 URL 반환
	}

	public String getMediaHtml() { // 미디어 HTML 태그를 반환
		return "<img src=\"" + getForPrintUrl() + "\">";// 이미지 태그를 생성하여 출력용 URL을 src로 설정
	}
}