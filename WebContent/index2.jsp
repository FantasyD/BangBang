<%@ page language="java" pageEncoding="GBK"%>
<html>
    <head>
        <title>图片上传实验</title>
    </head>
    <body>
        <form action="uploadImage.html" method="post" enctype="multipart/form-data">
            学号:<input type="text" name="sid"/><br/>
            文件:<input type="file" name="photo"/><br/>
            <input type="submit" value="上传"/>
        </form>
    </body>
</html>