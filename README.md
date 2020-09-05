# Centurion

We help visually-impaired people to navigate MRT stations!

## Getting Started

1. Make sure the visually-impaired user's in-built screen reader is activated.
2. Install this project's APK in his device!
3. (S)He is good to go! 

(Visually-impared friendly instructions on gettings started is on the way)

The app helps visually-impaired people to follow the right tactile pavings depending on his starting location and his destination. Location information is collected from the phone's GPS system. Location information is stored in DynamoDB, to decide the MRT station entrance nearest to the visually-impared user.


## Background Information

This project was submitted as part of Build On Singapore 2020 Finalist round, under problem statement 14: Inclusivity in Urban Planning. For more information, you may visit our video submission:

https://www.youtube.com/watch?v=aJoJPrtM8c4

This project uses Flutter as its front-end and AWS Lambda as a serverless backend. It communicates by sending RESTful API calls to the lambda handler, with the API powered by Amazon API Gateway. Tactile pavings data are stored in Amazon DynamoDB in the form of undirected weighted graphs, and paths are calculated using Uniform Cost Search algorithm. The path is then converted to basic strings of instructions (e.g. "Left", "Right", "Down B2"), to be further processed and clarified by the front end.

## Sample App Demo

To listen to guiding sound, you may visit our youtube submission which includes screen-reader demo.

![alt text](https://github.com/marcus2k/AWS-Centurion/tree/master/others/app-demo.gif "Centurion App Demo")
