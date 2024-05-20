package com.example.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.exception.GenFileNotFoundException;
import com.example.demo.service.GenFileService;
import com.example.demo.vo.GenFile;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GenFileController {
	@Value("${custom.genFileDirPath}") // genFile이 저장될 기본 경로를 설정하기 위한 속성 주입
	private String genFileDirPath;

	@Autowired // GenFileService를 주입받음
	private GenFileService genFileService;

	@RequestMapping("/common/genFile/doUpload") // 파일 업로드를 처리하는 메서드
	@ResponseBody
	public ResultData doUpload(@RequestParam Map<String, Object> param, MultipartRequest multipartRequest) {
		System.err.println(multipartRequest); // multipartRequest를 콘솔에 출력
		return genFileService.saveFiles(param, multipartRequest); // 파일 저장 서비스 호출
	}

	@GetMapping("/common/genFile/doDownload") // 파일 다운로드를 처리하는 메서드
	public ResponseEntity<Resource> downloadFile(int id, HttpServletRequest request) throws IOException {
		GenFile genFile = genFileService.getGenFile(id); // id에 해당하는 GenFile을 가져옴

		if (genFile == null) { // GenFile이 없으면 예외 발생
			throw new GenFileNotFoundException();
		}

		String filePath = genFile.getFilePath(genFileDirPath); // GenFile의 저장 경로를 가져옴

		Resource resource = new InputStreamResource(new FileInputStream(filePath)); // 파일을 읽어 Resource로 변환

		// 파일의 Content Type을 결정
		String contentType = request.getServletContext().getMimeType(new File(filePath).getAbsolutePath());

		if (contentType == null) { // Content Type이 결정되지 않았을 경우 기본값 설정
			contentType = "application/octet-stream";
		}

		// 다운로드 응답 생성
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + genFile.getOriginFileName() + "\"")
				.contentType(MediaType.parseMediaType(contentType)).body(resource);
	}

	@GetMapping("/common/genFile/file/{relTypeCode}/{relId}/{typeCode}/{type2Code}/{fileNo}") // 파일을 보여주는 메서드
	public ResponseEntity<Resource> showFile(HttpServletRequest request, @PathVariable String relTypeCode,
			@PathVariable int relId, @PathVariable String typeCode, @PathVariable String type2Code,
			@PathVariable int fileNo) throws FileNotFoundException {
		GenFile genFile = genFileService.getGenFile(relTypeCode, relId, typeCode, type2Code, fileNo); // 조건에 맞는 GenFile을 가져옴

		if (genFile == null) { // GenFile이 없으면 예외 발생
			throw new GenFileNotFoundException();
		}

		String filePath = genFile.getFilePath(genFileDirPath); // GenFile의 저장 경로를 가져옴
		Resource resource = new InputStreamResource(new FileInputStream(filePath)); // 파일을 읽어 Resource로 변환

		String contentType = request.getServletContext().getMimeType(new File(filePath).getAbsolutePath()); // 파일의 Content Type을 결정

		if (contentType == null) { // Content Type이 결정되지 않았을 경우 기본값 설정
			contentType = "application/octet-stream";
		}

		// 파일 보기 응답 생성
		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType)).body(resource);
	}
}
