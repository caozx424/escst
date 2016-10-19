<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/27
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <div class="chart_main">
        <!--图表区-->
        <div id="main" style="width:900px;height:490px; margin:0 auto;"></div>
        <script>
            $(function(){
                $.ajax({
                    url:"${ctx}/person/number",

                    dataType:"text",
                    type:"post",
                    success:function(data){
                        var data = eval("("+data+")");

                        seajs.use('${ctx}/resources/static/sea-modules/init.js',function(ex){
                            ex.tab(data);
                        });
                    },
                    error:function(){}

                })
            })

        </script>

        <!--图表区-->
    </div>
</head>
<body>

</body>
</html>
