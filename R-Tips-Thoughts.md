# General R Tips and Thoughts

I spent quite a bit of time translating these exercises from Stata to R, and I ran into many issues along the way despite the fact that I had prior experience working in both Stata and R. Accordingly, I thought I'd compile a list of tips so that you can avoid some of the mistakes I made:

1. If you can't figure something out, use the help() function. I can't tell you how many hours I would have saved if I had just used the help function.
2. Use the internet. Did the help() function not help you enough? The internet might. Someone in the world has run into the same problem that you're running into right now, and they've likely posted a solution to it somewhere.
3. Carrying out the same actions in R and Stata may require markedly different approaches. Your classmate may breeze through an activity in Stata because Stata has a command perfectly suited to that activity, but you may have more trouble because R does not. Don't worry: you'll get them back. R is better suited for some tasks, while Stata is better suited for others.
4. When you're stuck (and when you're not stuck), think critically about what you're putting into functions. For example, let's say I'm trying to find the mean of a list using the mean() function. If R gives me an error, I should first check whether or not the list is something that I can take the mean of. It sounds silly, but I've had errors that stemmed from me trying to take the mean of a list of student names! This happens far more often than you would think (to me, at least).
5. From us to Mark Zuckerberg, everyone makes mistakes while programming. You will see error messages every time you sit down, and that's completely normal.
