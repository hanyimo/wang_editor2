<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>练习2</title>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	#all{
		padding:10px 0px 0px 300px;
	}
	.a{
		background-color: #d5d8ce;
	}
	
	.b{
		background-color: #f1f1f1;
	}
	.w-e-text-container{
 	   height: 185px !important;
	}
</style>
</head>
<body>
	<div id="all">
		<form action="" target="post">
			<table border="1px solid black" >
				<tr align="center" class="a">
					<td colspan="4">产品管理</td>
				</tr>
				<tr>
					<td colspan="4" class="b">
						<p>管理导航：产品类别添加 产品信息管理</p>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="submit" value="添加产品内容"/> 
						产品类别： <select>
							<option value="1">|--请选择产品类别--|</option>
							<option value="1">类别1</option>
							<option value="2">类别2</option>
							<option value="3">类别3</option>
						</select>
						关键字搜索 <input type="text"/> 
						<input type="submit" value="搜 索"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="b">
						<input type="submit" value="中文产品列表"/>
					</td>
				</tr>
				<tr>
					<td class="a" align="right">
						选择语言： 
					</td>
					<td colspan="3" class="b">
						<input type="radio" value="中文" checked="checked"/>中文
					</td>
				</tr>
				<tr>
					<td class="a" align="right">产品分类：</td>
					<td class="b"><select>
							<option value="1">YSI水质分析仪（WQS）</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select></td>
					<td class="a" align="right">发布日期：</td>
					<td class="b"><input type="date" value="2006-12-6" /></td>
				</tr>
				<tr>
					<td class="a" align="right">产品名称：</td>
					<td class="b"><input type="text" value="YSI Level Scout 水位跟踪者" /></td>
					<td class="a" align="right">附件名称：</td>
					<td class="b"><input type="text" value="" /></td>
				</tr>
				<tr>
					<td class="a" align="right">添加附件：</td>
					<td class="b"><input type="text" value="../../resourcefolder/" /></td>
					<td class="a" align="right"> </td>
					<td class="b"><input type="submit" value="删除"/><input type="submit" value="复原" disabled="disabled""/><input type="submit" value="查看"/></td>
				</tr>
				<tr>
					<td class="a" align="right"><p>简要介绍：</p>
						<p style="color:red;">少于800个字</p>
					</td>
					<td class="b">
						<textarea rows="8" cols="22">
							发布日期：2006-12-06
							当前状态：热销产品
							技术支持：完全支持
						</textarea>
					</td>
					<td class="a" align="right"><input type="text" value="添加产品介绍照片" /></td>
					<td class="b">
						<img alt="cat" src="${pageContext.request.contextPath}/static/img/cat1.png">
						<input type="submit" value="删除"/><input type="submit" value="复原"/>
					</td>
				</tr>
				<tr align="center" class="a">
					<td colspan="4">产品内容</td>
				</tr>
				<tr>
					<td colspan="4" id="editor">
						<p>内容内容内容内容内容内容内容</p>
					</td>
				</tr>
				<tr align="center" class="a">
					<td colspan="4">
						<input type="submit" value="修改产品内容"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
	<script >
		var E = window.wangEditor //将window.wangEditor的值赋给E
		var editor = new E('#editor') //将new E('#editor')【id值为editor的div中的值】的值赋给editor
		editor.customConfig.menus = [
		//	'head',			//标题
		//	'bold',			//粗体
			'fontSize',		//字号
			'fontName',		//字体
			'italic',		//斜体
			'underline',    //下划线
			'strikeThrough',//删除线
			'foreColor',	//文字颜色
			'backColor',	//背景颜色
		//	'link',		//插入链接
		//	'list',		//列表
		//	'justify',	//对齐方式
		//	'quote',	//引用
		//	'emoticon',	//表情
			'image'		//插入图片
		//	'table',	//表格
		//	'video',	//插入视频
		//	'code',		//插入代码
		//	'undo', 	//撤销
		//	'redo' 		//重复
		];
		//自定义配置颜色（字体色、背景色）
		editor.customConfig.colors = [
			'rgb(249,223,197)',
			'rgb(249,197,223)',
			'rgba(249,223,197,0.5)',
			'rgb(228,255,202)',
			'rgb(210,189,167)',
			'blue',
			'#d820d8',
			'rgb(0,0,0)'
		];
		//关闭(false)粘贴样式的过滤（true是打开过滤）
		editor.customConfig.pasterFilterStyle = true;
		//忽略粘贴样式中的图片（true:忽略，false:不忽略）
		editor.customConfig.pasteIgnoreImg = true;
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