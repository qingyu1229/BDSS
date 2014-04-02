
function statistics(id,permission){
	
	   $("#t_date").html("");
	   $("#t_tcount").html("");
	   $("#t_ccount").html("");
	   $("#t_crate").html("");
	   $("#Acount").html("");
	   $("#Bcount").html("");
	   $("#Ccount").html("");
	   $("#Dcount").html(""); 
	
	var date=$("#date").val();
	$.ajax({
		beforeSend:function(xh){
			if(date=="")
			{
				alert("��ѡ�����ڷ�Χ��");
				return false;
			}else{
				 return true;
			}
		},
       type: "post",
       url:'statistics',
       data:{
    	   	u_id:id,
    	   	permission:permission,
    	   	date:date
   		}
		,timeout:3000,
         cache: false,  
         async:false,
         error:function(msg){
    	 alert("error:"+msg);
       },
       success: function(data){
    	   if(data.result=="success"){
    		   if(data.t_count==0){
    			   alert("��Ǹ��û�в�ѯ����Ӧ�����ݣ�");
    		   }else{
    	   $("#t_date").html(date);
    	   $("#t_tcount").html(data.t_count);
    	   $("#t_ccount").html(data.acc_count);
    	   $("#t_crate").html(data.rate+"%");
    	   $("#Acount").html(data.Acount);
    	   $("#Bcount").html(data.Bcount);
    	   $("#Ccount").html(data.Ccount);
    	   $("#Dcount").html(data.Dcount);
    	   }}
    	   drawChart(data.Acount,data.Bcount,data.Ccount,data.Dcount);
    	}
       });
}

function drawChart(a,b,c,d){
	$("#chart").html("");
	$.jqplot.config.enablePlugins = true;
    var s1 = [a, b, c, d];
    var ticks = ['A������', 'B������', 'C������', 'D������'];
    plot1 = $.jqplot('chart', [s1], {
    	title: '��������ͻ���Ϣͳ�Ʊ�',
        animate: !$.jqplot.use_excanvas,
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            pointLabels: { show: true }
        },
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            },
           yaxis: {
            label: '��¼��'
          }
        },
        highlighter: {show: false}
    });
}
