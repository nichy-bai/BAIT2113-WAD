function showNavMenu() {
    var x = document.getElementById("navi-menu");
    if (x.style.display == "block") {
        setTimeout(function () { x.style.display = "none"; }, 400);
    } else {
        x.style.display = "block";
    }
}

