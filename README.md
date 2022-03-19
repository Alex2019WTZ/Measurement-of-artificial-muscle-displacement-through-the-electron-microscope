# Measurement-of-artificial-muscle-displacement-through-the-electron-microscope
This program was designed in MATLAB to observe changes in actuators and simultaneously measure the contrast value. 
The final purpose of this program is to analyze contrast values (captured from the camera image from the the microscope) in order to 
calculate the amount of displacement of a given actuator.

Theory Behind Contrast Values

In order to get contrast value from an image, first the MATLAB program obtains a surface plot of light intensity of each pixel as shown in the figure. 
Then, it reads this plot as a matrix of RGB values, outputs a grayscale matrix and calls a rangefilt function to output contrast ranges for each pixel in the image. 
The output of this function will be an image wherein each pixel corresponds to the range of the 3x3 neighbourhood around each pixel in the input image. 
This range is obtained by examining the 3x3 neighbourhood around each pixel, and computing the maximum value minus the minimum value. 
The average of all range values in the image is then taken to obtain a single contrast value

<img width="303" alt="截屏2022-03-06 下午9 28 29" src="https://user-images.githubusercontent.com/89464663/156957514-1db0648b-a809-4d2e-86e5-6fca4cac86ae.png">


Method of approximating the amount of actuation at current stage

The idea of using a sample as the reference to standardize the amount of actuation to the change of contrast value is applied here.
A printed Checkerboard pattern on a glass slice, each with a thickness of 1000 μ m, is applied to correlate the relationship between contrast value and amount of actuation. 
To be more specific, the contrast value of two stacked glass slices is captured and then remove the glass slice initially placed at the bottom of another slice on the top printed with the checkerboard pattern. 
Now the thickness is reduced from 2000 μ m for two stacked slices to 1000 μ m for one slice, thus the amount of displacement is roughly 1000 μ m. 


<img width="806" alt="截屏2022-03-06 下午8 02 29" src="https://user-images.githubusercontent.com/89464663/156957456-d0a9e450-4945-4fb0-aef8-39fb69577cdf.png">
