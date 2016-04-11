library(RedditExtractoR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(shiny)
library(SnowballC)

testurl <- "https://www.reddit.com/r/The_Donald/comments/4ch9xa/im_gonna_kick_your_kid_in_the_ribs_for_dressing/"

pal2 <- brewer.pal(8,"Dark2")
clean_text <- function(some_txt)
{
  some_txt = gsub("&amp", "", some_txt)
  some_txt = gsub("(RT|via)((?:\b\\W*@\\w+)+)", "", some_txt)
  some_txt = gsub("RT\\w+", "", some_txt)
  some_txt = gsub("RT+", "", some_txt)
  some_txt = gsub("@\\w+", "", some_txt)
  #some_txt = gsub("[[:punct:]]", "", some_txt)
  #some_txt = gsub("[[:digit:]]", "", some_txt)
  some_txt = gsub("https\\w+", "", some_txt)
  #some_txt = gsub("[ t]{2,}", "", some_txt)
  #some_txt = gsub("^\\s+|\\s+$", "", some_txt)
  # define "tolower error handling" function
  try.tolower = function(x)
  {
    y = NA
    try_error = tryCatch(tolower(x), error=function(e) e)
    if (!inherits(try_error, "error"))
      y = tolower(x)
    return(y)
  }
  some_txt = sapply(some_txt, try.tolower)
  some_txt = some_txt[some_txt != ""]
  names(some_txt) = NULL
  return(some_txt)
}

                       
                        