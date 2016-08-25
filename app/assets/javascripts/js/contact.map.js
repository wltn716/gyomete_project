/* ==============================================
Google map
============================================== */
(function($) {
  $.fn.contactmap = function(options) {

    var posLatitude = $('#contactmap').data('position-latitude'),
    posLongitude = $('#contactmap').data('position-longitude');

    var settings = $.extend({
      home: {
        latitude: posLatitude,
        longitude: posLongitude
      },
      text: '  <div id="gmap_content"><div class="gmap-item"><label class="label-title">Keep in Touch</label></div><div class="gmap-item"><label><i class="fa fa-map-marker"></i></label><span>Address : 245 Quigley Blvd, Ste K</span></div><div class="gmap-item"><label><i class="fa fa-phone"></i></label><span>Phone: +977 (9841) 75 23 20</span></div><div class="gmap-item"><label><i class="fa fa-envelope"></i></label><span>Email: support@motts.co</span></div></div>',icon_url: $('#contactmap').data('marker-img'),
      zoom: 14
    }, options);

    var coords = new google.maps.LatLng(settings.home.latitude, settings.home.longitude);

    return this.each(function() {
      var element = $(this);

      var options = {
        zoom: settings.zoom,
        center: coords,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        panControl: true,
        disableDefaultUI: true,
        scrollwheel:false,
        draggable:true,
        navigationControl:false,
        zoomControlOptions: {
          style: google.maps.ZoomControlStyle.DEFAULT
        },
        overviewMapControl: true,
      };

      var map = new google.maps.Map(element[0], options);

      var icon = {
        url: settings.icon_url,
        origin: new google.maps.Point(0, 0)
      };

      var marker = new google.maps.Marker({
        position: coords,
        map: map,
        icon: 'images/map-pin.png',
        draggable: false
      });

      var info = new google.maps.InfoWindow({
        content: settings.text
      });

      google.maps.event.addListener(marker, 'click', function() {
        info.open(map, marker);
      });
    });

  };
}(jQuery));

jQuery(document).ready(function() {
  jQuery('#contactmap').contactmap();
});