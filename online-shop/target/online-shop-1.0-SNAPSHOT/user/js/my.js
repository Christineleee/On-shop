var interval;
window.onload = function() {
	interval = window.setInterval("changeSecond()", 1000);
};
function changeSecond() {
	var second = document.getElementById("second");
	var svalue = second.innerHTML;
	svalue = svalue - 1;
	if (svalue == 0) {
		window.clearInterval(interval);
		location.href = "http://localhost:8099/user/login.jsp";
		return;
	}
	second.innerHTML = svalue;
}
