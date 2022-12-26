<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "controller.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<h1>자바 코드로 속성값 읽기</h1>
			<div>context영역 속성 : <%=application.getAttribute("contextNo")%></div>
			<div>session영역 속성 : <%=session.getAttribute("sessionNo")%></div>
			<div>request영역 속성 : <%=request.getAttribute("requestNo")%></div>
		</div>
		<div>
			<h1>EL을 사용하여 속성값 읽기</h1>
			<div>context영역 속성 : ${applicationScope.contextNo}</div>
			<div>session영역 속성 : ${sessionScope.sessionNo}</div>
			<div>request영역 속성 : ${requestScope.requestNo}</div>
		</div>
		<div>
			<h1>EL을 사용하여 속성값 읽기(scope생략가능)</h1>
			<div>context영역 속성 : ${contextNo}</div>
			<div>session영역 속성 : ${sessionNo}</div>
			<div>request영역 속성 : ${requestNo}</div>
		</div>
		<div>
			<h1>자바코드를 이용하여 여러 자료형 속성(request)값 읽기</h1>
			<div>
				<%=(String)(request.getAttribute("name"))%> 문자열
			</div>
			<div>
				<%
					Member member = (Member)(request.getAttribute("member"));
				%>
				<%=member.getId()%> 멤버객체
			</div>
			<div>
				<%
					String[] arr = (String[])(request.getAttribute("arr"));
				%>
				<%=arr[0]%> 배열
			</div>
			<div>
				<%
					ArrayList<Member> list = (ArrayList<Member>)(request.getAttribute("list"));
					Member m = list.get(1);
				%>
				<%=m.getId()%> 리스트
			</div>
		</div>
		<div>
			<h1>EL을 이용하여 여러 자료형 속성(request)값 읽기</h1>
			<!-- EL문은 import도 필요없다 -->
			<div>
				${name}
			</div>
			<div>
				${member.id} 
				<!-- 리플랙션API를 사용하여 자동으로 member타입으로 형변환되고 EL표현식안에서 .id라고 호출하면 getId()가 호출된다. vo타입의 getter가 없으면 에러난다 -->
			</div>
			<div> <!-- 배열이나 Collections 인덱스 [번호]형태로 표현 -->
				${arr[0]}
			</div>
			<div>
				${list[1].id}
			</div>
		</div>
		
		<div>
			<h1>EL표현식안에서 연산(수치연산, 비교연산, 논리연산) 가능</h1>
			<div>
				2*3 : ${2*3}
			</div>
			<div>
				3은 1보다 크다 : ${3 > 1}
			</div>
			<div>
				거짓 or 참 : ${false || true}
			</div>
			<div>
				no속성값은 7이다 : ${requestNo == 7}
			</div>
			<div>
				name속성값은 goodee이다 : ${name == 'goodee'}
			</div>
			<div>
				person속성은 없다(null이다) : ${person == null}
			</div>
		</div>
		
		<div>
			EL은 값을 표현하는 방법이지 문(자바문장)은 표현할 수 없다.<br>
			그래서 문을 태그처럼 표현하기 위해서 커스텀태그(태그라이브러리)인 JSTL을 사용한다.<br>
			MVC에서는 JSTL 모두다를 사용하지는 않고 주로 Core단(제어문부문)부분만 사용한다. 
		</div>
		
		
		
		
		
		
	</body>
</html>