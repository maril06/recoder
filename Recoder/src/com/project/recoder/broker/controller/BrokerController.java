package com.project.recoder.broker.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project.recoder.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.project.recoder.broker.model.service.BrokerService;
import com.project.recoder.broker.model.vo.Broker;
import com.project.recoder.member.model.service.MemberService;
import com.project.recoder.member.model.vo.Member;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@WebServlet("/broker/*")
public class BrokerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/broker").length()); 
		
		BrokerService service = new BrokerService();
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		try {
			
			if (command.equals("/brokerInfo.do")) {
				
				path = "/WEB-INF/views/broker/brokerInfo.jsp";
			    view = request.getRequestDispatcher(path);
			    view.forward(request, response);
			}
			
			//브로커 로그인 controller------------------------------------------------------------------
			else if(command.equals("/login.do")) {
				
				String memId = request.getParameter("userId"); //아이디
				String memPw = request.getParameter("userPw"); //비번
				String remember = request.getParameter("remember"); //아이디 저장
				
				Broker broker = new Broker();
				broker.setMemId(memId);
				broker.setMemPw(memPw);
				
				
					Broker loginMember = service.loginBroker(broker);
					
					
				// 6. Session 객체를 얻어와 로그인 정보를 추가함
					HttpSession session = request.getSession();
					
					String url = null;
					
				// 6-1. 로그인이 성공했을 때만 Session에 로그인 정보 추가하기. 
					if(loginMember != null) {
					//6-2. 30분 동안 동작이 없을 경우 Session을 만료시킴
						session.setMaxInactiveInterval(60 * 30);
					
					//6-3. Session에 로그인 정보 추가
						session.setAttribute("loginMember", loginMember);
						//System.out.println(loginMember);
						
					
					//6-4 아이디를 Cookie에 저장하기
					
						//1) 쿠키 객체 생성
						Cookie cookie = new Cookie("saveIdB", memId);
					
						//2) 아이디 저장 checkbox가 체크 되었을 때 쿠키 저장
						if(remember != null) {
							// 3) 일주일동안 쿠키가 유효하도록 설정( 쿠키생명주기설정)
							cookie.setMaxAge(60*60*24*7);
						}else {
							// 4) 아이디 저장이 체크가 안된 경우 기존에 있던 쿠키 파일 삭제
							cookie.setMaxAge(0);
						}
						//5) 쿠키 유효 디렉토리 지정
						cookie.setPath(request.getContextPath());
			
					// 6) 생성된 쿠키를 클라이언트로 전달(응답)
						response.addCookie(cookie);
						//System.out.println("성공"+session.getAttribute("beforeUrl"));
						url = (String)session.getAttribute("beforeUrl");
						
						
					//7. 로그인이 실패했을 때 "아이디 또는 비밀번호를 확인해주세요."라고 경고창 띄우기
					}else {
						session.setAttribute("swalIcon", "error");
						session.setAttribute("swalTitle", "로그인 실패");
						session.setAttribute("swalText", "아이디 또는 비밀번호를 확인해주세요");
						
						//System.out.println("실패 before Url : "+session.getAttribute("beforeUrl"));
						//System.out.println("실패 referer : "+ request.getHeader("referer"));
						
						url = request.getHeader("referer"); 
						
						String beforeUrl = (String)session.getAttribute("beforeUrl");
						//System.out.println("before url :"+beforeUrl);
						session.setAttribute("beforeUrl",  beforeUrl);
					}
					
					response.sendRedirect(url);
					
			}
			// 공인중개사 회원가입 ---------------------------------------------------------------------------
			else if(command.equals("/signUp.do")) {
				errorMsg = "회원가입 과정에서 오류 발생";
				
				//자격증 사진 주소
				int maxSize = 20 * 1024 * 1024; // 20MB == 20 * 1024KB == 20 * 1024 * 1024 Byte
				
				String root = request.getSession().getServletContext().getRealPath("/");
				String filePath = root + "resources/images/brokerInfo/";
				
				//System.out.println("filePath : "+filePath);
				
				MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
				
				Broker broker = new Broker();
				
				Enumeration<String> files = multiRequest.getFileNames();
				
				if(files.hasMoreElements()) { //다음 요소가 있다면
					
					String name = files.nextElement(); //img0
					//System.out.println("name : " + name);
					//System.out.println("원본 파일명 : " + multiRequest.getOriginalFileName(name));
					//System.out.println("변경된 파일명 : "+ multiRequest.getFilesystemName(name));
					
					if(multiRequest.getFilesystemName(name) != null) {
						
						
						broker.setBrokerFileName(multiRequest.getFilesystemName(name));
						broker.setBrokerCreti(filePath);
						
					}
				
				}
				
				
			//나머지 파라미터 받아오기
				//전달받은 파라미터를 모두 변수에 저장
				String memId = multiRequest.getParameter("userid");
				String memPw = multiRequest.getParameter("password");
				String memEmail = multiRequest.getParameter("email");
				String memNick = multiRequest.getParameter("nickname");
				String memTel = multiRequest.getParameter("usertel");

				//주소 
				String post = multiRequest.getParameter("post"); //우편번호
				String address1 = multiRequest.getParameter("address1"); //도로명주소
				String address2 = multiRequest.getParameter("address2"); //상세주소

				String brokerAddr= post + " , " +address1 +" , "+address2;
				
				broker.setMemId(memId);
				broker.setMemPw(memPw);
				broker.setMemEmail(memEmail);
				broker.setMemNick(memNick);
				broker.setMemTel(memTel);
				broker.setBrokerAddr(brokerAddr);
				
				int result = service.signUp(broker); //회원가입
				

				//swalIcon
				String swalIcon = null;
				String swalTitle = null;
				String swalText = null;
				
				if(result>0) { //성공
					swalIcon = "success";
					swalTitle = "회원가입 성공!";
					swalText = memNick + "님의 회원가입을 환영합니다.";
					
				}else { //실패
					swalIcon = "error";
					swalTitle = "회원가입 실패!";
					swalText = "문제가 지속될 경우 고객센터로 문의 바랍니다.";
				}
				
				
				
				request.getSession().setAttribute("swalIcon", swalIcon);
				request.getSession().setAttribute("swalTitle", swalTitle);
				request.getSession().setAttribute("swalText", swalText);
				
				//회원가입 진행 후 메인 페이지로 이동(메인 화면 재요청)
				response.sendRedirect(request.getContextPath());
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			path = "/WEB-INF/views/common/errorPage.jsp"; // 수정
			request.setAttribute("errorMsg", errorMsg);
			view = request.getRequestDispatcher(path);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
