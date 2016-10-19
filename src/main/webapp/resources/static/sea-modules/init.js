define(function(require,exports,module){
	require('echarts.min.js');
	function tab(data){


        var data1 = [];
        var data2 = [];
        var sum=0;
        var color=new Array("#b84ed1","#465767","#3fc6f3","#ff625f","#febd01","#46d7c6","#d1d1d1");
        for(var i=0;i<data.length;i++){
            var name = data[i].name;
            var item1 = {
                    name:name,
                    textStyle:{
                        fontSize:14,
                        color:color[i]
                    },
                    icon:'image://../resources/static/img/icon'+(i+1)+'.png'
                };

            var count = data[i].count;
            sum+=count;
            var item2 =  {value:count, name:name,    itemStyle:{
                normal:{color:color[i]}
            }};
            data1.push(item1);
            data2.push(item2);
        }

	var myChart = echarts.init(document.getElementById('main'));
    var option = {
	title:{
		text:'工地实时总人数',
		subtext:sum,
		x:'center',
		y:'center'  
	},	
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    legend: {
		itemWidth:10,  
        itemHeight:20,
        orient: 'horizontal',
        bottom: '0',
		left:'100',
        data:data1
    },
    series: [
        {
            name:'访问来源',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: true,
                    position: 'top'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold',
                    },
                    shadowBlur: 10
                }
            },
            labelLine: {
                normal: {
                    show: true
                }
            },
            data:data2,
			itemStyle:{ 
            normal:{ 
                  label:{ 
                    show: true, 
                    formatter: '{b} : {c}' 
                  }, 
                  labelLine :{show:true} 
                }	
           } 
        }
    ]
};

myChart.setOption(option);
//window.onresize = myChart.resize;
//alert(option.title.subtext);
var Data = option.series[0].data;

var M =[];
for(i in Data){
   M.push(Data[i].value);
}
var toutxt = option.title.subtext;
//总数量
toutxt = eval(M.join('+'));

//window.onresize = Charts.curCharts.resize; 
/*myChart.on('hover', function(){ var opt = myChart.getOption(); opt.title.visible= false; myChart.setOption(opt); }).on('mouseout', function(){ var opt = myChart.getOption(); opt.title.visible= true; myChart.setOption(opt); });*/

            
	}
	exports.tab = tab;
});