/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

// Analytic Codes, pass by Milton Moreno 6 Nov 2019

// TAG MANAGER

(function(w,d,s,l,i){
  w[l]=w[l]||[];
  w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});
  var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s), dl=l!='dataLayer'?'&l='+l:'';
  j.async=true;
  j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MC7RKNG');

// Tracking google analytics

window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'UA-108065726-1');

// CLIENTIFY ANALYTICS

if (typeof trackerCode ==='undefined'){
  (function (d, w, u, o) {
    w[o] = w[o] || function () {
    (w[o].q = w[o].q || []).push(arguments)
    };
    a = d.createElement('script'),
    m = d.getElementsByTagName('script')[0];
    a.async = 1; a.src = u;
    m.parentNode.insertBefore(a, m)
  })(document, window, 'https://analytics.clientify.net/tracker.js', 'ana');
  ana('setTrackerUrl', 'https://analytics.clientify.net');
  ana('setTrackingCode', 'CF-1913-1913-8ZOI9');
  ana('trackPageview');
}

//PIXEL FACEBOOK

!function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
      if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
      n.queue=[];t=b.createElement(e);t.async=!0;
      t.src=v;s=b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t,s)}(window, document,'script',
          'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '349189892310764');
  fbq('track', 'PageView');

// CHATBOT CODE

(function (w,i,d,g,e,t,s){
  var iapp=document.createElement("app-root");
  document.getElementsByTagName("body")[0].appendChild(iapp);
  var link = document.createElement("link");
  link.setAttribute("rel", "stylesheet");
  link.setAttribute("type", "text/css");
  link.setAttribute("href", "https://apps.clientify.net/chatbot/styles.css");
  document.getElementsByTagName("head")[0].appendChild(link);
  var iDiv = document.createElement("div");iDiv.id = "13084";
  iDiv.className = "script";
  document.getElementsByTagName("body")[0].appendChild(iDiv);w[d] = w[d]||[];
  t= i.createElement(g);
  t.async=1;t.src=e;
  s=i.getElementsByTagName(g)[0];
  s.parentNode.insertBefore(t, s);
})(window, document, "_gscq","script","https://apps.clientify.net/chatbot/dist/embed.js")
