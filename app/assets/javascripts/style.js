
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
  let artiste_link = document.getElementsByClassName('name_artiste')
  for (i=0;i< artiste_link.length;i++)
  {
    artiste_link[i].addEventListener('mouseover',function(e){
      let image = document.createElement('img')
      image.alt = 'image artiste'
      let name_image = e.currentTarget.textContent +".jpg"
      image.src = "images/"+name_image
      image.className = "photo_artiste"
      let bloc_menu = document.getElementById('bloc_menu')

        bloc_menu.appendChild(image)

    })
  }
  for (i=0;i< artiste_link.length;i++)
  {
  artiste_link[i].addEventListener('mouseout',function(e){
    let image2=document.querySelector('.photo_artiste')
    let bloc_menu2 = document.getElementById('bloc_menu')
    bloc_menu2.removeChild(image2)
  })
  }


  /**
   * function play music
   */

   function play(idPlayer, control) {
       var player = document.querySelector('#' + idPlayer);
        window.currentPlay=player
       if (player.paused) {
         let progressBarControl__loadingControl = document.getElementById('progressBarControl__loadingControl')
         let close_btn = document.querySelector('.bloc_close_btn')
         progressBarControl__loadingControl.style.left=0
         close_btn.style.left='80%'
           player.play();
           control.textContent = 'Pause';
       } else {
           player.pause();
           control.textContent = 'Play';
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

     var progress = document.querySelector('#progressBarControl__loading');

     progress.style.width = percent + '%';
     progress.textContent = formatTime(time)
 }
 /**
  * add listen progress bar
  */

  let bar_progress= document.querySelectorAll(".sound")
  for(i=0;i<bar_progress.length;i++) {
    bar_progress[i].addEventListener('timeupdate',function(e){
      update(e.currentTarget)
    })
  }

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
 function listener click progressBarControl__loading!!!
 */
 let progress_bar= document.getElementById('progressBarControl__loadingControl')
 progress_bar.addEventListener('click',function(e){
   clickProgress(window.currentPlay,e.currentTarget,event)
 })

 /**
  *
  button close bare de progression sound
  */

  let button_close= document.getElementById('btn')
  button_close.addEventListener('click',function(e){
   progressBarControl__loadingControl = document.getElementById('progressBarControl__loadingControl')
   close_btn = document.querySelector('.bloc_close_btn')
  progressBarControl__loadingControl.style.left='-200%'
  close_btn.style.left='-200%'

  })

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
