# GFG Hackathon


# AgriEasy 🌿
### Download Product Apk **[here](https://www.dropbox.com/s/guum0mn3mv0hs7j/app-release.apk?dl=0)**
### Hosted Website **[here](http://34.131.171.34/#/)**
<hr>

### About the App
We are excited to introduce Agri Easy - an innovative app designed to address some of the challenges faced in agriculture. We understand that farmers face unpredictable weather patterns, pests and diseases, and struggle with inadequate access to accurate information, resulting in significant losses of resources and yield.

Agri Easy offers a range of features to help farmers make informed decisions and improve their crop management practices. The app provides local weather information, sending alerts for pesticide and fertilizer application based on weather conditions, and incorporates a machine learning model for crop disease detection. Additionally, a chatbot feature is available to answer farmers' questions and provide timely assistance.

With the weather feature, farmers can plan their activities better, reducing the risk of crop failure due to unfavorable weather conditions. The alerts for pesticide and fertilizer application can help farmers use these resources more efficiently, saving costs and minimizing environmental damage.

The crop disease detection feature powered by a machine learning model can help farmers detect diseases early, allowing for timely measures to be taken to prevent the spread of the disease and minimize losses. This can greatly benefit farmers who struggle with accurate disease identification.

Agri Easy is designed to empower farmers with up-to-date and accurate information, helping them make better decisions, save time and money, and improve their crop yield. We are committed to supporting farmers in their efforts to sustain the world's food supply and overcome challenges in agriculture.

Download Agri Easy today and experience the benefits of this innovative app for your farming practices.

<hr>

### Problem statement
1. Farmers lack knowledge about diseases affecting their crops, leading to ineffective disease management practices.
2. Farmers struggle to identify the right countermeasures for diseases due to limited information and resources.
3. Farmers lack access to up-to-date weather information, which affects their decision-making in crop management.
4. Farmers often have questions and need assistance in various agricultural aspects but lack reliable sources for guidance.

<hr>

### Solution

1. Developed a CNN model for accurate and timely detection of plant diseases, helping farmers identify diseases early and take appropriate measures.
2. Integrated a comprehensive list of countermeasures for detected diseases, assisting farmers in choosing the most effective management practices.
3. Utilized a weather API to provide real-time weather information to farmers, enabling them to make informed decisions in crop management.
4. Implemented an in-built agrichat bot powered by GPT 3.5 turbo, providing farmers with interactive assistance and answering their questions in real-time.
<hr>

### Machine Learning Model

#### Dataset: https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset 

#### Data Collection:

A large dataset of images was collected, containing images of various plant diseases from 5 different crops (Apple, Corn, Grape, Potato, and Tomato). The dataset included images of healthy plants as well as plants affected by different diseases, resulting in a total of 16 disease classes. 

#### Notebook : **[Python Notebook](https://github.com/dhanush159/GFG_Hackathon/blob/master/MODEL/Model.ipynb)**

#### Data Augmentation: 

The code uses ImageDataGenerator from TensorFlow's Keras to apply data augmentation during training. Parameters like rotation range and flipping are set. The train_generator reads images, applies augmentations, and generates batches for training. Similar processes are used for validation and testing.

#### CNN Model Architecture: 

The CNN model is built using the Sequential API from Keras, with Conv2D, MaxPooling2D, Flatten, Dense, and Dropout layers. Conv2D filters extract features, MaxPooling2D downsamples, Flatten converts to 1D, Dense produces output, and Dropout mitigates overfitting. The final Dense layer with softmax activation produces a probability distribution for classification.

* Framework : TensorFlow Keras
* Architecture : Convolutional Neural Networks
* Validation Accuracy : 95%

<hr>

### Integration of Google Cloud

#### Storing the Model in a Storage Bucket: 

In our project, we utilized GCP's storage bucket, which serves as a storage container for storing various types of data, including machine learning models. We uploaded our trained machine learning model to a storage bucket in GCP, which provided us with secure and scalable storage for our model. This allowed us to easily manage and access our model from within the GCP environment, making it convenient for deployment and inference. 

#### Deploying the Model using Cloud Functions: 

To deploy our machine learning model and expose it as an API, we utilized GCP's cloud functions. Cloud functions are server less compute resources that allow developers to write and deploy code in response to events or HTTP triggers. We created a cloud function that loads the machine learning model from the storage bucket and exposes a predict function as an API endpoint. This predict function takes an image as input, reads the image, and uses the loaded model to predict the class of the image. The predicted class and additional information about the prediction are then returned as a response from the API. This allowed us to easily deploy our machine learning model and make it accessible for predictions through a RESTful API. 

#### Uses of VM Instance for Model Training and Web Hosting: 

In addition to model deployment, we also utilized GCP's virtual machine (VM) instance for model training and web hosting. We chose an AMD-based N2D virtual machine instance with 8 cores and 16 GB of RAM for our project. This allowed us to configure the hardware resources based on our requirements, ensuring faster and efficient model training compared to using our local laptops. We installed the necessary dependencies and libraries on the VM instance, and trained our machine learning model using the available computing resources, making the training process more efficient and faster. 

Furthermore, we also hosted our web application on the same virtual machine instance. We used Apache2, a widely used web server software, to host our web application. We configured the virtual machine to run the Apache2 server, and deployed our web application, which included a mobile application and a website, on the VM instance. This allowed us to easily manage and host our web application within the GCP environment, providing reliable and scalable hosting for our application.  
<hr>

### Tech Stack Used

- Flutter
- Python
- TensorFlow Keras
- Google Cloud
<hr>

### Screenshots

<img src = "https://user-images.githubusercontent.com/121711028/230654301-3b14fbc6-2a4e-407d-9adb-9d4a66cccb71.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654291-f67b71b2-49ab-4bf3-b276-62aea674421b.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654299-680ed159-a097-4401-8666-84c3c425175a.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654304-43d56489-9864-4fb6-9fe9-840242f21708.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654309-673c9d0e-95e1-48fb-b5ea-778e0108d877.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654307-6d156eb9-e2de-4b81-825a-64469d70877e.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230655785-1e4cd8a9-ce21-4810-b4eb-190a2f19542d.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654282-500b5a2f-c5c8-4185-93c2-26d2486811f2.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230655769-123ec48c-1e17-4f06-994c-84c409c93d6a.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;<img src = "https://user-images.githubusercontent.com/121711028/230654311-43f88451-9ded-46c5-94a4-d3d45c02fcdb.jpg" height = "500">&nbsp;&nbsp;&nbsp;&nbsp;
<hr>

### Future work
* Train a better model with a larger dataset and increase the number of disease classes from 16 to 32 for improved accuracy and performance.
* Add language translation functionality to eliminate language barriers and enhance usability for users from different regions.
* Implement a shop finder feature for locating nearby shops selling agricultural products to improve convenience and efficiency for users.
<hr>

