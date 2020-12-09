# Image classification using textural features
This repository contains some MATLAB scripts with a simple implementation of image classification using properties of [gray-level co-occurence matrix](https://en.wikipedia.org/wiki/Image_texture#Co-occurrence_Matrices).

More specifically, I use Contrast, Homogeneity (Correlation) and Energy (Entropy) to classify grayscale textures that originate from 6 distinct classes, with the help of [3-Nearest Neighbors (3-NN)](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) and [Minimum Euclidean Distance](http://sar.kangwon.ac.kr/etc/rs_note/rsnote/cp11/cp11-6.htm) classifiers.

The 3 original TIFF images/classes are located in the [original-images](/original-images) directory.

Using these 6 images, I generate 24 images as training samples (4 from each class) by extracting parts of the original images.

I also generate 20 random images as test objects that are randomly selected from the classes and consist of parts of the original images.

The classification features consist of the first Contrast, Homogeneity and Energy.

Using these 3 features, I classify the random objects to the 6 classes, using the classifiers mentioned above.

To execute the code using MATLAB or GNU Octave, naviagte to the directory with the scripts and run [main.m](/main.m)
