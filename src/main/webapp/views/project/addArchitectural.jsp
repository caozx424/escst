<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="pager" uri="/pager-tags" %>
<span style="font-family:KaiTi_GB2312;font-size:12px;"><%@page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %></span>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${ctx}/resources/static/css/bootstrap.min.3.css" rel="stylesheet">
    <link href="${ctx}/resources/static/css/main.css" rel="stylesheet">
    <script src="${ctx}/resources/static/js/calendar.js"></script>
    <link href="${ctx}/resources/static/css/personEditor.css" rel="stylesheet">


<body>

<div class="cont_txt">
    <!--嵌套-->
    <p class="MUsers">项目维护录入</p>
    <div class="tab_head">
        <ul>
            <li>
                <a href="${ctx}/person/infoList">
                    <img src="${ctx}/resources/static/images/back_03.png"/>
                    <span>返回列表</span></a>
            </li>
            <li>
        </ul>
    </div>


    <!---->
    <div style="margin:10px 0px;" class="mangement">
        <form method="post" class="form-horizontal" id="add_style"
              action="${ctx}/person/editorData?id=${personListEntity.id}" role="form">
            <div class="row_lf">
                <%--<ul>--%>
                <li>
                    <label><i>*</i>姓名：</label>
                    <input type="text" id="name" name="name" value="${personListEntity.name}"/>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label><i>*</i>年龄：</label>
                    <input type="text" id="age" name="age" value="${personListEntity.age}"/>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label><i>*</i>政治面貌：</label>
                    <select id="zhengzhimmao" name="zhengzhimmao">
                        <option value="党员">党员</option>
                        <option value="群众">群众</option>
                        <option value="团员">团员</option>
                    </select>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label><i>*</i>毕业时间：</label>
                    <input type="text" id="biyeshijian" name="biyeshijian"
                           value="<fmt:formatDate  value="${personListEntity.biyeshijian}" pattern="yyyy-MM-dd" type="both"/>"
                           size="10" maxlength="10" onClick="new Calendar().show(this);" readonly/>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label><i>*</i>所属施工单位：</label>
                    <select>
                        <c:forEach items="${constructionEntities}" var="constructionEntitie">
                            <option value="${constructionEntitie.constructionname}">${constructionEntitie.constructionname}</option>
                        </c:forEach>
                    </select>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label>血型：</label>
                    <select id="xuexing" name="xuexing">
                        <option value="AB">AB</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="O">0</option>
                        <option value="其它">其它</option>
                    </select>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label><i>*</i>身份证号：</label>
                    <input type="text" id="idnumber" name="idnumber" value="${personListEntity.idnumber}"/>
                    <span class="inline-block"></span>
                </li>
                <li>
                    <label><i>*</i>手机：</label>
                    <input type="text" id="mobile" name="mobile" value="${personListEntity.mobile}"/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label><i>*</i>员工工号：</label>
                    <input type="text" id="numbr" name="numbr" value="${personListEntity.numbr}"/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label><i>*</i>出生日期：</label>
                    <input type="text" id="control_date6" name="birthday"
                           value="<fmt:formatDate  value="${personListEntity.birthday}" type="both" pattern="yyyy-MM-dd"/>"
                           size="10" maxlength="10" onClick="new Calendar().show(this);" readonly/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label><i>*</i>名族：</label>
                    <input type="text" id="mingzu" name="mingzu" value="${personListEntity.mingzu}"/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label>毕业院校：</label>
                    <input type="text" id="biyeyuanxiao" name="biyeyuanxiao" value="${personListEntity.biyeyuanxiao}"/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label><i>*</i>体重：</label>
                    <input type="text" id="tizhong" name="tizhong" value="${personListEntity.tizhong}"/>
                    <span class="inline-block">kg</span>
                </li>

                <li>
                    <label>健康状况：</label>
                    <select id="health" name="jiankangzhuangkuang">
                        <option value="一般">一般</option>
                        <option value="良好">良好</option>
                        <option value="优">优</option>
                    </select>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label><i>*</i>家庭成员：</label>
                    <input type="text" id="jiatcy" value="${personListEntity.jiatcy}" name="jiatcy"/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label><i>*</i>工龄：</label>
                    <input type="text" id="gongling" name="gongling" value="${personListEntity.gongling}"/>
                    <span class="inline-block"></span>
                </li>

                <li>
                    <label>邮箱：</label>
                    <input type="text" id="email" name="email" value="${personListEntity.email}"/>
                    <span class="inline-block"></span>
                </li>

                <li class="check_box">

                    <label>培训状况：</label>

                    <input type="checkbox"/>安全培训


                    <input type="checkbox"/>技能培训


                </li>
                </ul>
            </div>

            <div class="row_lf">
                <ul>
                    <li>
                        <label><i>*</i>性别：</label>
                        <select id="male" name="male">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label><i>*</i>籍贯：</label>
                        <input type="text" id="jiguan" name="jiguan" value="${personListEntity.jiguan}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label>文化程度：</label>
                        <select id="xueli" name="wenhuachengdu">
                            <option value="大专">小学</option>
                            <option value="本科">初中</option>
                            <option value="小学">高中</option>
                            <option value="初中">大专</option>
                            <option value="高中">本科</option>
                            <option value="硕士">硕士</option>
                            <option value="博士">博士</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label><i>*</i>身高：</label>
                        <input type="text" id="shengao" name="shengao" value="${personListEntity.shengao}"/>
                        <span class="inline-block">cm</span>
                    </li>
                    <li>
                        <fmt:formatDate value="${supervision.createDate}" pattern="yyyy-MM-dd"/>

                        <label><i>*</i>入职时间：</label>
                        <input type="text" id="control_date7" name="ruzhishijian"
                               value="<fmt:formatDate  value="${personListEntity.ruzhishijian}" type="both" pattern="yyyy-MM-dd"/>"
                               size="10" maxlength="10" onClick="new Calendar().show(this);" readonly/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label>婚姻状况：</label>
                        <select id="hunyzk" name="hunyzt">
                            <option value="已婚">已婚</option>
                            <option value="未婚">未婚</option>
                            <option value="离异">离异</option>
                            <option value="丧偶">丧偶</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label><i>*</i>户口所在地：</label>
                        <input type="text" id="hukou" name="hukou" value="${personListEntity.hukou}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label><i>*</i>紧急联系人：</label>
                        <input type="text" id="jinjilianxiren" name="jinjilianxiren"
                               value="${personListEntity.jinjilianxiren}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label>职称：</label>
                        <select id="zhicheng" name="zhicheng">
                            <option value="管理员">管理员</option>
                            <option value="总经理">总经理</option>
                            <option value="副总经理">副总经理</option>
                            <option value="项目经理">项目经理</option>
                            <option value="施工员">施工员</option>
                            <option value="预算员">预算员</option>
                            <option value="材料员">材料员</option>
                            <option value="质检员">质检员</option>
                            <option value="安全员">安全员</option>
                            <option value="办公室人员">办公室人员</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label><i>*</i>家庭地址：</label>
                        <input type="text" id="address" name="address" value="${personListEntity.address}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label><i>*</i>紧急联络电话：</label>
                        <input type="text" id="jinjilianxirendianhua" name="jinjilianxirendianhua"
                               value="${personListEntity.jinjilianxirendianhua}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label>工种：</label>
                        <select id="gongzhong" name="gongzhong">
                            <option value="钳工">钳工</option>
                            <option value="木工">木工</option>
                            <option value="泥工">泥工</option>
                            <option value="水电工">水电工</option>
                            <option value="钢筋工">钢筋工</option>
                            <option value="混凝土工">混凝土工</option>
                            <option value="工作人员">混凝土工</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>

                    <li>
                        <label>QQ号：</label>
                        <input type="text" id="qq" name="qq" value="${personListEntity.qq}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label>有无保险：</label>
                        <select id="baoxian" name="baoxian">
                            <option value="无保险">无保险</option>
                            <option value="安全险">安全险</option>
                            <option value="高空险">高空险</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>

                    <li>
                        <label><i>*</i>微信号：</label>
                        <input type="text" id="weixin" name="weixin" value="${personListEntity.weixin}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li>
                        <label>安全交底：</label>
                        <select id="anquanjiaodi" name="anquanjiaodi">
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                        <span class="inline-block"></span>
                    </li>

                    <li>
                        <label>其他培训：</label>
                        <input type="text" id="qitapeixun" name="qitapeixun" value="${personListEntity.qitapeixun}"/>
                        <span class="inline-block"></span>
                    </li>
                    <li class="check_button">

                        <label>资格证书：</label>

                        <em>数量：<b>0</b></em>


                        <button id="add_means">添加证书</button>


                    </li>

                </ul>
            </div>


            <div class="clear"></div>
            <div class="According">
                <ul>
                    <li>登记照:</li>
                    <li>
                        <div class="upload_img"></div>
                    </li>
                    <li>
                        <div class="fileinput-button">
                            <button>上传文件</button>
                            <span class="help-block">大小不能超过3M</span>
                        </div>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>

            <!--增加证书-->
            <div class="According certificate" id="create">
            </div>
            <!--增加证书-->
            <%--<div class="form-group">--%>
            <%--<div class="col-sm-offset-2 col-sm-10">--%>
            <%--<button type="submit" class="btn btn-primary">保存</button>--%>
            <%--<button type="button" class="btn btn-primary" onclick="history.back()" >取消</button>--%>
            <%--</div>--%>
            <%--</div>--%>


            <!--增加证书-->

            <!--
              <div id="creat_index">
               <ul>
                  <li>
                     <p><label><i>*</i>证书名称:</label><input type="text" /></p>
                     <p><label><i>*</i>证书号:</label><input type="text" /></p>
                  </li>
                  <li>证书图片:</li>
                  <li><div class="upload_img"></div></li>
                  <li>
                    <div class="fileinput-button">
                    <button>点击上传</button>
                    <span class="help-block">大小不能超过11111111</span>
                    </div>
                  </li>
                  <li>
                   <button id="del_create">删除</button>
                  </li>
                </ul>
                <div class="clear"></div>
                 </div>
                -->
    </div>
    <!--增加证书-->


    <div class="success_sumbit">
        <p>
            <button type="submit" class="btn btn-primary">保存</button>
            <button type="button" class="btn btn-primary" onclick="history.back()">取消</button>
        </p>
    </div>
    </form>
</div>


<!---->


</body>
<script src="${ctx}/resources/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/resources/static/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/static/js/jquery.nicescroll.js"></script>
<script src="${ctx}/resources/static/js/comming.js"></script>

<script>
    $(function () {
        $("#xueli option[value=${personListEntity.wenhuachengdu}]").attr("selected", true);
        $("#zhengzhimmao option[value=${personListEntity.zhengzhimmao}]").attr("selected", true);
        $("#xuexing option[value=${personListEntity.xuexing}]").attr("selected", true);
        $("#health option[value=${personListEntity.jiankangzhuangkuang}]").attr("selected", true);
        $("#male option[value=${personListEntity.male}]").attr("selected", true);
        $("#hunyzk option[value=${personListEntity.hunyzt}]").attr("selected", true);
        $("#gongzhong option[value=${personListEntity.gongzhong}]").attr("selected", true);
        $("#baoxian option[value=${personListEntity.baoxian}]").attr("selected", true);
        $("#zhicheng option[value=${personListEntity.zhicheng}]").attr("selected", true);
    });
</script>
</html>
