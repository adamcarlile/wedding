$(document).ready(function() {
  date = new Date(2019, 3, 27, 14, 0)
  today = new Date
  difference = Math.abs((date - today) / 1000)

  // $('.clock').FlipClock(difference, {
	//   clockFace: 'DailyCounter',
  //   countdown: true,
  //   showSeconds: false
  // })

  $('.clock').countdown("2019/04/27 14:00:00", function(event) {
    $(this).html(
      event.strftime( '<div class="time-wrapper">'
                    + ' <span>Days</span>'
                    + ' <div class="time-box">%D</div>'
                    + '</div>'
                    + '<div class="time-wrapper">'
                    + ' <span>Hours</span>'
                    + ' <div class="time-box">%H</div>'
                    + '</div>'
                    + '<div class="time-wrapper">'
                    + ' <span>Minutes</span>'
                    + ' <div class="time-box">%M</div>'
                    + '</div>'
                    + '<div class="time-wrapper">'
                    + ' <span>Seconds</span>'
                    + ' <div class="time-box">%S</div>'
                    + '</div>')
    );
  });
})
