# Kaggle-Allstates
A project for Kaggle competition https://www.kaggle.com/c/allstate-claims-severity/data and CSCC11 at UTSC.

To run it for yourself:
Some edits may be required in regGraph and regMain to choose your dataset.

regLoad;regGraph;
A crude suggestion of K values will be presented. It is highly recommended that the user prunes the K values they want.
It may be wise to set MAX_K to a lower value to reduce runtime. regGraph is estimated to take 20 minutes, give or take.

regMain;
With your choice of weights and K values, bag the results from all 130 dimensions.
A sample of choices for 130 dimensions is available in src/edata.mat


The guideline from CSCC11 is as follows:
	1. Build your own baseline solution. Apply at least one method learned in this class on the problem(s). You need to use your own implementation for this, but you are not limited to Matlab if you do not want to re-use your previous code.
	2. Experiment with a more advanced solution from someone else. Find another baseline solution that achieves very good public leaderboard score that is shared by other participant (check “Forum” and “Kernels” section of the competition(s)). Run their code, experiment with it by tweaking and changing things. Try to understand what they do and why is it better than your baseline.  
	3. Try to improve on the advanced baseline by exploring the following: feature engineering, more ML model choices, better model selection, better hyperparameter tuning, etc. For this part, you can use any implementation of any model. It does not have to be your code, but you should try to understand the model and code. I recommend scikit-learn.
	4. Write a report on things you tried, your analysis and findings. (More below)
	5. Share your code and report on github.

To this end, course code is first uploaded (in its original matlab format) and will be slowly modified.


1. The first attempt is done by removing all non-numerical values from training data, and running multi-dimensional input regression on it.

current general plan:
least square basis regression for every dimension, second best k is chosen per dimension. save the output for future runs.
every dimension gets a randomly initialized and standardized (sums to 1) weight. 

depending on each of their individual performance, reweight them once, calculate weighted estimate
potentially weight descent?

weight descent:
	readjust weights to match performance of each dimension's error
		i don't know how to do this other than very gradually
	calculate combined weighted estimate, compare to previous
	find local minimum and stop
