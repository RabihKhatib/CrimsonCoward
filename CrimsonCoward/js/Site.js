
$(document).ready(function () {
    $(".various").fancybox({
        maxWidth: 850,
        maxHeight: 600,
        fitToView: false,
        width: '850px',
        height: '430px',
        autoSize: false,
        closeClick: false,
        openEffect: 'none',
        closeEffect: 'none'
    });
     $('.fancybox-media').fancybox({
        openEffect: 'none',
        closeEffect: 'none',
        helpers: {
            media: {}
        }
    });
//    $("#brokerage_menu").mouseover
//    $(".fancybox").fancybox({
//        iframe: {
//            preload: false
//        }
//    });
//    $("a.iframe").fancybox({
//        'transitionIn': 'elastic',
//        'transitionOut': 'elastic',
//        'speedIn': 600,
//        'speedOut': 200,
//        'overlayShow': false
//    });
    $("#responsive_menu_icon").click(function () {
        $("#responsive_menu").toggle(800);
    });
    $("#main").click(function () {
        $("#responsive_menu").hide(800);
    });

    $(".main_banner_text").fadeIn(2000);
});


//function AdvertisementBanner(width, height) {
//    $("#advertisement_banner").bjqs({
//        'height': height,
//        'width': width,
//        'automatic': true,
//        'animationDuration': 1000,
//        'centerMarkers': false,
//        'centerControls': false,
//        'nextText': ' ',
//        'prevText': ' ',
//        'useCaptions': false,
//        'showMarkers': false,
//        'keyboardNav': false,
//        'rotationSpeed': 8000
//    });
//}

function enableAccordion() {
    haccordion.setup({
        accordionid: 'latest_news', //main accordion div id
        paneldimensions: { peekw: '170px', fullw: '500px', h: '170px' },
        selectedli: [0, true], //[selectedli_index, persiststate_bool]
        collapsecurrent: false //<- No comma following very last setting!
    });
}

function swapImage(imgID, imgSrc) {
    document.getElementById(imgID).src = imgSrc;
}

function showSelectValue(labelID, ddlValue) {
    document.getElementById(labelID).innerHTML = ddlValue;
}

function jsDecimals(e) {

    var evt = (e) ? e : window.event;
    var key = (evt.keyCode) ? evt.keyCode : evt.which;
    if (key != null) {
        key = parseInt(key, 10);
        if ((key < 48 || key > 57) && (key < 96 || key > 105)) {
            if (!jsIsUserFriendlyChar(key)) {
                return false;
            }
        }
        else {
            if (evt.shiftKey) {
                return false;
            }
        }
    }
    return true;
}
function jsIsUserFriendlyChar(val) {
    // Backspace, Tab, Enter, Insert, and Delete  
    if (val == 8 || val == 9 || val == 13 || val == 45 || val == 46) {
        return true;
    }
    // Ctrl, Alt, CapsLock, Home, End, and Arrows  
    if ((val > 16 && val < 21) || (val > 34 && val < 41)) {
        return true;
    }
    // The rest  
    return false;
}

function changeAboutDept(dept) {
    document.getElementById("imgAboutDepts").src = "/images/imgAbout-" + dept + "-on.jpg";
    document.getElementById("brokerage_text").className = "hidden";
    document.getElementById("projects_text").className = "hidden";
    document.getElementById("assetmanagement_text").className = "hidden";
    document.getElementById(dept + "_text").className = "";
}
//var map;
//function initialize()
//{
//      var mapOptions = {
//    zoom: 17,
//    center: new google.maps.LatLng(34.148306, 35.646128)
//  };

//   map = new google.maps.Map(document.getElementById('map'),
//      mapOptions);
//  // google.maps.event.addDomListener(window, 'load', initialize);
//}


//function clickroute(lati, long) {

//    map = google.maps.Map(document.getElementById("map_canvas"));
//    map.panTo(lati, long);
//}

//function startMarquee(id) {
//    $("#" + id + " > span").hide();
//    $("#" + id + " > marquee").show();
//    $("#" + id + " > marquee").attr("scrollamount", "3");
//    $("#" + id + " > marquee").start();
//}
//function stopMarquee(id) {
//    $("#" + id + " > marquee").attr("scrollamount", "0");
//    $("#" + id + " > marquee").stop();
//    $("#" + id + " > marquee").hide();
//    $("#" + id + " > span").show();
//}

//$(window).load(function () {
//    function enableAccordion() {
//        haccordion.setup({
//            accordionid: 'latest_news', //main accordion div id
//            paneldimensions: { peekw: '170px', fullw: '500px', h: '170px' },
//            selectedli: [0, true], //[selectedli_index, persiststate_bool]
//            collapsecurrent: false //<- No comma following very last setting!
//        });
//    }
//        
// });