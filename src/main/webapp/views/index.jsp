<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">

    <style>
        @import url("${ctx}/resources/static/css/main.css");
    </style>
    <script type="text/javascript">
        var ctx = "${ctx}";
    </script>
</head>

<body>

<div class="sticky-header header-section">

    <div class="header-left">
        <div class="logo" style="margin-top:6px;">
            <a href="javascript:void(-1)">
                  <span>
                    <img src="${ctx}/resources/static/images/logo_03.png" />
                  </span>
            </a>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="header-right">
        <div class="profile_details_left">
            <!--notifications of menu start -->
            <ul class="nofitications-dropdown">
                <li class="dropdown head-dpdn" style="border:none;">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i>
                            <img src="${ctx}/resources/static/images/map_add.png" /></i>
                        <span style="color:#FFF; padding-left:5px; font-weight:bold;">东西湖高新区</span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="notification_header">
                                <h3>You have 3 new messages</h3></div>
                        </li>
                        <li>
                            <a href="#">
                                <div class="user_img">
                                    <img src="${ctx}/resources/static/images/1.png" alt=""></div>
                                <div class="notification_desc">
                                    <p>Lorem ipsum dolor amet</p>
                                    <p>
                                        <span>1 hour ago</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li class="odd">
                            <a href="#">
                                <div class="user_img">
                                    <img src="${ctx}/resources/static/images/2.png" alt=""></div>
                                <div class="notification_desc">
                                    <p>Lorem ipsum dolor amet</p>
                                    <p>
                                        <span>1 hour ago</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="user_img">
                                    <img src="${ctx}/resources/static/images/3.png" alt=""></div>
                                <div class="notification_desc">
                                    <p>Lorem ipsum dolor amet</p>
                                    <p>
                                        <span>1 hour ago</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li>
                            <div class="notification_bottom">
                                <a href="#">See all messages</a></div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown head-dpdn">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i>
                            <img src="${ctx}/resources/static/images/book_03.png" /></i>
                        <span class="badge blue">3</span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="notification_header">
                                <h3>You have 3 new notification</h3></div>
                        </li>
                        <li>
                            <a href="#">
                                <div class="user_img">
                                    <img src="${ctx}/resources/static/images/2.png" alt=""></div>
                                <div class="notification_desc">
                                    <p>Lorem ipsum dolor amet</p>
                                    <p>
                                        <span>1 hour ago</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li class="odd">
                            <a href="#">
                                <div class="user_img">
                                    <img src="${ctx}/resources/static/images/1.png" alt=""></div>
                                <div class="notification_desc">
                                    <p>Lorem ipsum dolor amet</p>
                                    <p>
                                        <span>1 hour ago</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="user_img">
                                    <img src="${ctx}/resources/static/images/3.png" alt=""></div>
                                <div class="notification_desc">
                                    <p>Lorem ipsum dolor amet</p>
                                    <p>
                                        <span>1 hour ago</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li>
                            <div class="notification_bottom">
                                <a href="#">See all notifications</a></div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown head-dpdn">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i>
                            <img src="${ctx}/resources/static/images/text_message_03.png" /></i>
                        <span class="badge blue1">15</span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="notification_header">
                                <h3>You have 8 pending task</h3></div>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <span class="task-desc">Database update</span>
                                    <span class="percentage">40%</span>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="progress progress-striped active">
                                    <div class="bar yellow" style="width:40%;"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <span class="task-desc">Dashboard done</span>
                                    <span class="percentage">90%</span>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="progress progress-striped active">
                                    <div class="bar green" style="width:90%;"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <span class="task-desc">Mobile App</span>
                                    <span class="percentage">33%</span>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="progress progress-striped active">
                                    <div class="bar red" style="width: 33%;"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <span class="task-desc">Issues fixed</span>
                                    <span class="percentage">80%</span>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="progress progress-striped active">
                                    <div class="bar  blue" style="width: 80%;"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="notification_bottom">
                                <a href="#">See all pending tasks</a></div>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <!--notification menu end -->

        <div class="profile_details">
                <ul>
                <li class="dropdown profile_details_drop">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <div class="profile_img">
                        <span class="prfil-img" style="margin-top:15px;">
                          <img src="${ctx}/resources/static/images/member_03.png" /></span>
                            <div class="user-name">
                                <p style="color:#FFF;">欢迎，${userName}</p></div>
                            <i class="fa fa-angle-down lnr"></i>
                            <i class="fa fa-angle-up lnr"></i>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                    <ul class="dropdown-menu drp-mnu">
                        <li>
                            <a href="#">
                                <img src="${ctx}/resources/static/images/retrieve_password.png" alt=""><i class="fa fa-user"></i>修改密码
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="${ctx}/resources/static/images/about_our.png" alt=""><i class="fa fa-user"></i>关于我们
                            </a>
                        </li>
                        <li>
                            <a href="${ctx}/loginOut">
                                <img src="${ctx}/resources/static/images/logout.png" alt=""><i class="fa fa-sign-out"></i>退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>

<jsp:include page="include/menus.jsp" flush="true"></jsp:include>

<div class="main-content" style="overflow:hidden; background:#FFF; z-index:9; padding-left:225px;position:absolute; width:86%;">

    <div id="page_m" style="margin:75px 0px 30px 30px; overflow:hidden;">
        <div class="cont_txt">
            <div style="margin-right:10px;overflow:hidden; height:700px;">
                <iframe id="mainFrame" name="mainFrame" src="${ctx}/home/main" scrolling="yes" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
    <div class="footer">
        <div><p>版权所有@湖北恒信国通信息产业有限公司</p></div>
    </div>
</div>

</body>
</html>

<script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/resources/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/resources/static/js/jquery.nicescroll.js"></script>
<script src="${ctx}/resources/static/js/comming.js"></script>

<script src="${ctx}/resources/static/index.js"></script>

