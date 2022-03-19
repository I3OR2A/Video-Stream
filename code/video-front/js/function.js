$(function () {
  "use strict";
  $('[data-toggle="offcanvas"]').on("click", function () {
    $(".offcanvas-collapse").toggleClass("open");
  });
});
window.onload = function () {
  var links = document.links;
  for (var i = 0, linksLength = links.length; i < linksLength; i++) {
    if (links[i].hostname != window.location.hostname) {
      links[i].target = "_blank";
    }
  }
};
if ("serviceWorker" in navigator) {
  console.log("Will the service worker register?");
  navigator.serviceWorker
    .register("/service-worker.js")
    .then(function (reg) {
      console.log("Yes, it did.");
    })
    .catch(function (err) {
      console.log("No it didn't. This happened:", err);
    });
}
