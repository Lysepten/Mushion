<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <div class="ms-home-charm-body bg-white dark:bg-black transition-bg">
        <div class="ms-home-charm-body2">
            <div class="jumbo ms-home-charm-body2"></div>
        </div>
        <h1 class="ms-home-charm-body3 dark:text-white dark:opacity-80">
            <a href="../home/Mushion" class="msfont">Mushion.</a>
        </h1>
    </div>
</main>
</body>