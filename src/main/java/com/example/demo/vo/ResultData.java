package com.example.demo.vo;

import java.util.Map;

import com.example.demo.util.Ut;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ResultData<DT> {

	private String resultCode;

	private String msg;

	private DT data1;

	private String data1Name;

	private Object data2;

	private String data2Name;

	private Map<String, Object> body;

	public ResultData(String resultCode, String msg, Object... args) { // 생성자
		this.resultCode = resultCode; // 결과 코드를 설정
		this.msg = msg; // 메시지를 설정
		this.body = Ut.mapOf(args); // 유틸리티 메서드를 사용하여 body 맵을 설정
	}

	public static <DT> ResultData<DT> from(String resultCode, String msg) { // 정적 메서드로 ResultData 객체 생성
		return from(resultCode, msg, null, null); // data1Name과 data1 없이 호출
	}

	public static <DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1) { // 정적 메서드로 ResultData 객체 생성
		ResultData<DT> rd = new ResultData<DT>(); // 새로운 ResultData 객체 생성
		rd.resultCode = resultCode; // 결과 코드를 설정
		rd.msg = msg; // 메시지를 설정
		rd.data1Name = data1Name; // 첫 번째 데이터 이름을 설정
		rd.data1 = data1; // 첫 번째 데이터 객체를 설정

		return rd; // ResultData 객체 반환
	}

	public static <DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1, String data2Name,
			DT data2) { // 정적 메서드로 ResultData 객체 생성
		ResultData<DT> rd = new ResultData<DT>(); // 새로운 ResultData 객체 생성
		rd.resultCode = resultCode; // 결과 코드를 설정
		rd.msg = msg; // 메시지를 설정
		rd.data1Name = data1Name; // 첫 번째 데이터 이름을 설정
		rd.data1 = data1; // 첫 번째 데이터 객체를 설정
		rd.data2Name = data2Name; // 두 번째 데이터 이름을 설정
		rd.data2 = data2; // 두 번째 데이터 객체를 설정

		return rd; // ResultData 객체 반환
	}

	public static <DT> ResultData<DT> newData(ResultData rd, String dataName, DT newData) { // 새로운 데이터로 ResultData 객체 생성
		return from(rd.getResultCode(), rd.getMsg(), dataName, newData); // 기존 ResultData의 결과 코드와 메시지를 사용하여 새로운 ResultData 생성
	}

	public boolean isSuccess() { 
		return resultCode.startsWith("S-"); // 결과 코드가 "S-"로 시작하는지 확인
	}

	public boolean isFail() {
		return isSuccess() == false;
	}

	public void setData2(String data2Name, Object data2) { // 두 번째 데이터를 설정
		this.data2Name = data2Name; // 두 번째 데이터 이름을 설정
		this.data2 = data2; // 두 번째 데이터 객체를 설정
	}

}
