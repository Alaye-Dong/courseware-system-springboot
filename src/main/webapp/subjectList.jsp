<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>xxx课件管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>xxx课件管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${sessionScope.user.realname}</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="subjectList.html">科目管理</a></li>
                <li><a href="studyList.html">课件管理</a></li>
                <li><a href="userList.html">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>科目管理页面</span>
        </div>
        <div class="search">
            <form action="${pageContext.request.contextPath}/subject" method="get">
                <span>科目名：</span>
                <input type="text" name="subjectName" placeholder="请输入科目名" value="${param.subjectName}">
                <input type="submit" value="查询" style="width: 80px"/>
                <a href="subjectAdd.jsp">添加科目</a>
            </form>
        </div>
        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">科目编码</th>
                <th width="20%">科目名称</th>
                <th width="20%">创建人</th>
                <th width="20%">状态</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach items="${subjects}" var="subject">
                <tr>
                    <td>${subject.id}</td>
                    <td>${subject.subjectName}</td>
                    <td>${subject.creatorRealname}</td>
                    <td>
                        <c:choose>
                            <c:when test="${subject.status == 1}">正常</c:when>
                            <c:otherwise>禁用</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${subject.status == 1}">
                                <a href="${pageContext.request.contextPath}/subject/updateStatus?id=${subject.id}&status=0"
                                   onclick="return confirm('确定要禁用该科目吗？')">禁用</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/subject/updateStatus?id=${subject.id}&status=1"
                                   onclick="return confirm('确定要启用该科目吗？')">启用</a>
                            </c:otherwise>
                        </c:choose>
                    </td>

                </tr>
            </c:forEach>
            <tr>
                <td colspan="5">
                    当前第 ${pageBean.currentPage} 页，共 ${pageBean.totalPages} 页，
                    共 ${pageBean.totalItems} 条数据
                    <c:if test="${pageBean.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/subject?subjectName=${subjectName}&pageNum=1">首页</a>&nbsp;
                        <a href="${pageContext.request.contextPath}/subject?subjectName=${subjectName}&pageNum=${pageBean.currentPage - 1}">上一页</a>&nbsp;
                    </c:if>
                    <c:if test="${pageBean.currentPage < pageBean.totalPages}">
                        <a href="${pageContext.request.contextPath}/subject?subjectName=${subjectName}&pageNum=${pageBean.currentPage + 1}">下一页</a>&nbsp;
                        <a href="${pageContext.request.contextPath}/subject?subjectName=${subjectName}&pageNum=${pageBean.totalPages}">尾页</a>
                    </c:if>

                    跳转到：
                    <form action="" method="get" style="display: inline;">
                        <input type="number" name="pageNum" min="1" max="${totalPages}" step="1"
                               style="width: 50px;" required/>
                        <input type="hidden" name="subjectName" value="${param.subjectName}"/>
                        页
                        <input type="submit" value="GO" style="width: 50px;font-size: 12px;"/>
                    </form>
                </td>
            </tr>

        </table>


    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
</footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>