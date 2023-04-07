## GFG_Hackathon
### About
Agriculture is a critical sector that sustains the world's food supply. However, farmers face various challenges such as unpredictable weather patterns, pests and diseases, and inadequate access to or incorrect, outdated or incoherent information. As a result, significant quantities of resources are wasted and yield lost due to avoidable errors. These include use of incorrect pesticides due to the wrong diagnosis of the disease and using incompatible fertilizers amongst others. 

In response to these challenges, we bring forward an innovative app - Agri Easy that provides solutions to some of these issues. 

The app offers several features, including local weather information, alerts for pesticide and fertilizer application, and crop disease detection using image recognition technology. These features can be beneficial for farmers who often lack access to up-to-date and accurate information.

The app's weather feature can help farmers plan their activities better and minimize the risk of crop failure due to weather conditions. The alerts for pesticide and fertilizer application can help farmers use these resources more efficiently, which can reduce costs and minimize environmental damage.

Moreover, the app's image recognition technology can help farmers detect crop diseases early, which is essential for preventing significant losses. Farmers often have difficulty identifying diseases accurately and quickly, which can lead to delays in taking necessary measures to control the spread of the disease.

Thus our app can help farmers make informed decisions, save time and money and improve crop yield.

### Problem statement
1. Identify diseases in plants from images of the infected parts.
2. Suggest the right counter-measure for the same.
3. Provide up-to-date weather information.
4. Assist the farmers in questions that they may have.

### Solution
1. CNN model for image processing for detection of plant diseases.
2. Select the best counter-measure from a list of available options
3. Using a weather API 
4. Using an in-built chat bot that is powered by GPT 3.5 turbo

#### Data Augmentation: 

The code utilizes the ImageDataGenerator class from the tensorflow.keras.preprocessing.image module to perform data augmentation on the image data during model training. The train_datagen object is created with parameters such as rotation range (-10 to 10 degrees) and horizontal flipping. The rescale parameter is used to normalize pixel values in the image to a range of 0 to 1. The train_generator is then created using the flow_from_directory() method, which reads images from the training directory, applies the specified augmentations, and generates batches of augmented images for training the model. A similar process is followed to create validation and test generators for validation and testing during the training process. 

#### CNN Model Architecture: 

The CNN model is created using the Sequential API from Keras. The model architecture consists of multiple layers, including Conv2D, MaxPooling2D, Flatten, Dense, and Dropout layers. The Conv2D layers apply filters to extract local patterns or features from the input images. The MaxPooling2D layers downsample the feature maps to capture the most important features. The Flatten layer converts the feature maps into a 1D array for input into the fully connected layers. The Dense layers are fully connected layers that produce output values using weights and biases. The Dropout layer is used to mitigate overfitting by randomly setting a percentage of input units to 0 at each training iteration. The final Dense layer has units equal to the number of classes in the dataset and uses the softmax activation function to produce a probability distribution over the classes as the model's output. 

#### Model Compilation: 

The CNN model is compiled using the compile() method. The optimizer parameter is set to 'adam', which is a popular optimization algorithm for deep learning models. The loss parameter is set to SparseCategoricalCrossentropy, which is used to measure the difference between predicted and actual labels in integer form. The metrics parameter is set to 'accuracy', which is used as the evaluation metric during training and testing. 
 
#### Dataset: https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset 

#### Data Collection: A large dataset of images was collected, containing images of various plant diseases from 5 different crops (Apple, Corn, Grape, Potato, and Tomato). The dataset included images of healthy plants as well as plants affected by different diseases, resulting in a total of 16 disease classes. 

Check the notebook for more information. 

### Screen shots

<img src = "https://user-images.githubusercontent.com/121711028/230654301-3b14fbc6-2a4e-407d-9adb-9d4a66cccb71.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654291-f67b71b2-49ab-4bf3-b276-62aea674421b.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654299-680ed159-a097-4401-8666-84c3c425175a.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654304-43d56489-9864-4fb6-9fe9-840242f21708.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654309-673c9d0e-95e1-48fb-b5ea-778e0108d877.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654307-6d156eb9-e2de-4b81-825a-64469d70877e.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230655785-1e4cd8a9-ce21-4810-b4eb-190a2f19542d.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654282-500b5a2f-c5c8-4185-93c2-26d2486811f2.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230655769-123ec48c-1e17-4f06-994c-84c409c93d6a.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654311-43f88451-9ded-46c5-94a4-d3d45c02fcdb.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;






### Future work

