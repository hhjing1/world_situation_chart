<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/china.js"></script>
<title>Insert title here</title>
</head>
<div id="main" style="height: 100%"></div>
<style>
        *{margin:0;padding:0}
        html,body{
            width:100%;
            height:100%;
        }
        #main{
              width:600px;
              height:450px;
              margin: 20px auto;
              border:1px solid #ddd;
          }
        /*默认长宽比0.75*/
    </style>
<body>

  
<script>
//初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

var province = "${province}";



$.get("province-json/"+ province +".json", function (geoJson) {

    myChart.hideLoading();

    echarts.registerMap(province, geoJson);

    myChart.setOption(option = {
        title: {
            text: province + '疫情地图',
            subtext : '',
            x : 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{b}<br/>{c} (确诊 / 人)'
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
            feature: {
                dataView: {readOnly: false},
                restore: {},
                saveAsImage: {}
            }
        },
        visualMap: {
            min: 0,
            max: 50000,
            text : [ '多', '少' ],//取值范围的文字
            realtime : false,
            calculable : true,
            inRange : {
                color : [ '#f5bba7', '#974236', ' #372a28' ]//取值范围的颜色
            },
            show:true//图注
        },
        series: [
            {
                name: province + '地区疫情情况',
                type: 'map',
                mapType: province, // 自定义扩展图表类型
                roam: false,//不开启缩放和平移
                label: {
                    show: true,
                    fontSize:'10',
                    color: 'rgba(0,0,0,0.7)'
                },
                itemStyle : {//外边框(底层地图)的一些属性
        			borderColor : 'rgba(0, 0, 0, 0.2)',
        			/* borderWidth :6,
        			shadowBlur:10,
        			shadowColor: 'rgba(0, 0, 0, 0.2)', */
        		
            	},
                                  
                emphasis: {
                   itemStyle: {
                	   
                    // 高亮时点的颜色
                	   areaColor: '#F3B329',//鼠标选择区域颜色
                       shadowOffsetX: 0,
                       shadowOffsetY: 0,
                       shadowBlur: 20,
                       borderWidth: 0,
                       shadowColor: 'rgba(0, 0 ,0, 0.5)'
                   },
                
                }
            }
        ]
    });
});



$.ajax({
    url:"proServlet?method=d",
    async:true,
    type:"POST",
    data:{"province":province},
    dataType:"json",
    success:function(data){
        alert(data.length);
        var mydata1 = new Array(0);
        for(var i=0;i<data.length;i++){
            var c = {};
            c["name"] = data[i].name+'市';
            c["value"] = data[i].value;
            mydata1.push(c);
        }
        
        myChart.setOption({        //加载数据图表
            series: [{
                data: mydata1
            }]
        });
    },
    error:function(){
        alert("请求失败");
    },
    
});




</script>


</body>
</html>