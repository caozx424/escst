
define(function(require,exports,module){
	require('echarts.min.js');
	function Crane(data){

        var hzjd = {name:'回转角度',type:'line',data:''};//回转角度
        var fd = { name:'幅度',type:'line',data:''}; //幅度
        var dggd = { name:'吊钩高度',type:'line',data:''};//吊钩高度
        var dz = { name:'吊重',type:'line',data:''}; //吊重
        var aqdz = { name:'安全吊重',type:'line',data:''};//安全吊重
        var ljbfb = { name:'力矩百分比',type:'line',data:''};//力矩百分比
        var fs = { name:'风速',type:'line',data:''};//风速
        var qj = { name:'倾角',type:'line',data:''};//倾角
        var dsbl = { name:'吊绳倍率',type:'line',data:''};//吊绳倍率

        var hzjd_data = [];
        var fd_data = [];
        var dggd_data = [];
        var dz_data = [];
        var aqdz_data = [];
        var ljbfb_data = [];
        var fs_data = [];
        var qj_data = [];
        var dsbl_data = [];

        var time_data = [];

        for(var i=data.length-1;i>=0;i--){
            var angle = data[i].angle;
            var radius = data[i].radius;
            var height = data[i].height;
            var tdload = data[i].tdload;
            var safeload = data[i].safeload;
            var tdpercent = data[i].tdpercent;
            var windspeed = data[i].windspeed;
            var obliquity = data[i].obliquity;
            var fall = data[i].fall;
            var createdatestr = data[i].createdatestr;
            hzjd_data.push(angle);
            fd_data.push(radius);
            dggd_data.push(height);
            dz_data.push(tdload);
            aqdz_data.push(safeload);
            ljbfb_data.push(tdpercent);
            fs_data.push(windspeed);
            qj_data.push(obliquity);
            dsbl_data.push(fall);

            time_data.push(createdatestr);
        }

        hzjd.data = hzjd_data;
        fd.data = fd_data;
        dggd.data = dggd_data;
        dz.data = dz_data;
        aqdz.data = aqdz_data;
        ljbfb.data = ljbfb_data;
        fs.data = fs_data;
        qj.data = qj_data;
        dsbl.data = dsbl_data;

        //求数据最大值
        var yAxis_max_array = [];
        var hzjd_data_max = Math.max.apply(Math,hzjd_data);
        var fd_data_max = Math.max.apply(Math,fd_data);
        var dggd_data_max = Math.max.apply(Math,dggd_data);
        var dz_data_max = Math.max.apply(Math,dz_data);
        var aqdz_data_max = Math.max.apply(Math,aqdz_data);
        var ljbfb_data_max = Math.max.apply(Math,ljbfb_data);
        var fs_data_max = Math.max.apply(Math,fs_data);
        var qj_data_max = Math.max.apply(Math,qj_data);
        var dsbl_data_max = Math.max.apply(Math,dsbl_data);
        yAxis_max_array.push(hzjd_data_max);
        yAxis_max_array.push(fd_data_max);
        yAxis_max_array.push(dggd_data_max);
        yAxis_max_array.push(dz_data_max);
        yAxis_max_array.push(aqdz_data_max);
        yAxis_max_array.push(ljbfb_data_max);
        yAxis_max_array.push(fs_data_max);
        yAxis_max_array.push(qj_data_max);
        yAxis_max_array.push(dsbl_data_max);
        var yAxis_max = Math.max.apply(Math,yAxis_max_array);

	var myChart = echarts.init(document.getElementById('main'));
    var option = {	
    tooltip: {
        trigger: 'axis'
    },
    grid: {
        bottom:'5%',
        containLabel: true
    },
	legend: {
        data:['回转角度','幅度','吊钩高度','吊重','安全吊重','力矩百分比','风速','倾角','吊绳倍率'],
		bottom:'0',
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: time_data
    },
    yAxis: {
        type: 'value',
        min: 0,
        max: yAxis_max
    },
    series: [hzjd,fd,dggd,dz,aqdz,ljbfb,fs,qj,dsbl]
    };

    myChart.setOption(option);
  
	}
	
	exports.Crane= Crane;
});