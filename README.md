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

see
https://docs.google.com/document/d/1QUJ-1MPnO_lzURYw1ak8IhjNvxD8hdwomJ6FfpSbL64/edit#
for the most up to date report
