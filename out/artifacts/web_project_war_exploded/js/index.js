window.onload = function () {
    var baseBox = document.getElementsByClassName("base-box")[0];
    var xSpeed = 1;
    baseBox.style.left = 0+"px";
    var x = 0;

    setInterval(function () {
        x+=xSpeed;
        baseBox.style.left = x+"px";

        if (x>920){
            x=-20;
        }
    },10)
}