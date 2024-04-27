create database accenture

select * from ReactionTypes

select * from Content

select * from Reactions

Create TABLE merged_t
(
 Content_ID Varchar(100),
 Content_Type Varchar(30),
 Category Varchar(30),
 Type Varchar(20),
 Datetime DATETIME
)
select * FROM merged_t
drop table merged_t

select Content.Content_ID, Content_Type, Category, Type, Datetime
into merged_t
From Content, Reactions
Where Content.Content_ID = Reactions.Content_ID


select * from ReactionTypes
select * FROM merged_t

select Content_ID, Content_Type, Category, merged_t.Type, Sentiment, Score, Datetime
into merged_t1
From merged_t, ReactionTypes
Where merged_t.Type = ReactionTypes.Type

select * FROM merged_t1 Where Content_ID = '81abd65a-3b76-4574-a0a7-db6bf7184ae2'

select Category, SUM(Score) AS Score_SUM FROM merged_t1 GROUP BY Category ORDER BY SUM(Score) DESC