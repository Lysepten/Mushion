<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPw"></c:set>
<link rel="stylesheet" href="/resource/mushion.css" />

<%-- <%@ include file="../common/head.jspf"%> --%>

<%@ include file="../common/mushionHead.jspf"%>


<script>
var counter = 1;
$(document).ready(function() {

  var erroEle = $('.error-message'),
    focusInput = $('.questions').find('.active');

  $('.navigation a').click(function() {
    nextMaster('navi');

    var thisInput = $('#' + $(this).attr('data-ref'));
    $('.active').removeClass('active');
    thisInput.focus().addClass('active')
    thisInput.closest('li').animate({
      marginTop: '0px',
      opacity: 1
    }, 200);
    thisInput.closest('li').prevAll('li').animate({
        marginTop: '-150px',
        opacity: 0
      }, 200)
      //                     .AddClass('done');

    thisInput.closest('li').nextAll('li').animate({
        marginTop: '150px',
        opacity: 0
      }, 200)
      //                    .RemoveClass('done');
    errorMessage(erroEle, '', 'hidden', 0);

  });

  if (focusInput.val() != '') {
    $('#next-page').css('opacity', 1);
  }

  $(document).keypress(function(event) {
    if (event.which == 13) {
      nextMaster('keypress');
      event.preventDefault();
    }

    $('#next-page').click(function() {
      var focusInput = $('.questions').find('.active');
      nextMaster('nextpage');

    })

  });

  function nextMaster(type) {
    var focusInput = $('.questions').find('.active');
    if (focusInput.val() != '') {
      if ((focusInput.attr('name') == 'name' || focusInput.attr('name') == 'username') && focusInput.val().length < 2) {
        errorMessage(erroEle, "isn't your " + focusInput.attr('name') + " bit small. ", 'visible', 1);
      } else if (focusInput.attr('name') == 'email' && !validateEmail(focusInput.val())) {
        errorMessage(erroEle, "It doesn't look like a " + focusInput.attr('name'), 'visible', 1);
      } else if (focusInput.attr('name') == 'phone' && !validatePhone(focusInput.val())) {
        errorMessage(erroEle, "It doesn't look like a " + focusInput.attr('name'), 'visible', 1);
      } else {

        if (type != 'navi') showLi(focusInput);
        $('#next-page').css('opacity', 0);
        errorMessage(erroEle, '', 'hidden', 0);
      }
    } else if (type == 'keypress') {
      errorMessage(erroEle, 'please enter your ' + focusInput.attr('name'), 'visible', 1);
    }

  }

  $("input[type='text']").keyup(function(event) {
    var focusInput = $(this);
    if (focusInput.val().length > 1) {
      if ((focusInput.attr('name') == 'email' && !validateEmail(focusInput.val())) ||
        (focusInput.attr('name') == 'phone' && !validatePhone(focusInput.val()))) {
        $('#next-page').css('opacity', 0);
      } else {
        $('#next-page').css('opacity', 1);
      }

    } else {
      $('#next-page').css('opacity', 0);
    }
  });

  $("#password").keyup(function(event) {
    var focusInput = $(this);
    $("#viewpswd").val(focusInput.val());
    if (focusInput.val().length > 1) {
      $('#next-page').css('opacity', 1);
    }
  });

  $('#signup').click(function() {
    $('.navigation').fadeOut(400).css({
      'display': 'none'
    });
    $('#sign-form').fadeOut(400).css({
      'display': 'none'
    });
    $(this).fadeOut(400).css({
      'display': 'none'
    });
    $('#wf').animate({
      opacity: 1,
      marginTop: '1em'
    }, 500).css({
      'display': 'block'
    });
  });

  $('#show-pwd').mousedown(function() {
    $(this).toggleClass('view').toggleClass('hide');
    $('#password').css('opacity', 0);
    $('#viewpswd').css('opacity', 1);
  }).mouseup(function() {
    $(this).toggleClass('view').toggleClass('hide');
    $('#password').css('opacity', 1);
    $('#viewpswd').css('opacity', 0);
  });

});

function showLi(focusInput) {

  focusInput.closest('li').animate({
    marginTop: '-150px',
    opacity: 0
  }, 200);

  console.log(focusInput.closest('li'));

  if (focusInput.attr('id') == 'viewpswd') {
    $("[data-ref='" + focusInput.attr('id') + "']")
      .addClass('done').html('password');
    //                    .html(Array(focusInput.val().length+1).join("*"));
  } else {
    $("[data-ref='" + focusInput.attr('id') + "']").addClass('done').html(focusInput.val());
  }

  focusInput.removeClass('active');
  counter++;

  var nextli = focusInput.closest('li').next('li');

  nextli.animate({
    marginTop: '0px',
    opacity: 1
  }, 200);

  nextli.find('input').focus().addClass('active');

}

function errorMessage(textmeg, appendString, visib, opaci) {
  textmeg.css({
    visibility: visib
  }).animate({
    opacity: opaci
  }).html(appendString)
}

function validateEmail(email) {
  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function validatePhone(phone) {
  var re = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
  return re.test(phone);
}
</script>
 
<style>

.msheader {
	width: 1920px;
}

* {
  margin: 0;
  padding: 0;
}

*,
*:after,
*:before {
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
  .navigation {
    text-align: left;
    ol {
      list-style: none;
      background: #0D1E27;
      position: absolute;
      padding: 30px 0;
      width: 600px;
      z-index: 100;
      li {
        display: inline-block;
        margin-right: 27px;
        font-size: 0.7em;
        max-width: 20%;
        text-align: left;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        a {
          color: #fff;
          text-decoration: none;
          position: relative;
          z-index: 2;
          cursor: pointer;
          opacity: 0;
          &.done {
            opacity: 1;
          }
        }
      }
      margin-bottom: 30px;
    }
  }
  .sign-form {
    width: 600px;
    text-align: left;
    margin: 85px 0 0 0;
    #next-page {
      opacity: 0;
      width: 40px;
      height: 40px;
      display: inline-block;
      vertical-align: middle;
      margin-left: 20px;
      background: url("https://jdniki.github.io/signup/images/next-page.svg");
      background-size: contain;
      &:hover {
        background: url("https://jdniki.github.io/signup/images/next-pagehover.svg");
        background-size: contain;
      }
    }
    .questions {
      list-style: none;
      -webkit-transition: height 0.4s;
      transition: height 0.4s;
      width: 88%;
      display: inline-block;
      height: 80px;
      li {
        position: absolute;
        width: 500px;
        span {
          display: block;
          margin-bottom: 10px;
        }
        input {
          width: 100%;
          font-size: .9em;
          color: #f2f2f2;
          margin: 0.3em 0 1em 0;
          border: none;
          background: none;
          border-bottom: 3px solid #fff;
          padding: 0.5em 0.1em;
          transition: all 0.5s ease;
          &:focus {
            outline: none;
            border-bottom: 3px solid #028BAF;
          }
        }
        &:not(:first-child) {
          opacity: 0;
          margin-top: 150px;
        }
        /*-------------Password ------------------*/
        #viewpswd {
          position: absolute;
          opacity: 0;
          //                    z-index:-100;
        }
        #show-pwd {
          margin: -2.75em 0em;
          width: 40px;
          height: 40px;
          position: absolute;
          right: 0;
          color: rgba(255, 255, 255, 0.4);
          cursor: pointer;
          &.view {
            background: url("https://jdniki.github.io/signup/images/view.svg");
            background-size: contain;
          }
          &.hide {
            background: url("https://jdniki.github.io/signup/images/hide.svg");
            background-size: contain;
          }
        }
        #show-pwd:active,
        #show-pwd:focus {
          background: url("https://jdniki.github.io/signup/images/hide.svg");
          background-size: contain;
        }
        select.country {
          position: absolute;
          width: 4.5em;
          font-size: 0.7em;
          color: #f2f2f2;
          height: 70px;
          background: transparent;
          border: 1px solid #ccc;
          -webkit-appearance: none;
          -moz-appearance: none;
          appearance: none;
          border: none;
        }
        #phone {
          padding-left: 5em;
        }
      }
    }
  }
  .error-message {
    color: rgba(207, 0, 0, 0.56);
    font-size: 14px;
    margin-top: 10px;
    padding-bottom: 30px;
    background: #0D1E27;
  }
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

@-webkit-keyframes moveUpFromDown {
  from {
    -webkit-transform: translateY(100%);
  }
  to {
    -webkit-transform: translateY(0);
  }
}

@keyframes moveUpFromDown {
  from {
    -webkit-transform: translateY(100%);
    transform: translateY(100%);
  }
  to {
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}

</style>

<!-- <html style="background-color: #071015"> -->

<!-- <section class="mt-8 text-xl px-4"> -->
<!-- 	<div class="ms-checkPw"> -->
<!-- 		<form action="../member/doCheckPw" method="POST" style="width: 100%"> -->
<!-- 			<table class="login-box table-box-1" style="color : #fff; width: 100%"> -->

<!-- 				<tbody class="ms-checkPw-tbody"> -->

<!-- 					<tr> -->
<!-- 						<th>아이디</th> -->
<%-- 						<td>${rq.loginedMember.loginId }</td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>비밀번호</th> -->
<!-- 						<td><input -->
<!-- 							class="input input-bordered w-full max-w-xs ms-checkPw-tbody-text" -->
<!-- 							autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요" -->
<!-- 							name="loginPw" style="background-color: #071015"/></td> -->
<!-- 					</tr> -->
<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 			<input style="color : #fff;" class="btn btn-outline w-full max-w-xs" type="submit" -->
<!-- 							value="확인" /> -->
<!-- 		</form> -->

<!-- 		<div class="btns"> -->

<!-- 			<button style="color : #fff;" class="btn btn-outline w-full max-w-xs" type="button" -->
<!-- 				onclick="history.back();">뒤로가기</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->

<!-- <div> -->

   <div class="container">
            <div class="navigation">
                <ol>
                    <li><a href="#"  data-ref="name">Name</a></li>
                    <li><a href="#"  data-ref="uname">Username</a></li>
                    <li><a href="#"  data-ref="email">Email</a></li>
                    <li><a href="#"   data-ref="viewpswd">Password</a></li>
                    <li><a href="#"  data-ref="phone">Phone</a></li>
                </ol>
            </div>
            <form id="sign-form" class="sign-form">
                <ol class="questions">
                    <li>
                        <span><label for="name">본인 확인을 위해 비밀번호를 입력 해주세요.</label></span>
						<input class="active" id="name" name="name" type="text" placeholder="PASS WORD" autofocus/>
                    </li>
                    <li>
				        <span><label for="uname">& what shall we call you?</label></span>
                        <input id="uname" name="username" type="text" placeholder="Enter a username" autofocus/>
					</li>
                    <li>
				        <span><label for="email">Enter you email</label></span>
                        <input id="email" name="email" type="text" placeholder="Email"  autofocus/>
					</li>
                    <li>
                        <span><label for="password">Choose a password</label></span>
                        <input id="viewpswd" name="password" type="text" placeholder="this your password"/>
                        <input id="password" name="password" type="password" placeholder="make sure you dont forget" autofocus/>
                        <span id="show-pwd" class="view"></span>
					</li>
                    <li>
                        <span><label for="phone">Enter your phone number</label></span>
                            <select name="countryCode" class="country"  >
                                <option data-countryCode="GB" value="91">(+91) INDIA </option>
                                <option data-countryCode="GB" value="44">(+44) UK </option>
                                <option data-countryCode="US" value="1">(+1) USA </option>
                                <optgroup label="Other countries">
                                   <option data-countryCode="DZ" value="213"> (+213)Algeria</option>
                                   <option data-countryCode="AD" value="376"> (+376) Andorra</option>
                                   <option data-countryCode="AO" value="244">(+244) Angola </option>
                                   <option data-countryCode="AI" value="1264"> (+1264) Anguilla</option>
                                   <option data-countryCode="AG" value="1268">(+1268) Antigua &amp; Barbuda </option>
                                   <option data-countryCode="AR" value="54">(+54) Argentina </option>
                                   <option data-countryCode="AM" value="374"> (+374) Armenia</option>
                                   <option data-countryCode="AW" value="297">(+297) Aruba </option>
                                   <option data-countryCode="AU" value="61"> (+61) Australia</option>
                                   <option data-countryCode="AT" value="43">(+43) Austria </option>
                                   <option data-countryCode="AZ" value="994"> (+994) Azerbaijan</option>
                                   <option data-countryCode="BS" value="1242">(+1242)Bahamas </option>
                                </optgroup>
                            </select>
                            <input id="phone" name="phone" type="text" autofocus/>
                    </li>
                    <li><p style="margin-top: 45px;font-size: 32pt;float:right">
                        <a href="#" style="color:white;text-decoration:none" id="signup">sign up</a></p>    </li>
                
                    
                </ol>
                <div id="next-page" alt="Kiwi standing on oval"></div>
                <div class="error-message"></div>
                
            </form>
        <h1 id="wf" style="opacity:0;width: 600px; margin-top:1.1em;display:none; margin-bottom:1em">Thank you</h1>
</div>

<!-- </html> -->
