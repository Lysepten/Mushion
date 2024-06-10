<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPw"></c:set>
<link rel="stylesheet" href="/resource/mushion.css" />


<%@ include file="../common/mushionHead.jspf"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Form</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /* 주어진 CSS를 그대로 복사하여 붙여넣어주세요 */
        .msheader {
            width: 1920px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #071015;
            color: #fff;
            font-size: 1.5em;
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", sans-serif;
            font-weight: 100;
            text-align: center;
        }

        .container {
            background: #0D1E27;
            color: #028BAF;
            display: inline-block;
            padding: 0em 2em;
            margin: 6em auto;
            box-shadow: 0 50px 50px rgba(0, 0, 0, .2);
        }

        .navigation {
            text-align: left;
        }

        .navigation ol {
            list-style: none;
            background: #0D1E27;
            position: absolute;
            padding: 30px 0;
            width: 600px;
            z-index: 100;
        }

        .navigation ol li {
            display: inline-block;
            margin-right: 27px;
            font-size: 0.7em;
            max-width: 20%;
            text-align: left;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .navigation ol li a {
            color: #fff;
            text-decoration: none;
            position: relative;
            z-index: 2;
            cursor: pointer;
            opacity: 0;
        }

        .navigation ol li a.done {
            opacity: 1;
        }

        .sign-form {
            width: 600px;
            text-align: left;
             margin: 50px 0 40px 0; 
        }

        .questions {
            list-style: none;
            -webkit-transition: height 0.4s;
            transition: height 0.4s;
            width: 88%;
            display: inline-block;
            height: 80px;
        }

        .questions li {
            position: absolute;
            width: 500px;
        }

        .questions li span {
            display: block;
            margin-bottom: 10px;
        }

        .questions li input {
            width: 100%;
            font-size: .9em;
            color: #f2f2f2;
            margin: 0.3em 0 1em 0;
            border: none;
            background: none;
            border-bottom: 3px solid #fff;
            padding: 0.5em 0.1em;
            transition: all 0.5s ease;
        }

        .questions li input:focus {
            outline: none;
            border-bottom: 3px solid #028BAF;
        }

        #next-page {
            opacity: 0;
            width: 40px;
            height: 40px;
            display: inline-block;
            vertical-align: middle;
            margin-left: 20px;
            background-size: contain;
            background-color: #fff;
            z-index: 1000;
        }

        #next-page:hover {
            background-size: contain;
        }

        .error-message {
            color: rgba(207, 0, 0, 0.56);
            font-size: 14px;
            margin-top: 10px;
            padding-bottom: 30px;
            background: #0D1E27;
        }

        ::-webkit-input-placeholder {
            font-size: 0.9em;
            color: rgba(255, 255, 255, 0.7);
        }

        :-moz-placeholder {
            /* Firefox 18- */
            font-size: 0.9em;
            color: rgba(255, 255, 255, 0.7);
        }

        ::-moz-placeholder {
            /* Firefox 19+ */
            font-size: 0.9em;
            color: rgba(255, 255, 255, 0.7);
        }

        :-ms-input-placeholder {
            font-size: 0.9em;
            color: rgba(255, 255, 255, 0.7);
        }
        
.ms-pw-button{
position:absolute;

left: 1200px;
top: 400px;

width:50px;
}
    </style>
</head>

<body>
    <div class="container" style="width : 700px">
        <div class="navigation">
        </div>
        <form id="sign-form" class="sign-form" action="../member/doCheckPw" method="POST">
            <ol class="questions">
                <li>
                    <span><label for="password">본인확인을 위해 비밀번호를 입력해주세요.</label></span>
                    <input id="password" name="loginPw" type="password" placeholder="Enter your password" />
                </li>
            </ol>
<!--             <div id="next-page"></div> -->
            <div class="error-message"></div>
            <button class="ms-pw-button" type="submit">확인</button>
        </form>
    </div>

</body>


</html>
