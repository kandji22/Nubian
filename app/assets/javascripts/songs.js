
let Song = {}
Song.RemoveSong = function(idsong) {
  document.getElementById("song-"+idsong).parentElement.remove()
};
