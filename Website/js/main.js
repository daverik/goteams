var loggedIn = false;

$(function() {
	$('.map-start').load('pages/map.html', function() {
	});
});

$(window).scroll(function() {
	if ($(window).scrollTop() > 0) {
		var ypos = $(window).scrollTop();
		$('.count-down').css('top', 500 - ypos);
		$('.league-section').css('top', 1200 - ypos);
		$('.team-section').css('top', 1600 - ypos);
		$('.compete-section').css('top', 2400 - ypos);
		$('.teams-section').css('top', 2000 - ypos);
		$('.arrow').css('top', 2000 - ypos);
	}
});

$('#logIn').click(function() {
	$("#login-dropdown").slideToggle();
});

function removeActiveNavClasses() {
	$("#nav-map").removeClass("active");
	$("#nav-teams").removeClass("active");
	$("#nav-leagues").removeClass("active");
}


$('.searchbox').keyup(function(e) {
	if (!$('.search-dropdown').hasClass('open')) {
		$('.search-dropdown').addClass('open');
	}
	$('.dropdown-menu').html('');
	var formData = {
		value : $('.searchbox').val()
	};
	$.ajax({
		url : "server/search.php",
		type : "POST",
		data : formData,
		success : function(data, textStatus, jqXHR) {
			//console.log(data);
			var msg = $.parseJSON(data);
			//console.log(msg.values);
			for (var i = 0; i < msg.values.length; i++) {
				$('.dropdown-menu').append("<li class='search-item'><a href='#'>" + msg.values[i] + "</a></li>");
			}
			$('.search-item').click(function() {
				loadTeamPage($(this).find('a').html().trim());
				$('.stuffToHide').hide();
			});
		}
	});
});

$('#nav-map-link').click(function() {
	var container;

	if (loggedIn) {
		container = "#inner-container";
	} else {
		container = ".map-start"
	}
	$(container).load('pages/map.html');
	removeActiveNavClasses();
	$("#nav-map").addClass("active");
});

$("#username").keyup(function(e) {
	if (e.keyCode == 13) {
		logInClick();
	}
});

function logInClick() {
	var formData = {
		name : $('#username').val()
	};
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

}


$('#log-in-button').click(function() {
	logInClick();
});

$('#nav-teams-link').click(function() {
	loadTeamPage();
});

$('#nav-leagues-link').click(function() {
	loadLeaguePage();
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
			}
			$('.teamlink').click(function() {
				loadTeamPage($(this).text());
			});
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
				$("#my-leagues").append("<li class='my-leagues-list-item'><a class='leagueLink' href='#'>" + leagues[i] + "</a></li>");
			}
			$('.leagueLink').click(function() {
				loadLeaguePage($(this).text());
			});
		}
	});
}

function loadTeamPage(team) {

	var container;

	if (loggedIn) {
		container = "#inner-container";
	} else {
		container = ".map-start"
	}

	$(container).load('pages/teams.html', function() {
		if (team) {
			$('.page-info').hide();
			$(".team-header").html("<h2>" + team + "</h2>");
			var formData = {
				team : team
			};
			console.log(team);

			$.ajax({
				url : "server/getateam.php",
				type : "POST",
				data : formData,
				success : function(data, textStatus, jqXHR) {
					data = $.parseJSON(data);
					console.log(data);
					if (data) {

						$.ajax({
							url : "server/getteamposts.php",
							type : "POST",
							data : formData,
							success : function(data, textStatus, jqXHR) {
								data = $.parseJSON(data);
								console.log(data);
								if (data) {
									for (var i = 0; i < data.posts.length; i++) {
										var img = data.posts[i].avatar;
										if (!img || img == "") {
											img = "default-avatar.png";
										}
										img = "../img/avatar/" + img;
										$('.wall').append('<div class="row"><div class="col-md-2">' + '<img src="' + img + '" alt="Avatar" width="64" height="64" class="img-circle">' + '</div><div class="col-md-10"><h3>' + data.posts[i].name + '</h3>' + '<p class="post">' + data.posts[i].text + '</p></div></div>');
									}
								}
							}
						});

						$('.team-description').append(data.description);
						var list = $('.team-members').find("ul");
						if (data.members) {
							for (var i = 0; i < data.members.length; i++) {
								list.append("<li>" + data.members[i] + "</li>");
							}
						}
						list.append("<li><a href='#'>+ Add team member</a></li>");
					}
				}
			});
		} else {
			$('.team-content').hide();
		}
	});
	removeActiveNavClasses();
	$("#nav-teams").addClass("active");
}

function loadLeaguePage(league) {
	if (loggedIn) {
		$("#inner-container").load('pages/leagues.html', function() {
			if (league) {
				$("#page-info").hide();
				$(".league-header").html("<h2>" + league + "</h2>");
				var formData = {
					league : league
				};
				$.ajax({
					url : "server/getaleague.php",
					type : "POST",
					data : formData,
					success : function(data, textStatus, jqXHR) {
						data = $.parseJSON(data);
						$('.league-description').append(data.description);
						var list = $('.teams');
						if (data.teams) {
							for (var i = 0; i < data.teams.length; i++) {
								list.append("<li>" + data.teams[i] + "</li>");
							}
						}
					}
				});
			} else {
				$('.league-content').hide();
			}
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

	container1 = $(".search-dropdown");
	container2 = $(".searchbox");

	if (!container1.is(e.target) && !container2.is(e.target)// if the target of the click isn't the container...
	&& container1.has(e.target).length === 0)// ... nor a descendant of the container
	{
		container1.removeClass('open');
	}

});
