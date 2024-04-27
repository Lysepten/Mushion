package com.example.demo.crawling;

import java.sql.SQLException;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

record RegionInfoTips(String information, String voltage, String language, String climate, String timeDifference,
		String rate, String tips, int regionId) {

}

public class clothesSnapshotCrawling {

	private WebDriver driver;
	private String url;

	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public void crawling() throws SQLException, ClassNotFoundException {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);

		url = "https://www.musinsa.com/search/musinsa/coordi?q=%EA%B7%B8%EB%9F%B0%EC%A7%80&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(url);

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		//스타일 리스트 전체
//		List<WebElement> informNames = driver.findElements(By.className("style-list-item"));

		// 리스트 이미지 전체
		List<WebElement> images = driver.findElements(By.cssSelector("img"));

		// 이미지 주소가 null일 경우 건너뛴다.
		for (WebElement image : images) {
		    if(image.getAttribute("data-original") != null) {
		    	String imageUrl = image.getAttribute("data-original");
		    	System.out.println("이미지 주소: " + imageUrl);
		    }
		}


		driver.close();
	}

	public static void main(String[] args) {
		clothesSnapshotCrawling crawler = new clothesSnapshotCrawling();
	    try {
	        crawler.crawling();
	    } catch (ClassNotFoundException e) {
	        System.out.println("드라이버 로딩에 실패했습니다.");
	        e.printStackTrace();
	    } catch (SQLException e) {
	        System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	}
}