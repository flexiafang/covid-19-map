<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情地图</title>
    <script type="text/javascript">
        <%!
            // 记录时间戳
            long time = 0;
            // 记录疫情数据
            String text;
        %>
        <%
            if (System.currentTimeMillis() - time > 600000) {
                // 更新时间戳
                time = System.currentTimeMillis();
                // 创建一个URL类的对象url
                URL url = new URL("https://zaixianke.com/yq/all");
                // 通过URL类的对象url打开网络连接, 并得到连接对象conn
                URLConnection conn = url.openConnection();
                // 通过连接对象, 得到用于读取网页内容的输入流 is
                InputStream is = conn.getInputStream();
                // 将上述的字节流is装饰为字符流, 将字符流再装饰为一次能读取一行的字符流br
                BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
                // 通过字符流br,读取一行内容,并将内容存储到变量text中
                text = br.readLine();
            }
        %>
        var data = <%=text%>;
    </script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/echarts/4.7.0/echarts.min.js"></script>
    <script src="http://cdn.zaixianke.com/china.js"></script>
    <script src="http://cdn.zaixianke.com/world.js"></script>
</head>
<body>
<div id="main" style="width: 100%;height:600px;"></div>
<br>
<div style="text-align:center">
    <a style="color:#333" class="control" align="center" href="javascript:updateMap(0)">国内累计</a>
    <a style="color:#333" class="control" align="center" href="javascript:updateMap(1)">国内新增</a>
    <a style="color:#333" class="control" align="center" href="javascript:updateMap(2)">全球累计</a>
    <a style="color:#333" class="control" align="center" href="javascript:updateMap(3)">全球新增</a>
</div>
<script src="control.js"></script>
</body>
</html>