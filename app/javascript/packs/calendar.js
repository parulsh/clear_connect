import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  var url = window.location.search;
  var urlParams = new URLSearchParams(url);
  var meet_type = urlParams.get('meeting_type')
  var type = urlParams.get('view_type')
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin],
    events: {
      url: '/meetings.json',
      extraParams: {
        meeting_type: meet_type,
        view_type: type
      },
    },
  });

  calendar.render();
});
