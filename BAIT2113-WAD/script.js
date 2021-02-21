/*Toggle navigation menu*/
function showNavMenu() {
    var nav = document.getElementById("navi-menu");

    if (nav.style.display == "block") {
        setTimeout(function () { nav.style.display = "none"; }, 400);
    } else {
        nav.style.display = "block";
    }
}

/*Back to top*/
var mybutton = document.getElementById("top-btn");

function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}


/*Auto hide nav*/
/*
var prevScrollpos = window.pageYOffset;

window.onscroll = function () {
    var currentScrollPos = window.pageYOffset;

    if (prevScrollpos > currentScrollPos) {
        document.getElementById("navbar").style.top = "0";
    } else {
        document.getElementById("navbar").style.top = "-4rem";
    }

    prevScrollpos = currentScrollPos;
}
*/

