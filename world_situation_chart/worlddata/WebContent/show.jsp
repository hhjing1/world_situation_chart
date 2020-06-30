<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.bean.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
 <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
 <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
    #myEcharts {
      width: 47%;
      height: 720px;
      border: solid 1px black;
      margin: 0 50,0,200;
      float:left
    }
    #myEcharts2{
      width: 320px;
      height: 720px;
      border: solid 1px black;
      margin: 0,1300,0,0;
      float:left;
    }
    #myEcharts3{
      width: 305px;
      height: 720px;
      border: solid 1px black;
      margin: 0,1300,0,0;
      float:right;
    }
    #zuo1{
    width: 305px;
      height: 500px;
      border: solid 1px black;
      
      float:right;
    }
    #zuo2{
     width: 550px;
      height: 200px;
      border: solid 1px black;

      float:left;
    }
  </style>
  </style>
  <!-- 引入 echarts.js -->
  <script src="https://www.echartsjs.com/examples/vendors/echarts/echarts.min.js?_v_=1578305236132"></script>
  <!--引入中国的地图数据js文件，引入后会自动注册地图名字和数据-->
  <script src="https://www.echartsjs.com/examples/vendors/echarts/map/js/world.js?_v_=1584687926098" ></script>
    <meta charset="utf-8">
    <title>全球疫情图</title>
    <!-- 引入 echarts.js -->
     <script src="${pageContext.request.contextPath}/resource/echarts.js"></script>
</head>
<body>
  <!--为echarts准备一个dom容器-->
  <div id="myEcharts2" style="overflow-y:scroll">
  <table class="table table-hover table-striped table-bordered table-sm" id="resultshow">
    <tr><td colspan="3"align="center"><b>全球总病情</b></tr>
			<tr>		
				<th><font color="red">日期</th>
				<th><font color="red">国家</th>
				<th><font color="red">总病例</th>
				

			</tr>
			<%ArrayList<Bean> list=(ArrayList<Bean>)request.getAttribute("list1");%>
			<c:forEach var="l" items="<%=list %>" varStatus="i">
			
				<tr>
					
					<td><font color="red">${l.getDate()}</td>
					<td><font size="3" color="green">${l.getProvince()}</td>
					<td><font size="3" color="green">${l.getConfirmed_num()}</td>
					
					
				</tr>
			</c:forEach>
		</table>
  </div>
  <div id="myEcharts"></div>
  <div id="myEcharts3">
  <div id="zuo1" style="overflow-y:scroll">
  <table class="table table-hover table-striped table-bordered table-sm" id="resultshow">
                 <tr><td colspan="3"align="center"><b>全球详细病情</b></tr>
			<tr>
				<th><font color="red">国家</th>
				<th><font color="red">死亡人数</th>
				<th><font color="red">治愈人数</th>

			</tr>
			<%ArrayList<Bean> list2=(ArrayList<Bean>)request.getAttribute("list1");%>
			<c:forEach var="l" items="<%=list2 %>" varStatus="i">
			
				<tr>
					
					
					<td ><font color="red">${l.getProvince()}</td>
					
					<td ><font size="3" color="green">${l.getDead_num()}</td>
					<td><font size="3" color="green">${l.getCured_num()}</td>
					
				</tr>
			</c:forEach>
		</table>
  </div>
  <div id="zuo2">
  
  <script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart2 = echarts.init(document.getElementById('zuo2'));

    var arr = new Array();
    var index = 0;
    <c:forEach items="<%=list2 %>" var="goods">
        arr[index++] = ${goods.getConfirmed_num()};
    </c:forEach>

    
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '全球疫情统计'
        },
        tooltip: {
            show: true
        },
        legend: {
            data:['患者数']
        },
        xAxis : [
            {
                type : 'category',
                data : [
                    <c:forEach items="<%=list2 %>" var="g">
                    ["${g.getProvince()}"],
                    </c:forEach>
                ]
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'患者数',
                type:'bar',
                data: arr
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option);
</script>
  </div>
  </div>
  <script>
  window.onload=function(){
	  $.ajax({//()里面是JSON数据，外层要加上{}。
	        url:"echarts",//处理页面地址，表示ajax要用哪个页面处理
	        data:{code:"n001"},//传递到处理页面的值，也是JSON数据，要用{}。如果传2个值就在{}里面加逗号，再写另外1个值。
	        type:"POST",//传值方式，一般用POST方式，注意POST要大写。
	        dataType:"JSON",//返回值的类型。1.TEXT文本，字符串。2.JSON数据 3.XML可扩展标记语言，主要用在数据传递。
	        async:true,
	        success:function(data){//表示处理成功之后做什么,后面跟一个匿名函数。回调函数，表示处理页面处理完数据以后执行这个函数。data表示处理页面返回的值，用形参接收。
	        	 var mydata = new Array(0);
	          
	             for(var i=0;i<data.length;i++){
	             	var d = {
	                         
	                 };
	             	d["name"] = data[i].Province;//.substring(0, 2);
	             	
	                 d["value"] = data[i].Confirmed_num;
	                 d["Yisi_num"] = data[i].Yisi_num;
	                 d["Cured_num"] = data[i].Cured_num;
	                 d["Dead_num"] = data[i].Dead_num;
	                 mydata.push(d);
	             }
	        	   //初始化echarts实例
	            var myChart = echarts.init(document.getElementById('myEcharts'));
	            // 指定图表的配置项和数据
	          var  option = {
	            		tooltip : {  
	                        trigger: 'item',
	                        formatter : function(params) {
	                            return params.name + '<br/>' + '确诊人数 : '
	                                    + params.value + '<br/>' + '死亡人数 : '
	                                    + params['data'].Dead_num + '<br/>' + '治愈人数 : '
	                                    + params['data'].Cured_num + '<br/>'+ '疑似患者人数 : '
	                                    + params['data'].Yisi_num;
	                        }//数据格式化
	                    },  
	              title: {
	                text: '世界疫情图',
	                left: 'center'
	              },
	            
	              legend: {
	                orient: 'vertical',
	                left: 'left',
	                data: ['世界疫情图']
	              },
	              visualMap: {
	                type: 'piecewise',
	                pieces: [
	                	{ min: 70000, max: 50000000, label: '确诊70000人以上', color: 'red' },
	                  { min: 10000, max: 69999, label: '确诊10000-69999人', color: 'blue' },
	                  { min: 5000, max: 9999, label: '确诊5000-9999人', color: 'purple' },
	                  { min: 1500, max: 4999, label: '确诊1500-4999人', color: 'yellow' },
	                  { min: 500, max: 1499, label: '确诊500-1499人', color: 'gold' },
	                  { min: 0, max: 499, label: '确诊1-499人', color: 'green' },
	                ],
	                color: ['#E0022B', '#E09107', '#A3E00B']
	              },
	              toolbox: {
	                show: true,
	                orient: 'vertical',
	                left: 'right',
	                top: 'center',
	                feature: {
	                  mark: { show: true },
	                  dataView: { show: true, readOnly: false },
	                  restore: { show: true },
	                  saveAsImage: { show: true }
	                }
	              },
	              roamController: {
	                show: true,
	                left: 'right',
	                mapTypeControl: {
	                  'world': true
	                }
	              },
	              series: [
	                {
	                  name: '确诊数',
	                  type: 'map',
	                  mapType: 'world',
	                
	                  nameMap : {"Canada": "加拿大",
	                	      "Turkmenistan": "土库曼斯坦",
	                	      "Saint Helena": "圣赫勒拿",
	                	      "Lao PDR": "老挝",
	                	      "Lithuania": "立陶宛",
	                	      "Cambodia": "柬埔寨",
	                	      "Ethiopia": "埃塞俄比亚",
	                	      "Faeroe Is.": "法罗群岛",
	                	      "Swaziland": "斯威士兰",
	                	      "Palestine": "巴勒斯坦",
	                	      "Belize": "伯利兹",
	                	      "Argentina": "阿根廷",
	                	      "Bolivia": "玻利维亚",
	                	      "Cameroon": "喀麦隆",
	                	      "Burkina Faso": "布基纳法索",
	                	      "Aland": "奥兰群岛",
	                	      "Bahrain": "巴林",
	                	      "Saudi Arabia": "沙特阿拉伯",
	                	      "Fr. Polynesia": "法属波利尼西亚",
	                	      "Cape Verde": "佛得角",
	                	      "W. Sahara": "西撒哈拉",
	                	      "Slovenia": "斯洛文尼亚",
	                	      "Guatemala": "危地马拉",
	                	      "Guinea": "几内亚",
	                	      "Dem. Rep. Congo": "刚果（金）",
	                	      "Germany": "德国",
	                	      "Spain": "西班牙",
	                	      "Liberia": "利比里亚",
	                	      "Netherlands": "荷兰",
	                	      "Jamaica": "牙买加",
	                	      "Solomon Is.": "所罗门群岛",
	                	      "Oman": "阿曼",
	                	      "Tanzania": "坦桑尼亚",
	                	      "Costa Rica": "哥斯达黎加",
	                	      "Isle of Man": "曼岛",
	                	      "Gabon": "加蓬",
	                	      "Niue": "纽埃",
	                	      "Bahamas": "巴哈马",
	                	      "New Zealand": "新西兰",
	                	      "Yemen": "也门",
	                	      "Jersey": "泽西岛",
	                	      "Pakistan": "巴基斯坦",
	                	      "Albania": "阿尔巴尼亚",
	                	      "Samoa": "萨摩亚",
	                	      "Czech Rep.": "捷克",
	                	      "United Arab Emirates": "阿拉伯联合酋长国",
	                	      "Guam": "关岛",
	                	      "India": "印度",
	                	      "Azerbaijan": "阿塞拜疆",
	                	      "N. Mariana Is.": "北马里亚纳群岛",
	                	      "Lesotho": "莱索托",
	                	      "Kenya": "肯尼亚",
	                	      "Belarus": "白俄罗斯",
	                	      "Tajikistan": "塔吉克斯坦",
	                	      "Turkey": "土耳其",
	                	      "Afghanistan": "阿富汗",
	                	      "Bangladesh": "孟加拉国",
	                	      "Mauritania": "毛里塔尼亚",
	                	      "Dem. Rep. Korea": "朝鲜",
	                	      "Saint Lucia": "圣卢西亚",
	                	      "Br. Indian Ocean Ter.": "英属印度洋领地",
	                	      "Mongolia": "蒙古",
	                	      "France": "法国",
	                	      "Cura?ao": "库拉索岛",
	                	      "S. Sudan": "南苏丹",
	                	      "Rwanda": "卢旺达",
	                	      "Slovakia": "斯洛伐克",
	                	      "Somalia": "索马里",
	                	      "Peru": "秘鲁",
	                	      "Vanuatu": "瓦努阿图",
	                	      "Norway": "挪威",
	                	      "Malawi": "马拉维",
	                	      "Benin": "贝宁",
	                	      "St. Vin. and Gren.": "圣文森特和格林纳丁斯",
	                	      "Korea": "韩国",
	                	      "Singapore": "新加坡",
	                	      "Montenegro": "黑山共和国",
	                	      "Cayman Is.": "开曼群岛",
	                	      "Togo": "多哥",
	                	      "China": "中国",
	                	      "Heard I. and McDonald Is.": "赫德岛和麦克唐纳群岛",
	                	      "Armenia": "亚美尼亚",
	                	      "Falkland Is.": "马尔维纳斯群岛（福克兰）",
	                	      "Ukraine": "乌克兰",
	                	      "Ghana": "加纳",
	                	      "Tonga": "汤加",
	                	      "Finland": "芬兰",
	                	      "Libya": "利比亚",
	                	      "Dominican Rep.": "多米尼加",
	                	      "Indonesia": "印度尼西亚",
	                	      "Mauritius": "毛里求斯",
	                	      "Eq. Guinea": "赤道几内亚",
	                	      "Sweden": "瑞典",
	                	      "Vietnam": "越南",
	                	      "Mali": "马里",
	                	      "Russia": "俄罗斯",
	                	      "Bulgaria": "保加利亚",
	                	      "United States": "美国",
	                	      "Romania": "罗马尼亚",
	                	      "Angola": "安哥拉",
	                	      "Chad": "乍得",
	                	      "South Africa": "南非",
	                	      "Fiji": "斐济",
	                	      "Liechtenstein": "列支敦士登",
	                	      "Malaysia": "马来西亚",
	                	      "Austria": "奥地利",
	                	      "Mozambique": "莫桑比克",
	                	      "Uganda": "乌干达",
	                	      "Japan": "日本",
	                	      "Niger": "尼日尔",
	                	      "Brazil": "巴西",
	                	      "Kuwait": "科威特",
	                	      "Panama": "巴拿马",
	                	      "Guyana": "圭亚那",
	                	      "Madagascar": "马达加斯加",
	                	      "Luxembourg": "卢森堡",
	                	      "American Samoa": "美属萨摩亚",
	                	      "Andorra": "安道尔",
	                	      "Ireland": "爱尔兰",
	                	      "Italy": "意大利",
	                	      "Nigeria": "尼日利亚",
	                	      "Turks and Caicos Is.": "特克斯和凯科斯群岛",
	                	      "Ecuador": "厄瓜多尔",
	                	      "U.S. Virgin Is.": "美属维尔京群岛",
	                	      "Brunei": "文莱",
	                	      "Australia": "澳大利亚",
	                	      "Iran": "伊朗",
	                	      "Algeria": "阿尔及利亚",
	                	      "El Salvador": "萨尔瓦多",
	                	      "C?te d'Ivoire": "科特迪瓦",
	                	      "Chile": "智利",
	                	      "Puerto Rico": "波多黎各",
	                	      "Belgium": "比利时",
	                	      "Thailand": "泰国",
	                	      "Haiti": "海地",
	                	      "Iraq": "伊拉克",
	                	      "S?o Tomé and Principe": "圣多美和普林西比",
	                	      "Sierra Leone": "塞拉利昂",
	                	      "Georgia": "格鲁吉亚",
	                	      "Denmark": "丹麦",
	                	      "Philippines": "菲律宾",
	                	      "S. Geo. and S. Sandw. Is.": "南乔治亚岛和南桑威奇群岛",
	                	      "Moldova": "摩尔多瓦",
	                	      "Morocco": "摩洛哥",
	                	      "Namibia": "纳米比亚",
	                	      "Malta": "马耳他",
	                	      "Guinea-Bissau": "几内亚比绍",
	                	      "Kiribati": "基里巴斯",
	                	      "Switzerland": "瑞士",
	                	      "Grenada": "格林纳达",
	                	      "Seychelles": "塞舌尔",
	                	      "Portugal": "葡萄牙",
	                	      "Estonia": "爱沙尼亚",
	                	      "Uruguay": "乌拉圭",
	                	      "Antigua and Barb.": "安提瓜和巴布达",
	                	      "Lebanon": "黎巴嫩",
	                	      "Uzbekistan": "乌兹别克斯坦",
	                	      "Tunisia": "突尼斯",
	                	      "Djibouti": "吉布提",
	                	      "Greenland": "格陵兰",
	                	      "Timor-Leste": "东帝汶",
	                	      "Dominica": "多米尼克",
	                	      "Colombia": "哥伦比亚",
	                	      "Burundi": "布隆迪",
	                	      "Bosnia and Herz.": "波斯尼亚和黑塞哥维那",
	                	      "Cyprus": "塞浦路斯",
	                	      "Barbados": "巴巴多斯",
	                	      "Qatar": "卡塔尔",
	                	      "Palau": "帕劳",
	                	      "Bhutan": "不丹",
	                	      "Sudan": "苏丹",
	                	      "Nepal": "尼泊尔",
	                	      "Micronesia": "密克罗尼西亚",
	                	      "Bermuda": "百慕大",
	                	      "Suriname": "苏里南",
	                	      "Venezuela": "委内瑞拉",
	                	      "Israel": "以色列",
	                	      "St. Pierre and Miquelon": "圣皮埃尔和密克隆群岛",
	                	      "Central African Rep.": "中非",
	                	      "Iceland": "冰岛",
	                	      "Zambia": "赞比亚",
	                	      "Senegal": "塞内加尔",
	                	      "Papua New Guinea": "巴布亚新几内亚",
	                	      "Trinidad and Tobago": "特立尼达和多巴哥",
	                	      "Zimbabwe": "津巴布韦",
	                	      "Jordan": "约旦",
	                	      "Gambia": "冈比亚",
	                	      "Kazakhstan": "哈萨克斯坦",
	                	      "Poland": "波兰",
	                	      "Eritrea": "厄立特里亚",
	                	      "Kyrgyzstan": "吉尔吉斯斯坦",
	                	      "Montserrat": "蒙特塞拉特",
	                	      "New Caledonia": "新喀里多尼亚",
	                	      "Macedonia": "马其顿",
	                	      "Paraguay": "巴拉圭",
	                	      "Latvia": "拉脱维亚",
	                	      "Hungary": "匈牙利",
	                	      "Syria": "叙利亚",
	                	      "Honduras": "洪都拉斯",
	                	      "Myanmar": "缅甸",
	                	      "Mexico": "墨西哥",
	                	      "Egypt": "埃及",
	                	      "Nicaragua": "尼加拉瓜",
	                	      "Cuba": "古巴",
	                	      "Serbia": "塞尔维亚",
	                	      "Comoros": "科摩罗",
	                	      "United Kingdom": "英国",
	                	      "Fr. S. Antarctic Lands": "南极洲",
	                	      "Congo": "刚果（布）",
	                	      "Greece": "希腊",
	                	      "Sri Lanka": "斯里兰卡",
	                	      "Croatia": "克罗地亚",
	                	      "Botswana": "博茨瓦纳",
	                	      "Siachen Glacier": "锡亚琴冰川地区"
	                	 
	                		
	                  },
	                  roam: false,
	                  label: {
	                    show: false,
	                    color: 'blue'//'rgb(249, 249, 249)'
	                  },
	                  data: mydata  
	            }
	                ]
	            };
	         
	            //使用指定的配置项和数据显示图表
	            myChart.setOption(option);
	           /* myChart.on('click', function (params) {
	            	alert(params.name);
	            	var city_name2=params.name+"省";
	            	 var url = "lianxi3?city_name="+ params.name+"&city_name2="+city_name2;
	                window.location.href =url;
	            });*/
	        	
	            },
	        error:function(){//处理页面出错以后执行的函数。
	        
	            }        
	        });
  }
  
  
  
  
  
 

</script>
</body>
</html>