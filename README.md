
# NFL Regular Season Statistics  
## By Tyler Varzeas  

### Description  
For my final project, I decided to create a database that stores the information of NFL teams, conferences and divisions within those conferences.  
The type of data that I decided to store in the "teams" table include the team names, cities, states, home colors, how many wins, losses and ties they had throughout the regular season.  
A table describing the API endpoints that made sense for this project that were implimented is as follows:  

### Conferences Table
| Paths | Methods |   Parameters   |
| ----- | ------- | -------------- |
| Index |   GET   |  conferences   |
| Show  |   GET   | conferences/id |

### Divisions Table
| Paths | Methods |   Parameters   |
| ----- | ------- | -------------- |
| Index |   GET   |    divisions   |
| Show  |   GET   |  divisions/id  |

### Teams Table
|     Paths     | Methods |         Parameters          |
| ------------- | ------- | --------------------------- |
|     Index     |   GET   |           teams             |
|     Show      |   GET   |          teams/id           |
|     Update    |   PUT   |   teams/id AND JSON request |
|     Create    |   POST  |      teams AND JSON request |
|     Delete    |  DELETE |          teams/id           |

### Questions  
1) When I began this project, I had initially wanted to create a database that acted as a save file and directory of information for my python game from the fundamentals course. However, once we got into week two I began to realize that it would be a bit out of scope for this class and would require a lot more time than 4 weeks to achieve the result I wanted. I figured a sports statistics database would be a good idea since the NFL regular season is comming to a close and it is something a lot of people are interested in at the moment. The design idea of my project was pretty isocrsatic throughout the process, however I did make a few tweaks to column constraints here and there such as making city and state columns nullable and making team names unique.  
2) I chose to utilize ORM for my flask implimentation since I felt as though the basics of SQL were pretty straight forward and further progressing my skills with python and its syntax/logic was more appealing to me.
3) In the future, I would like to implement some sort of table or bridge table that provides information about which teams defeated who, the scores of the games, dates, and so on. It would also be cool to create another table for "Playoffs" and keep track with the brackets for each conference as they progress each week.