package com.example.demo.crawling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

record snapshotUrl(String url, int fashionStyleId) {

}

public class clothesSnapshotCrawling {

	private WebDriver driver;
	private String snapUrl;

	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public void crawling() throws SQLException, ClassNotFoundException {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// 크롤링
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);

		// DB
		String url = "jdbc:mysql://127.0.0.1:3306/Spring_AM_01?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
	    Connection conn = DriverManager.getConnection(url, "root", "");
	    String insertQuery = "INSERT INTO snapshotUrl (url, fashionStyleId) VALUES (?, ?)";
	    PreparedStatement pstmt = conn.prepareStatement(insertQuery);
		
		// 무신사 스냅샷 그런지 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EA%B7%B8%EB%9F%B0%EC%A7%80&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		List<WebElement> images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
		for (WebElement image : images) {
		    if(image.getAttribute("data-original") != null) {
		    	
		    	String imageUrl = image.getAttribute("data-original");
		    	int fashionStyleId = 6;
		    	
		    	pstmt.setString(1, imageUrl);
		    	pstmt.setInt(2, fashionStyleId);
		    	pstmt.executeUpdate();
		    	
		    	System.out.println("이미지 주소: " + imageUrl);
		    }
		}
		
		// 클래식룩 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%ED%81%B4%EB%9E%98%EC%8B%9D%EB%A3%A9&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 4;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
		
		// 스트릿 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EC%8A%A4%ED%8A%B8%EB%A6%BF&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 13;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
		
		// 캐주얼 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EC%BA%90%EC%A3%BC%EC%96%BC&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 3;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
		
		// 히피 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%ED%9E%88%ED%94%BC&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 7;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}

		// 스포티 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EC%8A%A4%ED%8F%AC%ED%8B%B0&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 12;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}

		// 보헤미안 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EB%B3%B4%ED%97%A4%EB%AF%B8%EC%95%88&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 2;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}

		// 바이커 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EB%B0%94%EC%9D%B4%EC%BB%A4%EB%A3%A9&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 1;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
		
		// 펑크 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%ED%8E%91%ED%81%AC&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 9;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
		
		// 리조트 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EB%A6%AC%EC%A1%B0%ED%8A%B8%EB%A3%A9&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 10;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
		
		// 빈티지 스타일 이미지
		snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EB%B9%88%ED%8B%B0%EC%A7%80%EB%A3%A9&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
		driver.get(snapUrl);
		
		images = driver.findElements(By.cssSelector("img"));
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 이미지 주소가 null일 경우 건너뛴다.
				for (WebElement image : images) {
				    if(image.getAttribute("data-original") != null) {
				    	
				    	String imageUrl = image.getAttribute("data-original");
				    	int fashionStyleId = 14;
				    	
				    	pstmt.setString(1, imageUrl);
				    	pstmt.setInt(2, fashionStyleId);
				    	pstmt.executeUpdate();
				    	
				    	System.out.println("이미지 주소: " + imageUrl);
				    }
				}
				
				
				// 미니멀 스타일 이미지
				snapUrl = "https://www.musinsa.com/search/musinsa/coordi?q=%EB%AF%B8%EB%8B%88%EB%A9%80&list_kind=small&sortCode=term_date&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
				driver.get(snapUrl);
				
				images = driver.findElements(By.cssSelector("img"));
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
				// 이미지 주소가 null일 경우 건너뛴다.
						for (WebElement image : images) {
						    if(image.getAttribute("data-original") != null) {
						    	
						    	String imageUrl = image.getAttribute("data-original");
						    	int fashionStyleId = 8;
						    	
						    	pstmt.setString(1, imageUrl);
						    	pstmt.setInt(2, fashionStyleId);
						    	pstmt.executeUpdate();
						    	
						    	System.out.println("이미지 주소: " + imageUrl);
						    }
						}
		
		//스타일 리스트 전체
//		List<WebElement> informNames = driver.findElements(By.className("style-list-item"));
		
//		List<snapshotUrl> snapshotUrlList = new ArrayList<>();

		System.out.println("DB 전송 완료");

		conn.close();
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