
let Artist = {}
Artist.RemoveArtist = function(idartist) {
  document.getElementById("artist-"+idartist).parentElement.remove()
};
