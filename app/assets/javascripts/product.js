$(document).on('page:load', init);
$(document).on('page:change', init);
$(document).ready(init);

function init(){
    initSweet();
    (function slideshow() {
        if($('.image')) {
            $('.slideshow').slick();
        }
        $('.fancybox').fancybox();
    })();
    (function notReady() {
        NodeList.prototype.forEach = Array.prototype.forEach;
        document.querySelectorAll('a[href="#nope"]')
            .forEach(function(link){
                    link.addEventListener('click', function(e) {
                            e.preventDefault();
                            swal('Looks like this isn\'t ready yet, but it\'ll be up soon. Stay tuned!');
                    });
            });
    })();
    (function lazyLoad() {
        $(".gallery img").unveil();
        document.querySelectorAll(".gallery img")
            .forEach(function(img) {
                    img.addEventListener('click', function(e) {
                            //window.location = this.src;
                    });
            });
    })();
}
