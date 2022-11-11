//时钟计时

function displayTime(){
	
	var date = new Date();
	var hour = date.getHours();
	var min = date.getMinutes();
	var sec = date.getSeconds();
	
	var timestr_year = date.getFullYear()+"年"
		+(date.getMonth()+1)+"月"
		+date.getDate()+"日";
	var timestr_clock = date.getHours()+"时"
		+date.getMinutes()+"分"
		+date.getSeconds()+"秒";
	
	var weekday_num = date.getDay()+1;
	var weekday_str;
	switch (weekday_num){
		case 0:
			weekday_str = "一";
			break;
		case 1:
			weekday_str = "二";
			break;
		case 2:
			weekday_str = "三";
			break;
		case 3:
			weekday_str = "四";
			break;
		case 4:
			weekday_str = "五";
			break;
		case 5:
			weekday_str = "六";
			break;
		case 6:
			weekday_str = "日";
			break;
		default:
			break;
	}
	
	var timestr_weekday = "周"+weekday_str;
					
	document.getElementById("time_year").innerHTML = timestr_year;
	document.getElementById("time_clock").innerHTML = timestr_clock;
	document.getElementById("time_weekday").innerHTML = timestr_weekday;
	

	var imgHour = document.getElementById('clock_hour');
	var imgMin = document.getElementById('clock_minute');
	var imgSec = document.getElementById('clock_second');
	imgHour.style.transform = 'rotate(' + hour*30 + 'deg)';
	imgMin.style.transform = 'rotate(' + min*6 + 'deg)';
	imgSec.style.transform = 'rotate(' + sec*6 + 'deg)';
	
	
}
intervalTime = setInterval(displayTime,1000);