function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = ' ';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = ' ';

                } else {
                    document.getElementById('guide').innerHTML = ' ';
                }
            }
        }).open();
    }



// 비밀번호 확인
$(
        function() {
            $('#txtPass').keyup( function() {
                $('#lblMsg').text('');
            });
            $('#txtRePass').keyup( function() {
                if($('#txtPass').val() != $('#txtRePass').val()) {
                    $('#lblMsg').text('');
                    $('#lblMsg').html("암호가 틀립니다.");
                }
                else {
                    $('#lblMsg').text('');
                    $('#lblMsg').html("암호가 동일합니다.");
                }
            });
        }
   	);


// notnull 입력창은 다 쓰게 하도록
function checkIt(){
	var userinput=document.userinput;
	
	if(!userinput.member_id.value){
		alert("아이디를 입력해주세요");
		userinput.member_id.focus();
		return false;
	}
	
	if(!userinput.member_passwd.value){
		alert("비밀번호를 입력해주세요");
		userinput.member_passwd.focus();
		return false;
	}
	
	if(!userinput.member_email.value){
		alert("이메일를 입력해주세요");
		userinput.member_email.focus();
		return false;
	}
	
	if(!userinput.member_name.value){
		alert("이름을 입력해주세요");
		userinput.member_name.focus();
		return false;
	}
	
	if(!userinput.member_mailadd.value){
		alert("주소를 입력해주세요");
		userinput.member_mailadd.focus();
		return false;
	}
	
	if(!userinput.member_baseadd.value){
		alert("주소를 입력해주세요");
		userinput.member_baseadd.focus();
		return false;
	}
	
	if(!userinput.member_detailadd.value){
		alert("주소를 입력해주세요");
		userinput.member_detailadd.focus();
		return false;
	}
	
	return true;
}

 
LeftPosition=(screen.width-200)/2;
TopPosition=(screen.height-300)/2;
//아이디 중복 여부를 판단
function openJoinidck(userinput){
    //아이디를 입력했는지 검사
    if(userinput.member_id.value==""){
        alert("아이디를 입력해주세요");
        userinput.member_id.focus();
        return;
    }
    //url과 사용자 입력 id를 조합합니다.
    url="joinidck.jsp?member_id="+userinput.member_id.value;
    
    //새로운 윈도우를 엽니다.
    window.open(url,"confirm","width="+300+",height="+150+",top="+TopPosition+",left="+LeftPosition+", scrollbars=no");
}