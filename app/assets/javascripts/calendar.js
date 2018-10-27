function eventCalendar() {
  var map = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
"茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
"新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
"静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
"奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県",
"徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県",
"熊本県","大分県","宮崎県","鹿児島県","沖縄県"
  ];
  var calendar = $('#calendar').fullCalendar({
    header: {
      left: '',
      center: 'title',
    },
    events: '/events.json',
    selectable: true,
    eventClick: function(event) { //イベントをクリックしたときに実行
      //     calendar.fullCalendar('refetchEvents');
      $("#calendar").fullCalendar('refetchEvents');
      console.log(event)
    },
    dayClick: function(event) {
      var place = window.prompt("場所を入力 (Baseball, Football, Soccer, or Track)")
      if (map.indexOf(place) < 0) {
        alert("都道府県を入力してください")
        return
      }
      var data = {
        date: {
          year: event.year(),
          month: parseInt(event.month()) + 1,
          day: event.date(),
        },
        prefecture: place
      }
      $.ajax({
       type: "POST",
       url: "/schedules",
       data: data,
      }).done(function(data, text, jq) {
        calendar.fullCalendar('refetchEvents');
      });
    }
  });
  return calendar
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete'); // In case delete doesn't work.
  $('#calendar').html('');
};
$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)

