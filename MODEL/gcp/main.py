from google.cloud import storage
import tensorflow as tf
from PIL import Image
import numpy as np

model = None
interpreter = None
input_index = None
output_index = None

class_names = ['Apple Blackrot',
               'Apple Cedar Rust',
               'Apple Healthy',
               'Corn Common Rust',
               'Corn Northern Leaf Blight',
               'Corn Healthy',
               'Grape Black Rot',
               'Grape Esca',
               'Grape Healthy',
               'Potato Early Blight',
               'Potato Late Blight',
               'Potato Healthy',
               'Tomato Bacterial Spot',
               'Tomato Early Blight',
               'Tomato Late Blight',
               'Tomato Healthy']

solve = ['Black rot is a fungal disease that can affect apple trees and cause significant damage to crops and fruits. The disease typically appears as small, circular, dark spots on the leaves, which can then spread to the fruit. The spots may develop a dark, concentric ring and the fruit may eventually shrivel up and fall off the tree. The disease can reduce the yield and quality of the apple crop, and if left untreated, it can even kill the tree. To solve black rot, a combination of cultural practices such as good sanitation and pruning, and the use of fungicides like Captan, Myclobutanil, and Thiophanate-methyl can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It can be difficult to know for certain when black rot is completely gone, but by following recommended practices and monitoring the tree carefully, you should see a reduction in the severity of the disease over time.',
         'Apple Cedar rust is a fungal disease that affects apple trees and causes damage to crops and fruits. The disease appears as yellow-orange spots on the leaves, which then develop into brownish-black lesions. Infected fruits may also develop small, brownish-black spots. The disease can reduce the yield and quality of the apple crop, and if left untreated, it can weaken the tree over time. To solve Apple Cedar apple rust, a combination of cultural practices such as pruning and removing infected plant debris, and the use of fungicides like Chlorothalonil, Thiophanate-methyl, and Myclobutanil can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It can be difficult to know for certain when the disease is completely gone, but by following recommended practices and monitoring the tree carefully, you should see a reduction in the severity of the disease over time.',
         'Based on the analysis of the scanned image, it has been determined that the image is healthy. This means that there are no abnormalities or issues that were detected, and the image appears to be in good condition.',
         'Corn Common rust is a fungal disease that affects corn plants and causes damage to crops. The disease appears as small, circular, reddish-brown pustules on the leaves and stems of the corn plant. The pustules can burst, releasing powdery, reddish-brown spores that can spread the disease to other plants. Infected plants may experience stunted growth, reduced yield, and poor quality crops. To solve Corn Common rust, a combination of cultural practices such as planting resistant varieties, rotating crops, and removing infected plant debris, and the use of fungicides like Triazole, Strobilurin, and Chlorothalonil can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It can be difficult to know for certain when the disease is completely gone, but by following recommended practices and monitoring the crop carefully, you should see a reduction in the severity of the disease over time.',
         'Corn Northern Leaf Blight is a fungal disease that affects corn plants and causes damage to crops. The disease appears as cigar-shaped, tan to gray lesions on the leaves, which can coalesce and cause the leaf to die prematurely. Infected plants may experience stunted growth, reduced yield, and poor quality crops. To solve Corn Northern Leaf Blight, a combination of cultural practices such as planting resistant varieties, rotating crops, and removing infected plant debris, and the use of fungicides like Azoxystrobin, Chlorothalonil, and Propiconazole can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It can be difficult to know for certain when the disease is completely gone, but by following recommended practices and monitoring the crop carefully, you should see a reduction in the severity of the disease over time. Additionally, proper crop management practices such as irrigation, nutrient management, and weed control can also help to promote plant health and reduce the risk of disease.',
         'Based on the analysis of the scanned image, it has been determined that the image is healthy. This means that there are no abnormalities or issues that were detected, and the image appears to be in good condition.',
         'Grape Black Rot is a fungal disease that affects grapevines and can cause significant damage to crops. The disease appears as dark, sunken spots on the leaves, which can quickly spread to the fruit clusters and cause them to turn brown and rot. Infected grapes become hard, shriveled, and inedible. To solve Grape Black Rot, a combination of cultural practices such as pruning and thinning vines, removing infected plant debris, and the use of fungicides like Chlorothalonil, Mancozeb, and Pyraclostrobin can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It is essential to apply fungicides early in the growing season to prevent infection and continue applying them at regular intervals as needed. Additionally, proper irrigation and nutrition management practices can help to promote plant health and reduce the risk of disease. It can be challenging to know for certain when the disease is completely gone, but by following recommended practices and monitoring the crop carefully, you should see a reduction in the severity of the disease over time.',
         'Esca is a fungal disease that affects grapevines and can cause significant damage to crops. The disease appears as yellow or reddish-brown spots on the leaves, which can quickly spread to the fruit clusters and cause them to rot. Infected grapes become hard, shriveled, and inedible. To solve Grape Esca, a combination of cultural practices such as pruning and thinning vines, removing infected plant debris, and the use of fungicides like Boscalid, Fluazinam, and Metrafenone can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It is essential to apply fungicides early in the growing season to prevent infection and continue applying them at regular intervals as needed. Additionally, proper irrigation and nutrition management practices can help to promote plant health and reduce the risk of disease. It can be challenging to know for certain when the disease is completely gone, but by following recommended practices and monitoring the crop carefully, you should see a reduction in the severity of the disease over time.',
         'Based on the analysis of the scanned image, it has been determined that the image is healthy. This means that there are no abnormalities or issues that were detected, and the image appears to be in good condition.',
         'Potato Early Blight is a fungal disease that affects potato plants and can cause significant damage to crops. The disease appears as brown spots on the leaves, which can quickly spread to the stems and tubers. Infected potatoes may have brown spots on the skin and soft, brown areas under the skin. To solve Potato Early Blight, a combination of cultural practices such as crop rotation, proper irrigation, and nutrition management, and the use of fungicides like Chlorothalonil, Azoxystrobin, and Copper-based fungicides can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It is essential to apply fungicides early in the growing season to prevent infection and continue applying them at regular intervals as needed. Additionally, proper sanitation practices, such as removing infected plant debris, can help to reduce the risk of disease. It can be challenging to know for certain when the disease is completely gone, but by following recommended practices and monitoring the crop carefully, you should see a reduction in the severity of the disease over time.',
         'Potato Late Blight is a severe fungal disease that can devastate potato crops. The disease affects both the foliage and tubers and can cause significant damage to yields. It appears as large, dark brown, water-soaked spots on the leaves, which eventually turn yellow and die. The disease can quickly spread to the stems and tubers, causing them to rot. To solve Potato Late Blight, a combination of cultural practices such as crop rotation, proper irrigation, and nutrition management, and the use of fungicides like Chlorothalonil, Mancozeb, and Metalaxyl can be effective. Cultural practices help to reduce the spread of the disease and prevent future infections, while fungicides can control the disease and prevent it from spreading. It is essential to apply fungicides early in the growing season to prevent infection and continue applying them at regular intervals as needed. Additionally, proper sanitation practices, such as removing infected plant debris, can help to reduce the risk of disease. It can be challenging to know for certain when the disease is completely gone, but by following recommended practices and monitoring the crop carefully, you should see a reduction in the severity of the disease over time.',
         'Based on the analysis of the scanned image, it has been determined that the image is healthy. This means that there are no abnormalities or issues that were detected, and the image appears to be in good condition.',
         'Tomato bacterial spot is a destructive disease caused by the bacterium Xanthomonas campestris. It affects both the foliage and the fruit, causing significant damage to the tomato crop. The symptoms of bacterial spot include small, dark brown, water-soaked spots on the leaves, stems, and fruit, which can eventually lead to the leaves turning yellow and dying. The disease can spread quickly, especially in warm and humid conditions. To solve bacterial spot, the infected plants should be removed and destroyed, and the remaining plants treated with copper-based fungicides, such as Bordeaux mixture or copper sulfate. It is also essential to practice crop rotation, weed management, and sanitation measures to prevent the disease from recurring. Additionally, planting resistant tomato varieties and avoiding overhead irrigation can help to reduce the risk of infection. It can be challenging to know when the disease is completely gone, but by monitoring the plants closely, applying fungicides at regular intervals, and implementing preventive measures, you can prevent future outbreaks and minimize the damage to your tomato crop.',
         "Tomato early blight is a common fungal disease caused by the fungus Alternaria solani. It primarily affects the leaves of the tomato plant, causing brown, concentric rings that start at the bottom of the plant and work their way up. If left untreated, the leaves can eventually turn yellow and die, which can affect the plant's ability to produce healthy fruit. To solve early blight, the affected leaves should be removed and destroyed, and the remaining plants treated with fungicides, such as chlorothalonil, mancozeb, or copper-based fungicides. It is also essential to practice good cultural practices, such as avoiding overhead irrigation and ensuring adequate spacing between plants for air circulation. To know when the disease is gone, monitor the plants closely for any signs of re-infection, and continue to apply fungicides at regular intervals until the disease is fully under control. By implementing these strategies, you can effectively manage early blight and protect your tomato crop",
         'Tomato late blight is a devastating fungal disease caused by the pathogen Phytophthora infestans. The disease can spread rapidly and can lead to significant crop losses if not managed effectively. It affects both leaves and fruits, causing lesions that are initially dark green and water-soaked, and eventually turn brown and necrotic. The disease can also spread to the stem and petioles, leading to plant death. To solve tomato late blight, it is essential to act quickly and aggressively. Infected plants should be removed and destroyed, and remaining plants should be treated with fungicides, such as chlorothalonil, mancozeb, or copper-based fungicides. To prevent the disease, cultural practices such as crop rotation, good drainage, and avoiding overhead irrigation should be followed. When to know that the disease is gone, continue monitoring the plants for signs of reinfection and applying fungicides as necessary until the disease is under control. By implementing these strategies, you can effectively manage late blight and protect your tomato crop.',
         'Based on the analysis of the scanned image, it has been determined that the image is healthy. This means that there are no abnormalities or issues that were detected, and the image appears to be in good condition.']

# Here you need to put the name of your GCP bucket
BUCKET_NAME = "ank_model_plant_disease"


def download_blob(bucket_name, source_blob_name, destination_file_name):
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(source_blob_name)

    blob.download_to_filename(destination_file_name)

    print(f"Blob {source_blob_name} downloaded to {destination_file_name}.")


def predict(request):
    global model
    if model is None:
        download_blob(
            BUCKET_NAME,
            "models/final_more_img.h5",
            "/tmp/final_more_img.h5",
        )
        model = tf.keras.models.load_model(
            "/tmp/final_more_img.h5", compile=False)

    image = request.files["file"]

    image = np.array(
        Image.open(image).convert("RGB").resize((256, 256))  # image resizing
    )

    image = image/255  # normalize the image in 0 to 1 range

    img_array = tf.expand_dims(image, 0)
    predictions = model.predict(img_array)

    print("Predictions:", predictions)

    predicted_class = class_names[np.argmax(predictions[0])]
    confidence = round(100 * (np.max(predictions[0])), 2)
    solve_class = solve[np.argmax(predictions[0])]

    return {"class": predicted_class, "confidence": confidence, "solve": solve_class}
