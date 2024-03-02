<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:set var="pageTitle" value="MAIN"></c:set> --%>
<%-- <%@ include file="../common/head.jspf"%> --%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/common.css" />
<link rel="stylesheet" href="/resource/mushion.css" />
<link rel="stylesheet" href="/resource/charmUI.css" />
<script src="/resource/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
	<h1 style="font-size: 2rem;">${pageTitle }</h1>




<script src="https://cdn.tailwindcss.com"></script>

<script>
    tailwind.config = {
      darkMode: "class",
    }
  </script>

<script>
function toggleTheme() {
    if (document.body.classList.contains("dark"))
        document.body.classList.remove("dark");
    else
        document.body.classList.add("dark");
}
</script>
<body class="dark">
	


<main>
    <div class="relative flex flex-col h-[100vh] items-center justify-center bg-white dark:bg-black transition-bg">
        <div class="absolute inset-0 overflow-hidden">
            <div class="jumbo absolute -inset-[10px] opacity-50"></div>
        </div>
        <h1 class="relative flex items-center text-5xl font-bold text-gray-800 dark:text-white dark:opacity-80 transition-colors">
            <a href="../home/Mushion" class="msfont">Mushion</a>
            <a href="../home/Mushion">
            <span class="ml-1 rounded-xl bg-current p-2 text-[0.7em] leading-none">
                <span class="text-white dark:text-black">UI</span>
            </span>
            </a>
        </h1>
    </div>
</main>
</body>
<%-- <%@ include file="../common/foot.jspf"%> --%>