<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>اكتشاف الحواف - موقع ويب</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            direction: rtl;
            background-color: #f0f0f0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        canvas, img {
            max-width: 100%;
            border: 1px solid #ccc;
            margin: 10px 0;
        }
        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>اكتشاف الحواف في الصور</h1>
        <p>قم برفع صورة لمعالجتها باستخدام تقنية Canny Edge Detection</p>
        <input type="file" id="imageInput" accept="image/*">
        <br>
        <img id="originalImage" alt="الصورة الأصلية">
        <canvas id="canvasOutput"></canvas>
    </div>

    <!-- تحميل OpenCV.js -->
    <script src="https://docs.opencv.org/4.x/opencv.js" async onload="onOpenCvReady()"></script>
    <script>
        function onOpenCvReady() {
            console.log("OpenCV.js جاهز!");
            document.getElementById('imageInput').addEventListener('change', processImage);
        }

        function processImage(e) {
            const file = e.target.files[0];
            const imgElement = document.getElementById('originalImage');
            const canvas = document.getElementById('canvasOutput');
            const ctx = canvas.getContext('2d');

            // عرض الصورة الأصلية
            const url = URL.createObjectURL(file);
            imgElement.src = url;

            imgElement.onload = function() {
                canvas.width = imgElement.width;
                canvas.height = imgElement.height;
                ctx.drawImage(imgElement, 0, 0);

                // معالجة الصورة باستخدام OpenCV.js
                let src = cv.imread(imgElement);
                let dst = new cv.Mat();

                // تحويل إلى تدرج الرمادي
                cv.cvtColor(src, dst, cv.COLOR_RGBA2GRAY);
                // تقليل الضوضاء باستخدام Gaussian Blur
                cv.GaussianBlur(dst, dst, new cv.Size(5, 5), 0);
                // تطبيق Canny Edge Detection
                cv.Canny(dst, dst, 100, 200, 3, false);

                // عرض النتيجة في Canvas
                cv.imshow('canvasOutput', dst);

                // تنظيف الذاكرة
                src.delete();
                dst.delete();
            };
        }
    </script>
</body>
</html>