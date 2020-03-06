<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>练习1</title>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	#all{
		padding:50px 0px 0px 250px;
		background-color: #f3fcff;
	}
	.a{
		height:30px;
	}
	#b{
		padding-left: 350px;
	}
</style>
</head>
<body>
	<div id="all">
		<form action="" target="post">
			<table border="1px solid black">
				<tr class="a">
					<td> 招聘对象 </td>
					<td>
						<input type="text" value="行业客户经理">
					</td>
				</tr>
				<tr class="a">
					<td> 招聘人数 </td>
					<td>
						<input type="text" value="2">人
					</td>
				</tr>
				<tr class="a">
					<td> 工作地点 </td>
					<td>
						<input type="text" value="上海">
					</td>
				</tr>
				<tr class="a">
					<td> 工资待遇 </td>
					<td>
						<input type="text" value="面议">
					</td>
				</tr>
				<tr class="a">
					<td> 发布日期 </td>
					<td>
						<input type="date" value="2005-12-18">
					</td>
				</tr>
				<tr class="a">
					<td> 有效期限 </td>
					<td>
						<input type="text" value="20">天
					</td>
				</tr>
				<tr>
					<td> 招聘要求 </td>
					<td id="editor">
						<p>劈里啪啦劈里啪啦劈里啪啦劈里啪啦劈里啪啦劈里啪啦劈里啪啦</p>
					</td>
				</tr>
				<tr class="a" >
					<td colspan="2" id="b">
						<input type="submit" value="确定" >&nbsp;
						<input type="submit" value="取消" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
	<script >
		var E = window.wangEditor //将window.wangEditor的值赋给E
		var editor = new E('#editor') //将new E('#editor')【id值为editor的div中的值】的值赋给editor
		//自定义配置颜色（字体色、背景色）
		editor.customConfig.colors = [
			'rgb(249,223,197)',
			'rgb(249,197,223)',
			'rgba(249,223,197,0.5)',
			'rgb(228,255,202)',
			'rgb(210,189,167)',
			'rgb(189,210,167)',
			'blue',
			'#d820d8',
			'rgb(0,0,0)'
		];
		//自定义字体
		editor.customConfig.fontNames = [
			'宋体',
			'微软雅黑',
			'等线',
			'幼圆',
			'黑体',
			'楷体',
			'华文新魏'
		];
		// 上传图片到服务器(处理上传的后台代码)
	    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload';
	 	// 隐藏“网络图片”菜单(true是显示--默认，false隐藏)
	    editor.customConfig.showLinkImg = false;
	 	// 将每张图片大小限制为 3M(单位为字节)
	    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
	 	// 限制一次最多能传几张图片，默认为 10000 张（即不限制），需要限制可自己配置
		// 限制一次最多上传 5 张图片
		editor.customConfig.uploadImgMaxLength = 5;
	 	// 监听函数，可使用监听函数在上传图片的不同阶段做相应处理
	 	editor.customConfig.uploadImgHooks = {
			// 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
	    	// （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
	    	// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
	    	customInsert: function (insertImg, result, editor) {
	        	// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
	        	// 举例：假如上传图片成功后，服务器端返回的是 [url,url,...] 这种格式，即可这样插入图片：
	        	for(var i in result){// result 必须是一个 JSON 格式字符串！！！否则报错
	        		insertImg('${pageContext.request.contextPath}/static/file/'+result[i]);
	        	}
	    	}
	    }
		editor.create()//使用了create方法（在js里）创建了富文本框
	</script>
</body>
</html>