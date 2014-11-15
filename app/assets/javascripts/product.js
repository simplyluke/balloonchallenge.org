$(document).on('page:load', init);
$(document).ready(init);

function init(){
    if($('.image')) {
        $('.slideshow').slick();
    }
    NodeList.prototype.forEach = Array.prototype.forEach;
    document.querySelectorAll('a[href="#"]')
        .forEach(function(link){
                link.addEventListener('click', function(e) {
                        e.preventDefault();
                        sweetAlert('Looks like this isn\'t ready yet, but it\'ll be up soon. Stay tuned!');
                });
        });
    swal({   title: "Error!",   text: "Here's my error message!",   type: "error",   confirmButtonText: "Cool" });
    (function lazyLoad() {
        $(".gallery img").unveil();
        document.querySelectorAll(".gallery img")
            .forEach(function(img) {
                    img.addEventListener('click', function(e) {
                            window.location = this.src;
                    });
            });
    })();
}
