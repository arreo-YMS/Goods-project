var slides = document.querySelectorAll("#slides > img");
var prev = document.getElementById("prev");
var next = document.getElementById("next");
var current = 0;

showSlides(current);
prev.onclick = prevSlide;
next.onclick = nextSlide;

function showSlides(n) {
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[n].style.display = "block";
}

function prevSlide() {
  if (current > 0) current -= 1;
  else
    current = slides.length - 1;
    showSlides(current);
}

function nextSlide() {
  if (current < slides.length - 1) current += 1;
  else
    current = 0;
    showSlides(current);  
}
console.log(slides);

showSlides(current);
prev.onclick = prevSlide;
next.onclick = nextSlide;

prevSlide2();


function showSlides(n){
    for(var i = 0; i < slides.length; i++){
        slides[i].style.display = 'none';
    }
    slides[n].style.display = 'block';
}

function prevSlide(){
    if(current > 0 ){
        current -= 1; // 커런트가 0보다 크면 이전 위치로
    }else{
        current = slides.length-1;
    }
    showSlides(current);
}

function nextSlide(){

    if(current < slides.length-1){
        current  += 1;
    }else{
        current = 0;
    }
    showSlides(current);

}


function prevSlide2(){
    if(current > 0 ){
        current -= 1; // 커런트가 0보다 크면 이전 위치로
    }else{
        current = slides.length-1;
    }
    showSlides(current);

    setTimeout(prevSlide2, 5000);
}