<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			 .reporttd{
		      height:50px;
		      color: #000;
		      font-size: 18px;
		      }
		      
		      .reportdiv{
		      overflow-y: scroll;
		      height: 80px;
		      background-color: #F6F6F6;
		      }
		      
		      .report{
		      border: 1px solid #D5D5D5; 
		      width: 800px; 
		      height:190px;; 
		      margin:auto; 
		      padding-top: 10px;
		      }
		      
		      .checksize{
		      	
		      	zoom: 1.3;
    			cursor: pointer;
    		
		      }
		</style>
		<script type="text/javascript">
			
			function checkboxon(){
				
				var wholecheck = document.getElementById('wholecheck');
				var reportcheck1 = document.getElementById('reportcheck1');
				var reportcheck2 = document.getElementById('reportcheck2');
							      
				if(wholecheck.checked){
					reportcheck1.checked = true;
					reportcheck2.checked = true;
				}else{
					reportcheck1.checked = false;
					reportcheck2.checked = false;
				}
			}
		
		
		</script>
	</head>
	<body>
		<div align="left" style="width: 800px; height:30px; margin:auto;">
			<input type="checkbox" id="wholecheck" class="checksize" onclick="checkboxon()">
			<strong style="color: #747474; vertical-align: 2px;">
				포켓몰 이용약관 및 회원 주문에 대한 개인정보 수집 이용 동의를 확인하고 전체 동의합니다.
			</strong>
		</div>
		<div align="center" class="report">
			<table width="750">
				<tr>
					<td class="reporttd" align="left">
			 			회원 주문에 대한 개인정보 수집 이용 동의
			 		</td>
				</tr>
				<tr>
					<td>
						<div class="reportdiv">
							<br>
								<font size="2px">
									- 수집항목: 성명, 비밀번호, 이메일, 휴대폰번호, 주소, 전화번호<br>
									- 수집/이용목적: 서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 불만처리 등 민원치리, 회원관리 등을 우한 목적<br>
									- 이용기간: 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.<br>
									단, 관계법령의 규정에 의하여 보전할 필요가 있는 경우 일정기간 동안 개인정보를 보관훌 수 있습니다.<br>
									그 밖의 사항은 포켓몰의 개인정보처리방침을 준수합니다.	
								</font>
							<br>	
						</div>
					</td>
				</tr>
				<tr height="30px">
					<td>
						<input type="checkbox" id="reportcheck1" class="checksize">
						<font size="2px" style="vertical-align: 5px;"><b>(필수)</b> 회원 개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의 합니다.</font>
					</td>
				</tr>
			</table>
		</div>
		
		<div style="height: 40px;">
		</div>
		
		<div align="center" class="report">
			<table width="750">
				<tr>
					<td class="reporttd" align="left">
			 			이용약관 동의
			 		</td>
				</tr>
				<tr>
					<td>
						<div class="reportdiv">
							<br>
								<font size="2px">
									제 1조(목적)<br><br>
									표준약관 제10023호<br><br>
									이 약관은 포켓몰 회사(전자거래 사업자)가 운영하는 포켓몰(이하 '몰'이라 한다)에서 제공하는 인터넷 관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 사
									이버몰과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.<br>
									※「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br><br><br>
									제 2조(정의)<br><br>
									1. '몰'이란 포켓몰 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터등 정보통신정비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울
									러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
									2. '이용자'란 '몰'에 접속하여 이 약관에 따라 '몰'이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
									3. '회원'이라 함은 '몰'에 개인정보를 제공하여 회원등록을 한 자로서, '몰'의 정보를 지속적으로 제공받으며, '몰'이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
									4. '비회원'이라 함은 회원에 가입하지 않고 '몰'이 제공하는 서비스를 이용하는 자를 말합니다.<br><br><br>
									제 3조(약관동의 명시와 설명 및 개정)<br><br>
									1. '몰'은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업신고번호,
									개인정보 보호책임자등을 이용자가 쉽게 알 수 있도록 '몰'의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
									2. '몰'은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공
									하여 이용자의 확인을 구하여야 합니다.<br>
									3. '몰'은 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 벌률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
									4. '몰'이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적요일자 7일이전부터 적용일자 전까지 공지합니다.<br>
									다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 '몰'은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
									5. '몰'이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 게약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 '몰'에 송시나여 '몰'의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
									6. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.<br><br><br>
									제 4조(서비스의 제공 및 변경)<br><br>
									1. '몰'은 다음과 같은 업무를 수행합니다.<br>
									- 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
									- 구매계약이 체결된 재화 또는 용역의 배송<br>
									- 기타 '몰'이 정하는 업무<br>
									2. '몰'은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>
									3. '몰'이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>
									4. 전항의 경우 '몰'은 이로 인하여 사용자가 입은 손해를 배상합니다. 다만, '몰'이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br><br><br>
									제 5조(서비스의 중단)<br><br>
									1. '몰'은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두정 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
									2. '몰'은 제 1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, '몰'이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
									3. 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 '몰'은 제8조에 정한 방법으로 이용자에게 통지하고 당초 '몰'에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, '몰'이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 '몰'에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.	
								</font>
							<br>	
						</div>
					</td>
				</tr>
				<tr height="30px">
					<td>	
						<input type="checkbox" id="reportcheck2" class="checksize">				
						<font size="2px" style="vertical-align: 5px;"><b>(필수)</b> 이용약관에 대한 내용을 하였으며 이에 동의 합니다.</font>
					</td>
				</tr>
			</table>
		</div>
	
	</body>
</html>