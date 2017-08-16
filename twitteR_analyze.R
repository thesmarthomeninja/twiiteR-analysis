#Getting Started Installs
install.packages(c("devtools", "rjson", "bit64", "httr", "twitteR"))
#install_github("twitteR", username="geoffjentry")
library(twitteR)
library(rjson)
library(httr)
library(bit64)
library(devtools)


setup_twitter_oauth('J5Gd3tmR3EjUdKlvDQ4dkrev4', 'kXrfyLSfLzpdgfpkSWvEz4mY3eD8O9KfceDF2QcTAkV6ArpZbz', '848487158931259392-2FZeF5aFQNe7Y7nQzero6RvfvZ7ffP6', 'PuA99W9q5jtXk24RNP0IiQsQempbdktv2QcRjlaNdbPWA')
#twitteR(.httr-oauth)

#oauth_service_token()

#usereamples
user <- getUser('nest')
#user <- getUser('smartthings')

#friends
#friends <- user$getFriends(n = '100')
friends <- user$getFriends(n = '1500')
friends <- do.call("rbind", lapply(friends, as.data.frame))
#friends <- user$getFollowers(n = '2500')

#followers
#friends <- followers
#friends <- ('followers')
followers <- user$getFollowers(n = '1500')
followers <- do.call("rbind", lapply(followers, as.data.frame))
#friends <- user$getFriends(n = '500')


#RESTART R session!
.rs.restartR()

#Next Round
require(twitteR)
setup_twitter_oauth('J5Gd3tmR3EjUdKlvDQ4dkrev4', 'kXrfyLSfLzpdgfpkSWvEz4mY3eD8O9KfceDF2QcTAkV6ArpZbz', '848487158931259392-2FZeF5aFQNe7Y7nQzero6RvfvZ7ffP6', 'PuA99W9q5jtXk24RNP0IiQsQempbdktv2QcRjlaNdbPWA')

######SEARCHES FUN#######
#searchTwitter("smarthomeninja")

searches <- searchTwitter('amazonecho', n=1500)
#put that shizz in a data frame
searchterms <- do.call("rbind", lapply(searches, as.data.frame))


####TWEEETSS##### #The original example used the twitteR library to pull in a user stream
#rdmTweets <- userTimeline("psychemedia", n=100)
#Instead, I'm going to pull in a search around a hashtag.

rdmTweets <- searchTwitter('#smartthings', n=500)
#put that shizz in a data frame
HashtagSearches <- do.call("rbind", lapply(rdmTweets, as.data.frame))

# Note that the Twitter search API only goes back 1500 tweets (I think?)
#Create a dataframe based around the results

#Here are the columns
#names(df)
#And some example content
#head(df,3)
#View(df)

#unknown turns back into values maybe?
#usernames <- followers$screenName
#temp_df <- twListToDF(lookupUsers(followers))
#temp_df <- twListToDF(lookupUsers(followers))
#temp_df <- followers(lookupUsers(screenname))


#figure out how to bind it all onto seperate sheets


#You can write to multiple sheets with the xlsx package. You just need to use a different sheetName for each data frame and you need to add append=TRUE:

library(xlsx)
write.xlsx(followers, file="twitteranalysis.xlsx", sheetName="followers", row.names=FALSE)
write.xlsx(friends, file="twitteranalysis.xlsx", sheetName="friends", append=TRUE, row.names=FALSE)
write.xlsx(searchterms, file="twitteranalysis.xlsx", sheetName="searchterms", append=TRUE, row.names=FALSE)
write.xlsx(HashtagSearches, file="twitteranalysis.xlsx", sheetName="HashtagSearches", append=TRUE, row.names=FALSE)
#write.xlsx(friends, file="twitteranalysis.xlsx", sheetName="friends", append=TRUE, row.names=FALSE)

#