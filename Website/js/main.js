var loggedIn = false;

$('#logIn').click(function() {
	$("#login-dropdown").slideToggle();
});

function removeActiveNavClasses() {
	$("#nav-map").removeClass("active");
	$("#nav-teams").removeClass("active");
	$("#nav-leagues").removeClass("active");
}


$('#nav-map-link').click(function() {
	if (loggedIn) {
		$("#inner-container").load('pages/map.html');
		removeActiveNavClasses();
		$("#nav-map").addClass("active");
	}
});

$('#nav-teams-link').click(function() {
	loadTeamPage();
});

$('#nav-leagues-link').click(function() {
	loadLeaguePage();
});

$('#log-in-button').click(function() {

	var formData = {
		name : $('#username').val()
	};
	//Array

	$.ajax({
		url : "server/login.php",
		type : "POST",
		data : formData,
		success : function(data, textStatus, jqXHR) {
			var msg = $.parseJSON(data);
			if (msg.loginSuccess) {
				login();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {

		}
	});

});

function login() {
	$('#page-container').load('pages/loggedin.html', function() {
		$("#inner-container").load('pages/map.html');
		loggedIn = true;
	});
	$("#login-dropdown").slideToggle();
	$('#log-out-item').toggle();
	$('#logIn').toggle();
	$('#sign-up-item').toggle();

	loadLeagues();
	loadTeams();
}

function loadTeams(teams) {

	$.ajax({
		url : "server/getteams.php",
		type : "POST",
		success : function(data, textStatus, jqXHR) {
			var teams = $.parseJSON(data).teams;
			for (var i = 0; i < teams.length; i++) {
				$("#my-teams").append("<li class='my-teams-list'><a class='teamlink' href='#'>" + teams[i] + "</a></li>");

				$('.teamlink').click(function() {
					loadTeamPage($(this).text());
				});
			}
		}
	});
}

function loadLeagues() {

	$.ajax({
		url : "server/getleagues.php",
		type : "POST",
		success : function(data, textStatus, jqXHR) {
			var leagues = $.parseJSON(data).leagues;
			for (var i = 0; i < leagues.length; i++) {
				$("#my-leagues").append("<li class='my-leagues-list'><a class='leagueLink' href='#'>" + leagues[i] + "</a></li>");

				$('.leagueLink').click(function() {
					loadLeaguePage($(this).text());
				});
			}
		}
	});
}

function loadTeamPage(team) {

	if (loggedIn) {
		$("#inner-container").load('pages/teams.html', function() {
			if (team)
				$(".team-header").html("<h2>" + team + "</h2>");
		});
		removeActiveNavClasses();
		$("#nav-teams").addClass("active");
	}
}

function loadLeaguePage(league) {
	if (loggedIn) {
		$("#inner-container").load('pages/leagues.html', function() {
			if (league)
				$(".league-header").html("<h2>" + league + "</h2>");
		});
		removeActiveNavClasses();
		$("#nav-leagues").addClass("active");
	}
}


$('#log-out-button').click(function() {
	loggedIn = false;
	window.location = 'index.html';
});

$(document).mouseup(function(e) {
	var container = $("#login-dropdown");

	if (!container.is(e.target)// if the target of the click isn't the container...
	&& container.has(e.target).length === 0)// ... nor a descendant of the container
	{
		container.hide();
	}
});
