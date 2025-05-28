<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>xxx课件管理系统</title>
    <%--    <base href="${pageContext.request.contextPath}/">--%>
    <%--    FIXME base设置会影响单独的底部的删除确认JS--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>xxx课件管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
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
            <span>用户管理页面</span>
        </div>
        <form action="${pageContext.request.contextPath}/user" method="get">
            <div class="search">
                <span>用户名：</span>
                <%--    TODO 修复查询框和按钮的样式  --%>
                <%--    TODO 查询状态下的分页功能 --%>
                <input type="hidden" name="action" value="queryByRealname">
                <input type="text" name="realname" placeholder="请输入用户名"
                       value="<c:out value="${param.realname}" default=""/>">
                <button type="submit">
                    <input type="button" value="查询"/>
                </button>
                <a href="${pageContext.request.contextPath}/user/toUserAdd">添加用户</a>
            </div>
        </form>
        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户账号</th>
                <th width="20%">真实姓名</th>
                <th width="10%">性别</th>
                <th width="10%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">用户类型</th>
                <th width="30%">操作</th>
            </tr>

            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.realname}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.sex == '1'}">男</c:when>
                            <c:when test="${user.sex == '2'}">女</c:when>
                            <c:otherwise>未知</c:otherwise>
                        </c:choose>
                    </td>
                    <td> <!-- TODO 年龄计算 -->
                            ${user.birthday}
                    </td>
                    <td>${user.tel}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.type == '1'}">学生</c:when>
                            <c:when test="${user.type == '2'}">老师</c:when>
                            <c:when test="${user.type == '3'}">管理员</c:when>
                            <c:otherwise>未知</c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <a href="${pageContext.request.contextPath}/user/view?action=view&id=${user.id}"><img
                                src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                        <a href="${pageContext.request.contextPath}/user/toUserUpdate?action=toUpdate&id=${user.id}">
                            <!-- 改为通过Servlet处理 -->
                            <img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/>
                        </a>
                        <a href="#" class="removeUser" data-id="${user.id}"><img
                                src="${pageContext.request.contextPath}/img/schu.png" alt="删除"
                                title="删除"/></a>
                    </td>

                </tr>
            </c:forEach>
            <tr>
                <td colspan="7">
                    <%--    FIXME 分页查询    --%>
                    当前第${currentPage}页，共${totalPages}页
                    <c:if test="${currentPage > 1}">
                        <a href="?realname=${param.realname}&pageNum=1">首页</a>
                    </c:if>
                    <c:if test="${currentPage > 1}">
                        <a href="?realname=${param.realname}&pageNum=${currentPage - 1}">上一页</a>
                    </c:if>
                    <c:if test="${currentPage < totalPages}">
                        <a href="?realname=${param.realname}&pageNum=${currentPage + 1}">下一页</a>
                    </c:if>
                    <c:if test="${currentPage < totalPages}">
                        <a href="?realname=${param.realname}&pageNum=${totalPages}">尾页</a>
                    </c:if>

                    跳转到：
                    <form action="" method="get" style="display: inline;">
                        <input type="number" name="pageNum" min="1" max="${totalPages}" step="1"
                               style="width: 50px;" required/>
                        <input type="hidden" name="realname" value="${param.realname}"/>
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

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/js.js"></script>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
<script>
    $(function () {
        let userIdToDelete = null;

        // 点击“删除”按钮设置用户ID并显示弹窗
        $('.removeUser').on('click', function (e) {
            e.preventDefault();
            userIdToDelete = $(this).data('id');
            console.log(userIdToDelete);
        });

        // 点击“确定”执行删除操作
        $('#yes').on('click', function () {
            if (userIdToDelete) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/delete?id=" + userIdToDelete,
                    type: "POST",
                    success: function () {
                        // 删除成功后刷新当前页面
                        location.reload();
                    },
                    error: function () {
                        alert("删除失败，请重试");
                    }
                });

            }

            // 隐藏弹窗
            $('.zhezhao').css('display', 'none');
            $('#removeUse').fadeOut();
        });

    });
</script>

</body>
</html>