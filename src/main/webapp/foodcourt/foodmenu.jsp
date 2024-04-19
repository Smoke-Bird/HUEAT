<%@page import="hugesoinfo.model.HugesoInfoDto"%>
<%@page import="hugesoinfo.model.HugesoInfoDao"%>
<%@page import="meminfo.model.MemInfoDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="foodcart.FoodCartDto"%>
<%@page import="foodcart.FoodCartDao"%>
<%@page import="meminfo.model.MemInfoDao"%>
<%@page import="food.model.FoodDto"%>
<%@page import="java.util.List"%>
<%@page import="food.model.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#container {
  margin: 0 auto; 
  border: 0px solid green;
	display: flex;
	justify-content: center;
  width: 85%;
  margin-top: 30px;

}

#foodmenu{
	border: 0px solid yellow;
	width: 70%;
	margin-top: 30px;
}

.menuchoice{
	text-decoration: none;
	color: black;
}
#foodcart{
	border: 2px solid #ccc;
	width: 30%;
	margin-top: 30px;
	height: 100%;
	top: 0px;
	position: sticky;
}
#cartpaybtn{
	width: 200px;
	background-color: #618E6E;
	color: white;
	border-radius: 5px;
	border:0px;
	height: 40px;
	margin-bottom: 30px;
	margin-top: 30px;
}
.delbtn{
	background-color: #618E6E;
	color: white;
	border-radius: 5px;
	border:0px;
	height: 30px;
}
div.img{
	padding: 10px;
	border: 0px solid black;
	width: 30%;
	display: inline-block;"
}
#title{
  width: 100%;
  margin-top: 100px; 
  display: flex;
  flex-direction: column; /* 요소들을 수직으로 배치합니다. */
  align-items: center; /* 요소들을 수평 가운데로 정렬합니다. */
  margin-bottom: 20px; /* 필요에 따라 여백을 조정합니다. */
}

div.img-container{
    width: 100%; /* 이미지를 감싸는 부모 요소의 가로폭 */
    height: 300px; /* 원하는 높이로 설정 */
    overflow: hidden; /* 내용이 넘칠 경우를 대비하여 오버플로우를 숨김으로 설정 */
  	border: 0px solid black;
  	background-position: top;
  	margin-top: -10%;
  	text-align: center;
}
	div.img-container img {
		top: 0;
    width: 100%; /* 이미지가 부모 요소의 가로폭을 다 차지하도록 설정 */
    height: auto; /* 세로 비율을 유지하기 위해 자동으로 조정 */
    object-fit: cover; /* 이미지를 부모 요소에 맞게 잘라내어 배치 */
    
}
	div.span-container{
		width: 100%; /* 이미지를 감싸는 부모 요소의 가로폭 */
    height: 300px; /* 원하는 높이로 설정 */
    overflow: hidden; /* 내용이 넘칠 경우를 대비하여 오버플로우를 숨김으로 설정 */
  	border: 0px solid black;
  	background-position: top;
  	margin-top: -16%;
  	text-align: center;
  	display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
	}


div.span-container span{
		z-index: 9999;
		color: white;
		font-size: 3em;
		position: relative;

}
div.font-container{
  	opacity: 0.4;
  	background-color: black;
  	width: 100%; /* 이미지를 감싸는 부모 요소의 가로폭 */
    height: 300px; /* 원하는 높이로 설정 */
    overflow: hidden; /* 내용이 넘칠 경우를 대비하여 오버플로우를 숨김으로 설정 */
  	border: 0px solid black;
  	background-position: top;
  	margin-top: -16.1%;
  	text-align: center;
  	z-index: 100;
}

</style>
<%String loginok=(String)session.getAttribute("loginok"); %>

<script type="text/javascript">
$(function(){
	
	$("a.menuchoice").click(function(){
		
		var h_num=$("#h_num").val();
		var f_num=$(this).attr("f_num");
		var m_num=$("#m_num").val();
		var cart_cnt=$(".cart_cnt").val();
		//alert("음식번호:"+f_num+"회원번호:"+m_num+"수량:"+cart_cnt+"h_num="+h_num);
	
		var loginok="<%=loginok%>";
		  if(loginok == "null"){
	            alert("로그인이 필요한 서비스입니다.");
	            return;
	        }
		  var a=confirm("추가하시겠습니까?");
		  
		  if(a){
			  
			$.ajax({
				type:"post",
				url:"foodcourt/foodcartaddaction.jsp",
				data:{"h_num":h_num,"f_num":f_num,"m_num":m_num,"cart_cnt":cart_cnt},
				dataType:"html",
				success:function(){
					alert("추가성공");
					location.reload();
					}
				
				});
		  }
			
	})//클릭 끝
	
	$(".delbtn").click(function(){
		var cart_idx=$(this).val();
		//alert(cart_idx);
		
		$.ajax({
			type:"get",
			url:"foodcourt/foodcartdelete.jsp",
			data:{"cart_idx":cart_idx},
			dataType:"html",
			success:function(){
				//alert("삭제성공");
				location.reload();
			}
			
			
		})
		
	});
	
	
})//끝
</script>
</head>
<body>
<%
String h_num=request.getParameter("h_num");
String m_id=(String)session.getAttribute("myid");

//food메뉴 가져오기
FoodDao dao=new FoodDao();
List<FoodDto> list=dao.getMenu(h_num);
//로그인했을때 해당아이디로 주문한 메뉴 보이게
MemInfoDao mdao=new MemInfoDao();
String m_num=mdao.getM_num(m_id);
//휴게소 이름 가져오기
HugesoInfoDao hdao=new HugesoInfoDao();
HugesoInfoDto hdto=hdao.getData(h_num);
%>
<div class="img-container" style=" border: 0px solid red;">
		<img alt="" src="image/mainbanner/foodbanner01.jpg">
</div>
<%--아오 span과 span사이는 br사용이 안됨 gpt사기꾼. 하지만 span과span사이에 span을 하나 더만들면 br사용 가능. --%>
<div class="span-container" style="border:0px solid black;">
	<span style="display: block;"> <%=hdto.getH_name() %>의 주문가능 메뉴<br>
	<span style="display: block;font-size: 10pt;">*상기이미지는 실제메뉴와 차이가 있을 수 있습니다.*</span>
	</span>
</div>

<div class="font-container" style=" border: 0px solid yellow;">
</div>

<div id="container">
<input type="hidden" name="h_num" value="<%=h_num%>" id="h_num">
<input type="hidden" name="m_num" value="<%=m_num%>" id="m_num">
<div align="center" id="foodmenu" >
<%
	for(int i=0;i<list.size();i++){
		FoodDto dto=list.get(i); 
		String f_num=dao.getF_num(h_num, dto.getF_name());
		%>
	<div  class="img">
		<a class="menuchoice" f_num="<%=f_num%>">
		<img alt="" src="image/food/<%=dto.getF_photo()%>" style="width: 230px;;height: 200px;cursor: pointer;">
		<div>
			<span><%=dto.getF_name() %></span>
			<span><%= dto.getF_price() %>원</span><br>	
		</div>
		</a>
		<div>
		<input type="number" min="1" max="10" value="1" class="cart_cnt" name="cart_cnt" style="width: 50px;text-align: center;">
		</div>
	</div>

	<%}
%>

<%
FoodCartDao cdao=new FoodCartDao();
List<HashMap<String,String>> clist=cdao.getCartMenu(m_num, h_num);
NumberFormat nf=NumberFormat.getInstance();
MemInfoDto dto=mdao.getAlldatas(m_id);

%>
</div>
<div id="foodcart" align="center" >
	<form >	
	<table>
		<caption align="top" style="text-align: center; font-size: 1.6em;">주문 메뉴</caption>
		<tr align="center">
			<th width="170px;">음식명</th>
			<th width="50px;">수량</th>
			<th width="100px;">금액</th>
			<th width="70px;">취소</th>
		</tr>
		<%
			int total=0;
			for(int i=0;i<clist.size();i++){
			HashMap<String,String> map=clist.get(i);
			int price=Integer.parseInt(map.get("f_price"));
			int cnt=Integer.parseInt(map.get("cart_cnt"));
			FoodCartDto cdto=cdao.getIdx(map.get("f_num"), m_num);
			String foodname=clist.get(0).get("f_name");
			
			
			price*=cnt;
			total+=price;
			%>
		<tr align="center">
			<td class="name"><%=map.get("f_name") %></td>
			<td><%=map.get("cart_cnt") %>개</td>
			<td class="price"><%=nf.format(price)%>원</td>
			<td>
				<button type="button" class="delbtn" name="cart_idx" value ="<%=cdto.getCart_idx()%>">취소</button>
			</td>
		</tr>
			<%}
			%>	
	</table>
	<br><br><br><hr>
	<table >
		<tr style="text-align: center;">
			<td  style="font-size: 2em;">총 결제금액</td>
		</tr>
		<tr style="text-align: center; font-size: 2em;">
			<td >
				<span id="totalprice"><%=nf.format(total)%>원</span>
			</td>
		</tr>
		<tr>
			<td >
				<button type="button" id="cartpaybtn" style="font-size: 1.5em;">결제하기</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</div>
<script type="text/javascript">
$(function(){
	
	$("#cartpaybtn").click(function(){
		
		var name='<%=dto.getM_name()%>';
		var hp='<%=dto.getM_hp2()%>';
		var myid='<%=dto.getM_id()%>';

		var total=<%=total%>;
		//alert("이름:"+name+"hp: "+hp+"myid: "+myid+"foodname: "+foodname+"total: "+total);
		
		var b=confirm("총 "+<%=total%>+"원을 결제하시겠습니까?");
		
		if(b){
			requestPay(myid, total, name, hp);
			
		}
	})	
	function requestPay(myid, total, name, hp) {
		
		IMP.init('imp22445011');
        IMP.request_pay(
          {
            pg: 'html5_inicis',
            pay_method: "card",
            merchant_uid: myid+new Date().getTime(),
            name: "food",
            amount: total,
            buyer_email: "Iamport@chai.finance",
            buyer_name: name,
            buyer_tel: hp,
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
            m_redirect_url :window.location.href
          },
          function (rsp) {
            // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
            	if ( rsp.success ) { //결제 성공
							console.log(rsp);
							deleteAllCart();
							location.reload();
						} else {
							alert('결제실패 : ' + rsp.error_msg);
						}
          }
        );
      }
			
			
	


});
var m_num=$("#m_num").val();

function deleteAllCart() {
    $.ajax({
        type: "get",
        url: "foodcourt/cartalldelete.jsp",
        data:{"m_num":m_num},
        dataType:"html",
        success: function(response) {
            //alert("주문이 완료되었습니다.");
           
        },
        error: function(xhr, status, error) {
            alert("카트 삭제 중 오류가 발생했습니다.");
            console.error(xhr.responseText);
        }
    });
}
/*$.ajax({
type:"get",
url:"foodcourt/import.jsp",
data:{"name":name,"hp":hp,"myid":myid,"foodname":foodname,"total":total},
dataType:"html",
success:function(){
	//deleteAllCart();
	alert("성공");
}
});*/
</script>
</body>
</html>