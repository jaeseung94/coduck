/**
 * lecture js foot
 */

// lecture - main - accordion.js
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
	acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		if (panel.style.display === "block") {
			panel.style.display = "none";
		} else {
			panel.style.display = "block";
		}
	});
}

	// lecture - description - starScore.js
	var score = $("#starScore").data("text");
	var star = "";
	for(var i=1; i<=score; i++) {
		star += '<i class="fas fa-star"></i>';
	}
	
	$("#starScore").html(star);
	
	var trim = 5 - score;
	
	var emptyStar = "";
	for(var i=1; i<=trim; i++) {
		emptyStar += '<i class="far fa-star"></i>';
	}
	
	$("#starScore").append(emptyStar);
	
	// lecture - description - lectureTag split.js 
	var str = $("#lectureTag").data("tag").split('#');
	var html = "";
	for (var i in str) {
		html +="<li><i class='glyphicon glyphicon-ok'></i> " +  str[i] + "</li>";
	}
	$("#lectureTag").html(html);
	$("#lectureTag li:first").remove();
	