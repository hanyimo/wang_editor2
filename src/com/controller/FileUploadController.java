package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;

@WebServlet("/upload")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ������Ӧ��������MIME���ͼ�����
		response.setContentType("application/json;charset=utf-8");
		// ������Ӧ��������
		List<String> urls = new ArrayList<>();
		// ��ȡ��Ӧ�����
		PrintWriter out = response.getWriter();
		try {
			//�����ļ��ϴ���Ĵ洢λ��(��Ŀ�б����ȴ���)
			String realPath = getServletContext().getRealPath("/static/file");
			// Ϊ���ڴ��̵��ļ����DiskFileItemFactory����
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// ���ô洢�⣨��ȷ��ʹ�ð�ȫ����ʱλ�ã�
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);
			// �����µ��ļ����ش������
			ServletFileUpload upload = new ServletFileUpload(factory);
			//���ñ����ļ��ı��뷽ʽ��
			upload.setHeaderEncoding("UTF-8");
			// ��������
			List<FileItem> items = upload.parseRequest(request);
			// �����ϴ�����Ŀ
			Iterator<FileItem> iter = items.iterator();
			while (iter.hasNext()) {
			    FileItem item = iter.next();
			    String fileName = item.getName();	// ��ȡ�ļ���
			    String rand = UUID.randomUUID().toString();// ��ȡһ��UUIDֵ
			    // �ϴ��ļ�
			    fileName = rand+fileName.substring(fileName.lastIndexOf("."));
			    File uploadedFile = new File(realPath,fileName);
			    item.write(uploadedFile);
			    // ��ͼƬ������ӵ�urls��
			    urls.add(fileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ����JSON����
		out.write(JSON.toJSONString(urls));
		out.flush();
		out.close();
		return;
	}
}
