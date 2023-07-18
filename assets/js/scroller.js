 var link = document.getElementById("back-to-top");
 var amountScrolled = 10;

 window.addEventListener('scroll', function(e) {
     if (window.pageYOffset > amountScrolled) {
         link.classList.add('show');
     } else {
         link.className = 'back-to-top';
     }
 });

 // Scrolls to Top
 link.addEventListener('click', function(e) {
     e.preventDefault();

     var distance = 0 - window.pageYOffset;
     const newLocal = 500 / 16;
     var increments = distance / (newLocal);

     function animateScroll() {
         window.scrollBy(0, increments);
         if (window.pageYOffset <= document.body.offsetTop) {
             clearInterval(runAnimation);
         }
     };
     // Loop the animation function
     var runAnimation = setInterval(animateScroll, 1);
 });