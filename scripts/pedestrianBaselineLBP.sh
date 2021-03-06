#!/bin/bash

#Right now this is just a simple proof of concept. No quanititative eval is performed
# but instead the qualitative results are displayed.

#Make sure you set your data path. This will likely by your openbr/data directory.
INRIA_PATH=$DATA/INRIAPerson

br -useGui 0 \
    -algorithm "Open+Cvt(Gray)+Rename(neg,0)+BuildScales(Blur(2)+LBP(1,2)+SlidingWindow(Hist(59)+Cat+LDA(isBinary=true),windowWidth=10,takeLargestScale=false,threshold=3),windowWidth=10,takeLargestScale=false,minScale=4)+Discard" \
   -path $INRIA_PATH/img \
   -train $INRIA_PATH/sigset/train.xml pedModel \
   -enroll $INRIA_PATH/sigset/testSmall.xml pedResults.xml

br -parallelism 0 -algorithm Open+Draw+Show -path /Users/m29389/Data/INRIAPerson/img/ -enroll pedResults.xml
