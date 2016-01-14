#' Rchestra
#'
#' \code{play_song} Plays a song from your web browser
#'
#' The function launches a new page in your web browser with the top hit from the google search for the
#' given string. By default, it selects the top result from www.youtube.com, but other options (such as vevo, etc)
#' can also be used
#'
#' @param songName string used for google search. Typically including the song name and artist should be enough
#' @param url a string with a specific url to be launched. If left null, the function searches google instead
#' @param print boolean which tells whether to print the song being played to the console
#' @param site string which specifies which site to play from. By default it is www.youtube.com, but www.vevo.com (or any other
#' site of choice) can be used as well
#' @seealso error_songs
#' @examples
#' play_song(songName = "Never Gonna Give You Up Rick Astley")
#' @export
play_song <- function(songName = "Never Gonna Give You Up Rick Astley", url = NULL, print = FALSE, site = "youtube.com"){

  if(is.null(url)){
    parsedSongName <- gsub(" ", "+", songName)
    url <- paste("https://www.google.com/search?q=site:", site,"+", parsedSongName,"&btnI=", sep = "")
  }

  if(print){
    cat("\n Now Playing: ")
    cat(songName)
    cat("\n")
  }
  browseURL(url)
}

#' Rchestra
#'
#' Plays a song from your web browser
#'
#' This function specifically plays a song carefully curated for when you have hit a non-fatal error in R
#'
#' @seealso play_song
#' @examples
#' options(error = error_songs)
#' nonExistentVariableName
#' @export
error_songs <- function(){
  song.list <- c("Bad Day Daniel Powter",
                 "Oops I Did it Again",
                 "It's the End of the World as We Know it",
                 "Achy Breaky Heart Lyrics Billy Ray Cyrus",
                 "Shake it off Taylor Swift",
                 "My Heart will go on Celine Dione")

  play_song(song.list[sample(length(song.list), size = 1)])
}

#' Rchestra
#'
#' Plays a song from your web browser
#'
#' This function selects a random song from a specified playlist.
#'
#' @param playList vector of strings containing phrases to search for on google
#' @seealso play_song
#' @examples
#' random_song(c("Baby Justin Beiber", "Never Say Never Justin Beiber", "One Less Lonely Girl Justin Beiber"))
#' @export
random_song <- function(playList = NULL, site = "youtube.com", seed = NULL){
  if(!is.null(seed)){
    set.seed(seed)
  }
  play_song(playList[sample(length(playList), size = 1)])
}
