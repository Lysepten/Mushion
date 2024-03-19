<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- mushion head -->
<%@ include file="../common/mushionHead.jspf"%>
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
</style>

<html class="html-body">

<label>
  <input type="checkbox" id="mainCheckbox"> Main Checkbox
</label>

<div id="dynamicCheckboxContainer" class="hidden">
  <label>
    <input type="checkbox" id="dynamicCheckbox"> Dynamic Checkbox
  </label>
</div>

<script>
  const mainCheckbox = document.getElementById('mainCheckbox');
  const dynamicCheckboxContainer = document.getElementById('dynamicCheckboxContainer');

  mainCheckbox.addEventListener('change', function() {
    if (this.checked) {
      dynamicCheckboxContainer.classList.remove('hidden');
    } else {
      dynamicCheckboxContainer.classList.add('hidden');
    }
  });
</script>

<div id="checkboxContainer"></div>
<button onclick="toggleDynamicCheckbox()">체크박스 생성/해제</button>

<script>
function toggleDynamicCheckbox() {
	  var checkboxContainer = document.getElementById("checkboxContainer");

	  // checkboxContainer에 체크박스가 있는지 확인
	  var dynamicCheckbox = checkboxContainer.querySelector("input[type='checkbox']");

	  if (dynamicCheckbox) {
	    // 체크박스가 이미 존재하는 경우 제거
	    checkboxContainer.removeChild(dynamicCheckbox);
	  } else {
	    // 체크박스가 존재하지 않는 경우 생성
	    dynamicCheckbox = document.createElement("input");
	    dynamicCheckbox.type = "checkbox";
	    dynamicCheckbox.checked = "checked";
	    
	    checkboxContainer.appendChild(dynamicCheckbox);
	  }
	}
</script>

<form class="args-form" action="/usr/home/VarArgsTest">
<div><input name="args" type="checkbox" value="Jazz"/>재즈</div>
<div><input name="args" type="checkbox" value="Hiphop"/>힙합</div>
<div><input name="args" type="checkbox" value="Rock"/>락</div>
<input value="보내기!" class="btn" type="submit" />
</form>

</body>