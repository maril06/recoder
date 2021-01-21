package com.project.recoder.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.project.recoder.board.model.vo.BoardImg;
import com.project.recoder.common.MyFileRenamePolicy;

@WebServlet("/summernoteImgUpload.do")
public class BoardImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardImgController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String errorMsg = "썸머노트로 게시글 작성 중 오류 발생";
		
		int maxSize = 20* 1024 * 1024; 
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String filePath = root + "resources/images/boardImg/";
		
		System.out.println("filePath : "+filePath);
		
		MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		
		//List<BoardImg> fList = new ArrayList<BoardImg>();
		
		Enumeration<String> files = multiRequest.getFileNames();
		
		String url = null;
		
		if(files.hasMoreElements()) {
			
			String name = files.nextElement();
			
			if(multiRequest.getFilesystemName(name) != null) {
				
				BoardImg imgs = new BoardImg();
				
				imgs.setboardImgName(multiRequest.getFilesystemName(name));
				imgs.setboardImgPath(filePath);
				
				url = imgs.getboardImgPath()+imgs.getboardImgName();
				System.out.println("패쓰 :"+ imgs.getboardImgPath()+filePath);
				//fList.add(imgs);
				
			}
		}
		
		//request.setAttribute("fList", fList);
		response.getWriter().print(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
