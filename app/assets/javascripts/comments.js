

let Comments
Comments={}
Comments.displayComment = function(comment){

let paragraphe = document.createElement('p')
paragraphe.className="comments__paragraphe"
let body = document.createTextNode (comment.body)
let span =document.createElement('span')
let span2= document.createElement('span')
span.className = "auteur"
span2.className = "date"
let image =document.createElement('img')
image.src=comment.avatar
image.className="profil--img"
image.alt= "image artiste"
text1=document.createTextNode(comment.commenter)
text2=document.createTextNode(comment.datetime)
paragraphe.appendChild(body)
span.appendChild(text1)
span2.appendChild(text2)
let zonecomment = document.getElementById('comments')
zonecomment.appendChild(image)
zonecomment.appendChild(span)
zonecomment.appendChild(span2)
zonecomment.appendChild(paragraphe)
location.reload();

}




Comments.DestroyComment = function(commentid) {
  document.getElementById(commentid).parentElement.remove()
  location.reload();
}
