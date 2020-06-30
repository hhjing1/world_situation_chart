<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 100%">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<base>
<title>疫情地图</title>
<script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/china.js"></script>
<script type="text/javascript" src="province-json"></script>
</head>

<body style="height: 100%; margin: 0">
    <div class="row" style="background-color: silver; height: 50px;text-align:center;line-height: 50px">
                               查询的日期 <input type="text" name="time" id="time" placeholder="yyyy-MM-dd hh:mm:ss"> 
                   <input type="button" value="查询" onclick="tu()">
    </div>
    <div id="main" style="height: 100%"></div>
</body>
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
<script type="text/javascript">
    function randomData() {
        return Math.round(Math.random() * 500);
    }
    var dt;
    var mydata1 = new Array(0);
    function tu() {
        time = $("#time").val();
        //alert(time.substring(0, 2));
        $.ajax({
            url : "InfoServlet",//处理页面地址，表示ajax要用哪个页面处理
            async : true,
            type : "POST",//传值方式
            data : {
                "time" : time
            },
            success : function(data) {
                dt = data;
                for (var i = 0; i < 33; i++) {
                    var d = {
                        
                    };
                    
                    d["name"] = dt[i].province;//.substring(0, 2);
                    d["value"] = dt[i].confirmed_num;
                    d["yisi_num"] = dt[i].yisi_num;
                    d["cured_num"] = dt[i].cured_num;
                    d["dead_num"] = dt[i].dead_num;
                    mydata1.push(d);
                }
                
                //var mdata = JSON.stringify(mydata1);
                var optionMap = {
                    backgroundColor : '#FFFFFF',
                    title : {
                        text : '疫情地图',
                        subtext : '',
                        x : 'center'
                    },
                    tooltip : {
                        formatter : function(params) {
                            return params.name + '<br/>' + '确诊人数 : '
                                    + params.value + '<br/>' + '死亡人数 : '
                                    + params['data'].dead_num + '<br/>' + '治愈人数 : '
                                    + params['data'].cured_num;
                        }//数据格式化
                    },

                    //左侧小导航图标
                     visualMap : {
                        min : 0,
                        max : 35000,
                        text : [ '多', '少' ],//取值范围的文字
                        realtime : false,
                        calculable : true,
                        inRange : {
                            color : [ '#f5bba7', '#974236', ' #372a28' ]//取值范围的颜色
                        },
                        show:true//图注
                    },

                    //配置属性
                    series : [ {
                        type : 'map',
                        mapType : 'china',
                        roam: false,//不开启缩放和平移
                        zoom:1.23,//视角缩放比例
                        
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
                        
                        },
                        
                        data : mydata1,
                        nameMap : {

                            '南海诸岛' : '南海诸岛',
                            '北京' : '北京市',
                            '天津' : '天津市',
                            '上海' : '上海市',
                            '重庆' : '重庆市',
                            '河北' : '河北省',
                            '河南' : '河南省',
                            '云南' : '云南省',
                            '辽宁' : '辽宁省',
                            '黑龙江' : '黑龙江省',
                            '湖南' : '湖南省',
                            '安徽' : '安徽省',
                            '山东' : '山东省',
                            '新疆' : '新疆维吾尔自治区',
                            '江苏' : '江苏省',
                            '浙江' : '浙江省',
                            '江西' : '江西省',
                            '湖北' : '湖北省',
                            '广西' : '广西壮族自治区',
                            '甘肃' : '甘肃省',
                            '山西' : '山西省',
                            '内蒙古' : "内蒙古自治区",
                            '陕西' : '陕西省',
                            '吉林' : '吉林省',
                            '福建' : '福建省',
                            '贵州' : '贵州省',
                            '广东' : '广东省',
                            '青海' : '青海省',
                            '西藏' : '西藏自治区',
                            '四川' : '四川省',
                            '宁夏' : '宁夏回族自治区',
                            '海南' : '海南省',
                            '台湾' : '台湾',
                            '香港' : '香港',
                            '澳门' : '澳门'
                        }

                    } ]
                };
                //初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                myChart.on('click', function (params) {
                	alert(params.name);
                    /* var url = "servlet2?province=" + params.name; */
                    var url = "proServlet?method=city&province=" + params.name+"&time="+time;
                    window.location.href = url;
                	/* alert(params.name +"\n" 
                			+ '确诊人数 : '+ params.value  +"\n" 
                			+ '死亡人数 : '+ params['data'].dead_num  +"\n" 
                			+ '治愈人数 : '+ params['data'].cured_num  +"\n" 
                			+ '疑似患者人数 : '+ params['data'].yisi_num); */
                			
                });
                //使用制定的配置项和数据显示图表
                myChart.setOption(optionMap);
            },
            error : function() {
                alert("请求失败");
            },
            dataType : "json"
        });
    }
</script>
</html>