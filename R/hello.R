play_song <- function(songName = "Never Gonna Give You Up", url = NULL, print = FALSE){

  if(is.null(url)){
    parsedSongName <- gsub(" ", "+", songName)
    url <- paste("https://www.google.com/search?q=site:youtube.com+", parsedSongName,"&btnI=", sep = "")
  }


  if(print){
    cat("\n Now Playing: ")
    cat(songName)
    cat("\n")
  }
  browseUrl(url)
}
