
/*
scroll Animation
 */
 const ratio = .3
 const options = {
  root: null,
  rootMargin: '0px',
  threshold: ratio
}
const handleIntersect =function (entries,observer) {
  entries.forEach(function(entry){
    if(entry.intersectionRatio > ratio) {
      entry.target.classList.add("reveal_visible")

    }
    else {
      entry.target.classList.remove("reveal_visible")
    }
  })
}

let observer = new IntersectionObserver(handleIntersect, options);
document.querySelectorAll('[class*="reveal_"]').forEach(function(r){
  observer.observe(r)
})


/**
 * change apparence main when scroll
 */
 $(window).scroll(function () {
   let defilement = $(this).scrollTop();
   if (defilement > 100 && defilement < 760) {

     $('.navebar__absolute').addClass( " transparent" );

   }

   else {
     $('.navebar__absolute').removeClass( "transparent" );
   }
 })

 /**
  * change image when hover link
  the text name of artiste have to be a same name of image
  */


function affiche(e){
  e.nextElementSibling.classList.remove('cache')
  e.nextElementSibling.classList.add('vis')
}
function cache (e) {
  e.nextElementSibling.classList.remove('vis')
  e.nextElementSibling.classList.add('cache')
}

  /**
   * function play music
   */

   function play(idPlayer, control) {
       var player = document.querySelector('#' + idPlayer);


       player.controls=true
        window.currentPlay=player
       if (player.paused) {
         let progressBarControl__loadingControl = document.getElementById('progressBarControl__loadingControl')
          window.namesong=document.getElementById("loadingControl"+ idPlayer)

         progressBarControl__loadingControl.style.left=0

           player.play();
           control.innerHTML = 'Pause';
           namesong.style.display="block"
       } else {
           player.pause();
           control.textContent = 'Play';
            player.controls=false
          
            namesong.style.display="none"
       }
   }




   function resume(idPlayer) {
       var player = document.querySelector('#' + idPlayer);

       player.currentTime = 0;
       player.pause();
   }

   /**
    * function progression bar
    */

   function update(player) {

     var duration = player.duration;    // Durée totale
     var time     = player.currentTime; // Temps écoulé
     var fraction = time / duration;
     var percent  = Math.ceil(fraction * 100);
 }
 /**
  * add listen progress bar
  */



  /**
   * function formate time
   */

   function formatTime(time) {
    var hours = Math.floor(time / 3600);
    var mins  = Math.floor((time % 3600) / 60);
    var secs  = Math.floor(time % 60);

    if (secs < 10) {
        secs = "0" + secs;
    }

    if (hours) {
        if (mins < 10) {
            mins = "0" + mins;
        }

        return hours + ":" + mins + ":" + secs; // hh:mm:ss
    } else {
        return mins + ":" + secs; // mm:ss
    }
}

/**
 *
Retrieve the coordinates of the mouse cursor
 */
 function getMousePosition(event) {
     return {
         x: event.pageX,
         y: event.pageY
     };
 }

 /**
  *
  Retrieve the coordinates of an element
  */

  function getPosition(element){
    var top = 0, left = 0;

    do {
        top  += element.offsetTop;
        left += element.offsetLeft;
    } while (element = element.offsetParent);

    return { x: left, y: top };
}

/**
 *
 function clickProgress
 */

 function clickProgress(player, control, event) {
    var parent = getPosition(control);    // La position absolue de la progressBarControl__loading
    var target = getMousePosition(event); // L'endroit de la progressBarControl__loading où on a cliqué
    var player = player;

    var x = target.x - parent.x;
    var wrapperWidth = document.querySelector('#progressBarControl__loadingControl').offsetWidth;

    var percent = Math.ceil((x / wrapperWidth) * 100);
    var duration = player.duration;

    player.currentTime = (duration * percent) / 100;
}



 /**
  *
  button close bare de progression sound
  */

  function closebar() {
    progressBarControl__loadingControl = document.getElementById('progressBarControl__loadingControl')

    if(getComputedStyle(progressBarControl__loadingControl).left=="-2560px")
    {

      progressBarControl__loadingControl.style.left = "0px"

    }
    else {
   progressBarControl__loadingControl.style.left="-2560px"
}
  }



  /**
   *
   scroll event.html title block stays in fix position
   */
   $(window).scroll(function () {
     let defilement = $(this).scrollTop();
     if (defilement > 100) {

       $('.events--info').addClass( "position_top" );

     }

     else {
       $('.events--info').removeClass( "position_top" );
     }
   })

   /**
    *
    function control entries form
    */

function valider() {
  let name = document.getElementById("name")
  let mail =document.getElementById("email")
  let password = document.getElementById("password")
  let password2 =document.getElementById("password2")
  let img_profil =document.getElementById("img_profil")
if (/^[a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,6}$/.test(mail.value)) {

} else {
    let div = document.createElement("div")
    div.className="erreur-form"
    let span =document.createElement("span")
    let texterreur=document.createTextNode("l address mail doit etre ecrie sous la forme nom@gmail.com")
    span.appendChild(texterreur)
    div.appendChild(span)
    let bloc_erreur=document.getElementById("bloc-email")
    bloc_erreur.appendChild(div)

}
if (name.value !=="" && name.value.length < 15) {

}
else {
  let div2 = document.createElement("div")
  div2.className="erreur-form"
  let span2 =document.createElement("span")
  let texterreur2=document.createTextNode("le champ nom doit etre remplie et le nombre de caractere ne doit pas depasser 15")
  span2.appendChild(texterreur2)
  div2.appendChild(span2)
  let bloc_erreur2=document.getElementById("bloc-name")
  bloc_erreur2.appendChild(div2)

}
if (/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/.test(password.value) && password.value === password2.value)
{

}
else {
  let div3 = document.createElement("div")
  div3.className="erreur-form"
  let span3 =document.createElement("span")
  let texterreur3=document.createTextNode("le mot de passe de contenir au moin un chiffre un sigle et le password de vefif doit etre exacte")
  span3.appendChild(texterreur3)
  div3.appendChild(span3)
  let bloc_erreur3=document.getElementById("bloc-password")
  bloc_erreur3.appendChild(div3)
}
if(img_profil.value==""){
  let div4 = document.createElement("div")
  div4.className="erreur-form"
  let span4 =document.createElement("span")
  let texterreur4=document.createTextNode("il faudra choisir une image de profil")
  span4.appendChild(texterreur4)
  div4.appendChild(span4)
  let bloc_erreur4=document.getElementById("bloc-file")
  bloc_erreur4.appendChild(div4)
}
}

/**
 *
 Verification file profil img
 */
function isImage(filename) {
    var ext = filename.split('.').pop();
    switch (ext.toLowerCase()) {
    case 'jpg':
    case 'gif':
    case 'bmp':
    case 'png':
        //etc
        return true;
    }
    return false;
}

document.querySelector('#img_profil').addEventListener('change', function() {

    if(isImage(this.files[0].name) && this.files[0].size < 200000) {

    }
    else {
       div4 = document.createElement("div")
      div4.className="erreur-form"
     span4 =document.createElement("span")
       texterreur4=document.createTextNode("le fichier doit etre au format jpg,png,gif,bmp et le poid ne doit pas depasser 2MO")
      span4.appendChild(texterreur4)
      div4.appendChild(span4)
       bloc_erreur4=document.getElementById("bloc-file")
      bloc_erreur4.appendChild(div4)
    }

});

/**
 *
 add event listen submit form
 */

let btn_submit=document.querySelector(".prompt__confirm")
btn_submit.addEventListener("click",function(e){
  e.preventDefault()
  valider()

})
