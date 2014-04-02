//使用时候需要给要增加验证的标签增加check属性
//当check="1"的时候,允许录入为空,如果输入数据就按reg属性绑定的正则表达进行验证.
//当check="2"的时候,就直接按照reg绑定的正则表达式进行验证.
//获得所有需要验证的标签
(function($){
	$(document).ready(function(){
		$('select[tip],select[check],input[tip],input[check],textarea[tip],textarea[check]').tooltip();
	});
})(jQuery);

(function($){
    $.fn.tooltip = function(options){
		var getthis = this;
        var opts = $.extend({}, $.fn.tooltip.defaults, options);
			//创建提示框
        $('body').append('<table id="tipTable" class="tableTip"><tr><td  class="leftImage"></td> <td class="contenImage" align="left"></td> <td class="rightImage"></td></tr></table>');
        $(document).mouseout(function(){$('#tipTable').hide();});
        this.each(function(){
            if($(this).attr('tip') != '')
            {
                $(this).focus(function(){//获得焦点时执行的函数
                    $('#tipTable').css({left:$.getLeft(this)+'px',top:$.getTop(this)+'px'});
                    $('.contenImage').html($(this).attr('tip'));
                    $('#tipTable').fadeIn("fast");
                },
                function(){//失去焦点时执行的函数
                    $('#tipTable').hide();
                });
            }
            if($(this).attr('check') != '')//如果存在check属性
            {
                $(this).focus(function()
				{	//当元素获得焦点时，移除提示错误效果
                    $(this).removeClass('tooltipinputerr');
                }).blur(function(){//失去焦点时
                    if($(this).attr('toupper') == 'true')
                    {
                        this.value = this.value.toUpperCase();
                    }
					if($(this).attr('check') != '')
					{
						if($(this).attr('check')=="1")//允许输入为空
						{
							if($(this).attr('value')==null)//输入为空
							{	//移除错误提示效果
								$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
							}else
							{	//输入不为空
								var thisReg = new RegExp($(this).attr('reg'));
								if(thisReg.test(this.value))
								{	//和正则表达式匹配上
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{	//没有和正则表达式匹配上
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
								}
							}
						}
						if($(this).attr('check')=="2")//不允许输入空值
						{
							var thisReg = new RegExp($(this).attr('reg'));
								if(thisReg.test(this.value))
								{	
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
								}
						}
					}
                });
            }
        });//遍历结束
        
        if(opts.onsubmit)
        {	
            $('form').submit(function (){
                var isSubmit = true;//是否提交标记置为true
                	getthis.each(function(){
					if($(this).attr('check')=="1")
						{
							if($(this).attr('value')==null)
							{
								$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
							}else
							{
								var thisReg = new RegExp($(this).attr('reg'));
								if(thisReg.test(this.value))
								{
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
								}
							}
							isSubmit = false;
						}
                    if($(this).attr('check')=="2")
						{
							var thisReg = new RegExp($(this).attr('reg'));
							//alert($(this).attr('reg'));
								if(thisReg.test(this.value))
								{
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
									isSubmit = false;
								}
						}
                });
                return isSubmit;
            });
        }
    };
    $.extend({
        getWidth : function(object) {
            return object.offsetWidth;
        },

        getLeft : function(object) {
            var go = object;
            var oParent,oLeft = go.offsetLeft;
            while(go.offsetParent!=null) {
                oParent = go.offsetParent;
                oLeft += oParent.offsetLeft;
                go = oParent;
            }
            return oLeft;
        },

        getTop : function(object) {
            var go = object;
            var oParent,oTop = go.offsetTop;
            while(go.offsetParent!=null) {
                oParent = go.offsetParent;
                oTop += oParent.offsetTop;
                go = oParent;
            }
            return oTop + $(object).height()+ 5;
        },

        onsubmit : true
    });
    $.fn.tooltip.defaults = { onsubmit: true };
})(jQuery);

//传入的标签ID组必须为"name1:name2:name3"中间用':'分隔.

function checkform(validatorString,reg){
	var validatorStrings="";
	if(validatorString!="")
	{
		//alert("-"+validatorString);
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg",reg);
		}
	}
}

//匹配手机和电话
function checkTell(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","(\\d{3}|\\d{4})-(\\d{7}|\\d{8})|(13|15|18)[0-9]{9}|\\d{10}|\\d{8}|\\d{7}|\\d{11}|\\d{12}");
		}
	}
}  

function checkDate(validatorString){
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg",/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/);
		}
	}
}
