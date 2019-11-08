// CLIENTIFY ANALYTICS

if (typeof trackerCode ==='undefined'){
  (function (d, w, u, o) {
    w[o] = w[o] || function () {
    (w[o].q = w[o].q || []).push(arguments)
    };
    let a = d.createElement('script'),
    m = d.getElementsByTagName('script')[0];
    a.async = 1; a.src = u;
    m.parentNode.insertBefore(a, m)
  })(document, window, 'https://analytics.clientify.net/tracker.js', 'ana');
  ana('setTrackerUrl', 'https://analytics.clientify.net');
  ana('setTrackingCode', 'CF-1913-1913-8ZOI9');
  ana('trackPageview');
}