(function($) {
    $.fn.renderMeetings = function (meeting) {
        if (meeting) {
            this.html($("#eventTemplate").tmpl(meeting));
        } else {
            $('div', this).toggle();
        }
    };
})(jQuery);


(function (NJDOTNET) {
    
    function toMeetings(src) {
        var meetings = [];

        $.each(src, function () {
            meetings.push(toMeeting(this));
        });
        
        return meetings;
    }

    function toMeeting(src) {
        if (!src) return null;

        var time = new Date(src.time).toLocaleDateString();
        var details = $('<div>').append(src.description);
        var bio = details.find('blockquote').last().remove();
        var presenter = bio.find('strong').remove();

        details.find('p').first().remove();

        var meeting = {
            url: src.event_url,
            title: src.name,
            presenter: presenter.text(),
            bio: bio.text(),
            description: details.html(),
            time: time,
        };

        return meeting;
    }

    function loadMeetings(meetingsUrl) {
        return $.Deferred(function (promise) {
            $.ajax({
                url: "http://njdotnet.apphb.com/scripts/SimpleJsonProxy.ashx?m=eb&u=" + $.URLEncode(meetingsUrl),
                success: function (result) {
                    var meetings = toMeetings(result.results);
                    
                    if(meetings && meetings.length > 0) {
                        promise.resolve(meetings);
                    }
                    else {
                        promise.reject();
                    }
                },
                error: promise.reject
            });
        });
    }


    var upcomingMeetingsUrl = "http://api.meetup.com/2/events?group_id=3842122&status=upcoming&_=1349718720600&order=time&desc=false&offset=0&format=json&page=20&fields=&sig_id=57634992&sig=38f01c1c3b01077d214571ee4890f9fe5fecccf7";
    var pastMeetingsUrl = "http://api.meetup.com/2/events?group_id=3842122&_=1349751121189&status=past&order=time&desc=true&offset=0&format=json&page=20&fields=&sig_id=57634992&sig=8b5bc04ab407d3a3b3ebb449886c2e1026efc988";

    $.extend(NJDOTNET, {
        loadPastMeetings: function () { return loadMeetings(pastMeetingsUrl); },
        loadUpcomingMeetings: function () { return loadMeetings(upcomingMeetingsUrl); }
    });

})(window['NJDOTNET'] = {});