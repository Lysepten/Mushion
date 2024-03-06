<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<body>
<div id="map" style="width:1000px;height:500px;"></div>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
    <!-- 지도타입 컨트롤 div 입니다 -->
    <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
        <span class="btn" onclick="removeMarkers()">마커 삭제</span>
        <span class="btn" onclick="showMarkers()">마커 표시</span>
        <span class="btn" onclick="hideMarkers()">마커 숨김</span>
    </div>
    
    
    <form action="/usr/home/keyword" method="POST" name="form2">
    <input class="input input-bordered input-primary w-full max-w-xs rs" autocomplete="off" type="text"
							placeholder="검색어를 입력해주세요" name="keyword" onkeyup="keycheck()"/>
							</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f69b55c9c466f91d08d33415d35266a&libraries=services"></script>
<script>

var	lat;
var	lon;
var keyword;
// async function getData2() {
// 	const API_KEY = '%2FuVHLtR1PUUwIJ5atClfZHJpP0c2IW%2F5lh9m%2FLQ0IK5BNHX0YKtAZpsU5OFjJyGgh8II4ExW6qiwi7h3cMP8Qg%3D%3D';
// 	const url = 'https://www.yuseong.go.kr/ys_parking/ysparkingList/ORP/getJSONData.do?_wadl&type=json';
// 	const response = await fetch(url);
// 	const data = await response.json();
// 	console.log("data", data);
// 	console.log(data.response);
// 	console.log(data.response.header);
// 	console.log(data.response.header.resultMsg);
// 	console.log(data.response.body.items[0].item.latitude);
// 	console.log(data.response.body.items[0].item.longitude);
	
// 	lat = data.response.body.items[0].item.latitude;
// 	lon = data.response.body.items[0].item.longitude;
// }

// getData2();

// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(36.3551262, 127.34788), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 


function keycheck() {
	var form = document.form2;
	console.log(keyword)
	
	$.get("./keyword", {
		keyword : form.keyword.value
	}, function(data) {
		keyword = data;
		console.log(keyword)
		ps.keywordSearch(keyword, placesSearchCB); 
	}, 'html');
}

// 키워드로 장소를 검색합니다


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
	
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

var markers = [];

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map)
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);
}

function removeMarkers() {
	marker.setMap(null)
}
// 지도에 마커를 표시하는 함수입니다.

function displayMarker(place) {
	
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    
    markers.push(marker);
    
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}





</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>