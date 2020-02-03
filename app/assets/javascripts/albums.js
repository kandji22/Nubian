
let Album = {}
Album.RemoveAlbum = function(idalbum) {
  document.getElementById("album-"+idalbum).parentElement.remove()
};
