define(function(require,exports,module){
	require('echarts.min.js');
	function area(earlyMap,alarmMap,dateMap){
	
	var myChart = echarts.init(document.getElementById('main'));
    var option = {
	title:{
		text:'塔吊报警数据统计',
		textStyle:{
			fontSize:16,			
		},
		x:'center' 
	},	
    tooltip: {
        triggerOn:'mousemove',
    },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['预警次数','报警次数'],
		bottom:'0',
		left:'45%'
    },
	grid: {
        left: '1%',
        right: '3%',
        bottom: '10%',
        containLabel: true
    },
    xAxis: [
        {
            type: 'category',
            data: [dateMap.date11,dateMap.date10,dateMap.date9,dateMap.date8,dateMap.date7,dateMap.date6,dateMap.date5,dateMap.date4,dateMap.date3,dateMap.date2,dateMap.date1,dateMap.date0]
        }
    ],
    yAxis: [
        {
            type: 'value',
            min: 0,
            max: 120
        }
    ],
    series: [
        {
            name:'预警次数',
            type:'bar',
			barWidth: '25',
            data:[earlyMap.earlyTwelve, earlyMap.earlyEleven, earlyMap.earlyTen, earlyMap.earlyNine, earlyMap.earlyEight, earlyMap.earlySeven, earlyMap.earlySix, earlyMap.earlyFive, earlyMap.earlyFour, earlyMap.earlyThree, earlyMap.earlyTwo, earlyMap.earlyOne],
			itemStyle:{
				  normal:{
					  color:'#4093e9'
				  }
            }
        },
        {
            name:'报警次数',
            type:'bar',
			barWidth: '25',
            data:[alarmMap.twelve, alarmMap.eleven, alarmMap.ten, alarmMap.nine, alarmMap.eight, alarmMap.seven, alarmMap.six, alarmMap.five, alarmMap.four, alarmMap.three, alarmMap.two, alarmMap.one],
			itemStyle:{
				  normal:{
					  color:'#ff0000'
				  }
            }
        }
      ]
    };

    myChart.setOption(option);
  
	}
	
	exports.area = area;
});