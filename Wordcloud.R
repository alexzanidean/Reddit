library(RedditExtractoR)
library(wordcloud)
library(tm)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")


data <- reddit_content(URL=
  "https://www.reddit.com/r/The_Donald/comments/4ch9xa/im_gonna_kick_your_kid_in_the_ribs_for_dressing/")
data.text <- data$comment
data_corpus = Corpus(VectorSource(data.text))
#data_corpus <- tm_map(data_corpus,
#                      content_transformer(function(x) iconv(x, to='UTF-8', sub='byte')),                       mc.cores=1, lazy=TRUE)
#data_corpus <- tm_map(data_corpus, content_transformer(tolower), lazy = TRUE)
data_corpus <- tm_map(data_corpus, function(x)removeWords(x,stopwords('english')), lazy = TRUE)
data_corpus <- tm_map(data_corpus, function(x)removeWords(x,stopwords("french")), lazy= TRUE)
#data_corpus <- tm_map(data_corpus, stemDocument, mc.cores=1)

myDTM = TermDocumentMatrix(data_corpus, control = list(minWordLength = 3))
m = as.matrix(myDTM)
v = sort(rowSums(m), decreasing = TRUE)

wordcloud(names(v),v ,min.freq=3,max.words=200, random.order=F, colors=pal2, rot.per=.2)
