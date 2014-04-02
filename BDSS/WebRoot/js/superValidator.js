//ʹ��ʱ����Ҫ��Ҫ������֤�ı�ǩ����check����
//��check="1"��ʱ��,����¼��Ϊ��,����������ݾͰ�reg���԰󶨵������������֤.
//��check="2"��ʱ��,��ֱ�Ӱ���reg�󶨵�������ʽ������֤.
//���������Ҫ��֤�ı�ǩ
(function($){
	$(document).ready(function(){
		$('select[tip],select[check],input[tip],input[check],textarea[tip],textarea[check]').tooltip();
	});
})(jQuery);

(function($){
    $.fn.tooltip = function(options){
		var getthis = this;
        var opts = $.extend({}, $.fn.tooltip.defaults, options);
			//������ʾ��
        $('body').append('<table id="tipTable" class="tableTip"><tr><td  class="leftImage"></td> <td class="contenImage" align="left"></td> <td class="rightImage"></td></tr></table>');
        $(document).mouseout(function(){$('#tipTable').hide();});
        this.each(function(){
            if($(this).attr('tip') != '')
            {
                $(this).focus(function(){//��ý���ʱִ�еĺ���
                    $('#tipTable').css({left:$.getLeft(this)+'px',top:$.getTop(this)+'px'});
                    $('.contenImage').html($(this).attr('tip'));
                    $('#tipTable').fadeIn("fast");
                },
                function(){//ʧȥ����ʱִ�еĺ���
                    $('#tipTable').hide();
                });
            }
            if($(this).attr('check') != '')//�������check����
            {
                $(this).focus(function()
				{	//��Ԫ�ػ�ý���ʱ���Ƴ���ʾ����Ч��
                    $(this).removeClass('tooltipinputerr');
                }).blur(function(){//ʧȥ����ʱ
                    if($(this).attr('toupper') == 'true')
                    {
                        this.value = this.value.toUpperCase();
                    }
					if($(this).attr('check') != '')
					{
						if($(this).attr('check')=="1")//��������Ϊ��
						{
							if($(this).attr('value')==null)//����Ϊ��
							{	//�Ƴ�������ʾЧ��
								$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
							}else
							{	//���벻Ϊ��
								var thisReg = new RegExp($(this).attr('reg'));
								if(thisReg.test(this.value))
								{	//��������ʽƥ����
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{	//û�к�������ʽƥ����
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
								}
							}
						}
						if($(this).attr('check')=="2")//�����������ֵ
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
        });//��������
        
        if(opts.onsubmit)
        {	
            $('form').submit(function (){
                var isSubmit = true;//�Ƿ��ύ�����Ϊtrue
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

//����ı�ǩID�����Ϊ"name1:name2:name3"�м���':'�ָ�.

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

//ƥ���ֻ��͵绰
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
