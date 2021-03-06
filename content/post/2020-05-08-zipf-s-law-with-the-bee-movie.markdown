---
title: Zipf's Law with the Bee Movie
author: chfal
date: '2020-05-08'
slug: zipf-s-law-with-the-bee-movie
categories: []
tags: []
---

# The Bee Movie

[The Bee Movie](https://www.rottentomatoes.com/m/bee_movie) is possibly one of the most infamous and widely-memed movies. Hell, a human woman falls in love with a weirdly sexualized bee played by Jerry Seinfield, and many laws of physics are broken - what could be better?

After seeing [this TikTok](https://www.tiktok.com/@ryanharrison16/video/6820314252272766214?u_code=d978l6hcbld044&preview_pb=0&language=en&_d=d978l4j4l59ag8&timestamp=1588992709&utm_campaign=client_share&app=musically&utm_medium=ios&user_id=6756743759264465926&tt_from=sms&utm_source=sms&source=h5_m) where a person creates a script in Python to write the Bee Movie script by text, I decided to do some sentiment analysis with the Bee Movie script (which I downloaded [here](https://web.njit.edu/~cm395/theBeeMovieScript/))

# Word Frequency

I made this cute little graph that shows the word frequency.

```r
tokenized_bee_movie %>%
  count(word, sort= TRUE) %>%
  top_n(10) %>%
  mutate(word = reorder(word,n)) %>%
  ggplot(aes(word,n, fill=word)) +
  geom_col() +
  xlab(NULL) +
  coord_flip() +
  labs(title="The Most Common Words in the Bee Movie") +
  scale_fill_manual(values=c("goldenrod1","black","goldenrod1","black","goldenrod1","black","goldenrod1","black","goldenrod1","black")) +
  theme_bw() +
  theme(legend.position="none")
```

```
## Selecting by n
```

<img src="/post/2020-05-08-zipf-s-law-with-the-bee-movie_files/figure-html/unnamed-chunk-2-1.png" width="100%" />

# Zipf's Law

The new addition to this script that makes it different from the many, many, _many_ word frequency graphs I've made on this blog before (apparently amateur text-mining is my thing) is that today I used Zipf's Law.


```r
zipfs_bee_movie %>%
  ggplot(aes(rank,term_frequency)) +
  geom_line(col="goldenrod", lwd=2) +
  scale_x_log10() +
  scale_y_log10() +
  theme_bw() +
  labs(title="Zipf's Law for the Bee Movie")
```

<img src="/post/2020-05-08-zipf-s-law-with-the-bee-movie_files/figure-html/unnamed-chunk-3-1.png" width="100%" />

Zipf's Law states that the frequency of any word is inversely proportional to its rank in the frequency table of the words. We can test whether Zipf's Law holds true by calculating a score that relates the rank to the row number. I used this formula: \(row \ number / term \ frequency\) to create a score for each and graphed it on a log-log axes as done [here](https://www.tidytextmining.com/tfidf.html#zipfs-law).

The resulting graph is supposed to be a fairly straight line, which seems to suggest that the Bee Movie script generally follows Zipf's Law. That being said, there seem to be lots of words which are used only once because they seem to have low rank and aren't very frequent. That being said, I may have misinterpreted this graph incorrectly because I have never worked with Zipf's Law before.
