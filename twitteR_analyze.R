#Getting Started Installs
install.packages(c("devtools", "rjson", "bit64", "httr", "twitteR"))
#install_github("twitteR", username="geoffjentry")
library(twitteR)
library(rjson)
library(httr)
library(bit64)
library(devtools)

#remove the # and add your information and to get an api key you need to setup an api key here: https://apps.twitter.com/ 
# and go to keys & acccess tokens tab to grab your information to put in the next line (12) here:
#setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)
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
#setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)

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



#You can write to multiple sheets with the xlsx package. You just need to use a different sheetName for each data frame and you need to add append=TRUE:

library(xlsx)
write.xlsx(followers, file="twitteranalysis.xlsx", sheetName="followers", row.names=FALSE)
write.xlsx(friends, file="twitteranalysis.xlsx", sheetName="friends", append=TRUE, row.names=FALSE)
write.xlsx(searchterms, file="twitteranalysis.xlsx", sheetName="searchterms", append=TRUE, row.names=FALSE)
write.xlsx(HashtagSearches, file="twitteranalysis.xlsx", sheetName="HashtagSearches", append=TRUE, row.names=FALSE)
#write.xlsx(friends, file="twitteranalysis.xlsx", sheetName="friends", append=TRUE, row.names=FALSE)

#
