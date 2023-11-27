package file.model;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/*
 * http://servlets.com/cos/
 */
public class FileModel {
	
	// 업로드 메소드
	public static void upload(HttpServletRequest req) throws IOException {
		// 여기를 바꿔주면 다운받는 경로가 바뀜
		String savePath = "upload";
		// 최대 업로드 파일 크기 5MB로 제한
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "UTF-8";
		ServletContext context = req.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리 :");
		System.out.println(uploadFilePath);

		MultipartRequest multi = new MultipartRequest(req, // request 객체
				uploadFilePath, // 서버상의 실제 디렉토리
				uploadFileSizeLimit, // 최대 업로드 파일 크기
				encType, // 인코딩 방법
				// 동일한 이름이 존재하면 새로운 이름이 부여됨
				new DefaultFileRenamePolicy());
	}
	
	// 다운로드 메소드
	public static void download(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String downloadFileName = req.getParameter("downloadFileName");
		res.setContentType("application/octet-stream");
		String enDownloadFileName = new String(downloadFileName.getBytes("UTF-8"), "ISO-8859-1");

		// 한글 파일명을 디코딩
		String decodedFileName = URLDecoder.decode(enDownloadFileName, "UTF-8");

		// octet-stream은 모든 파일
		res.setHeader("Content-disposition", "attachment; filename=" + enDownloadFileName);

		try (InputStream in = req.getServletContext().getResourceAsStream("/download/" + decodedFileName);
				ServletOutputStream out = res.getOutputStream()) {
			byte[] buffer = new byte[4096];
			int numBytesRead;
			while ((numBytesRead = in.read(buffer)) > 0) {
				out.write(buffer, 0, numBytesRead);
			}
		}
	}
	
	// download 폴더 파일명 json 배열로 생성
	public static void getDownloadFileList(HttpServletRequest req, HttpServletResponse res) throws IOException {
	    File downloadFolder = new File(req.getServletContext().getRealPath("/download"));

	    // 에러 처리: 디렉토리 존재 여부 확인
	    if (!downloadFolder.exists() || !downloadFolder.isDirectory()) {
	        res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Download directory not found.");
	        return;
	    }

	    File[] files = downloadFolder.listFiles();

	    List<String> fileList = new ArrayList<>();
	    if (files != null) {
	        // 에러 처리: 파일 목록 정렬
	        Arrays.sort(files);

	        for (File file : files) {
	            // 파일의 이름과 확장자 추출
	            String fileName = file.getName();

	            // 파일명에서 경로 부분 제외하고 추가
	            fileList.add(fileName);
	        }
	    }
	    
	    // 파일 목록을 gson 라이브러리를 이용해서 JSON으로 변환
	    Gson gson = new Gson();
	    String jsonFileList = gson.toJson(fileList);
	    
	    res.setContentType("application/json");
	    res.setCharacterEncoding("UTF-8");
	    res.getWriter().write(jsonFileList);
	}
	
	
}

