# Froth-Segmentation

## Info
This project was made during a 2-week internship at the Helmholtz-Zentrum Dresden-Rossendorf ([HZDR](https://www.hzdr.de/db/Cms?pNid=129)) and employed the [StarDist](https://github.com/stardist/stardist) model for instance segmentation to study the flotation of mineral froth. The prototype solution I made, trained with only 10 hand-labelled images, performed very well already and enabled the research team to automatically track froth bubbles.

The image sequence dataset (roughly 10 TB) was remarkably complex. So it was assumed that no good and general solution would exist too soon; but the created [StarDist](https://github.com/stardist/stardist) prototype already could predict images from different cameras and bubble types reasonably well, even when they were mostly unrelated to the train data.

## Dataset

Here is a depiction of one experiment run with sample images (all credit goes to the creators listed in [abstract.pdf](https://github.com/HenningBeyer/Side-Projects/blob/main/Froth-Segmentation/abstract.pdf); I thank the creators for allowing me to use the abstract and this figure):

![abstract_img](https://github.com/HenningBeyer/Side-Projects/assets/60894149/2aa980c8-bbee-42b7-8964-724d4f70ed1c)

To portray the difficulty of the dataset, lets list its characteristics:
  - most of the 62 experiment sequences hat around 25.000 grayscale images (5 MB each) for two different cameras
  - each image sequence had 4 different froth phases which had very different bubble types (big, medium, small, tiny, foamy, transparent, bright, reflective, very dark, bursting, ...)
  - there were many gaps of unrecorded images in a sequence and many froth-scraping phases which dirupted the view
  - the images where .npy files that could not be watched without loading them from a remote data server

### Tab 'EDA + Filters':
This made data analysis very challenging, which lead to the following [ipywidgets](https://ipywidgets.readthedocs.io/en/latest/) UI I made from scratch:

![Notebook_EDA_tab](https://github.com/HenningBeyer/Side-Projects/assets/60894149/0b2f906f-a229-4c0e-9420-182898f94913)

This UI tab above gives the following funtionalities:
  - any image of any experiment could be viewed in a cropped format (this is excellent for viewing the dataset!)
  - each image sequence could be viewed like in a video player by pressing the arrow keys on the image slider
  - from each image, a square sub image could be handpicked as potential train image for [StarDist](https://github.com/stardist/stardist)
    - (about 300 512x512 images were initially handpicked, covering each camera, froth phase and bubble type)
    - (only 10 selected images could be labeled at the weekend with [QuPath](https://github.com/qupath/qupath))
    - (This covered around 1200 instances of small/tiny bubbles, 150 normal-sized bubbles, and around 12 big bubbles)

### Tab 'Model Inference':

After a brief labelling session (20 h), the model was trained with the following UI:

![Notebook_model_inference_tab](https://github.com/HenningBeyer/Side-Projects/assets/60894149/a431a6c4-9885-45e1-8829-0d99e967dcfc)

The 'Model Inference' tab featured:
- a preview of the effects of data augmentation on the colored mask (similar to the depiction)
  - [albumentations](https://albumentations.ai/) made the implementation pretty straightforward
  - data augmentation multiplied the training data with the effects of flipping, translating, transposing, zooming, rotating, sharpening, contrasting, brightening, noise, blurring and distortion on the image and its mask
- a simple training section which allowed to start the model training with specified parameters
- and a test section where the model could be applied to any image of the dataset

### Conclusion
The approach works well already, but it will definetly need more training images, which include a more diverse set of bubble instances. Some bubbles are also bigger than 512x512 pixels, which are difficult to predict for the model and would require 1024x1024 images, but this would be too much labeling effort.

### Acknowledgments
I thank the research team (see [abstract.pdf](https://github.com/HenningBeyer/Side-Projects/blob/main/Froth-Segmentation/abstract.pdf)) to allow me the use of the notebook and the two screenshots above. They also allowed me to use their conference abstract and image for context (see files). Their paper will be released later and be available [here](https://www.hzdr.de/db/!Publications?pNid=head&pSelMenu=0&pSelTitle=38549).
I also would like to especially thank my great internship supervisor and many other people that were very supportive.

Overall, the internship was a very great expeerience, and the people were very nice too!
