# Glossary of Key Terms

See also
[https://developers.google.com/machine-learning/glossary](https://developers.google.com/machine-learning/glossary)
for more detailed definition and explanation.

## Activation function

A function applied to the output of a neuron to introduce non-linearity
(e.g., ReLU, Sigmoid, Softmax, tanh). ReLU introduces sparsity, Sigmoid
squashes values to \[0,1\], Softmax outputs class probabilities, tanh is
a non-linear activation function mapping real numbers into the range
\[-1, 1\].

## Accuracy

A performance metric: the ratio of correct predictions to total
predictions.

## API (Application Programming Interface)

A defined set of rules and functions that allow software components to
communicate with each other. In machine learning, APIs provide access to
models, datasets, or computational tools without needing to understand
their internal implementation. For example, chemists can use a Python
library's API (such as RDKit or TensorFlow) to compute molecular
descriptors or train neural networks through simple function calls.

## Architecture (neural network architecture)

The design of a neural network, including number of layers, types of
layers, and connections.

## Artificial Intelligence

A non-human program or model that can solve sophisticated tasks.

## Attention

A mechanism in neural networks that allows the model to focus on the
most relevant parts of the input when making predictions. Instead of
treating all inputs equally, attention assigns different weights to
different elements, enabling the model to capture long-range
dependencies and context. It is a key component of modern architectures
such as Transformers and Large Language Models.

## Autoencoder

A type of neural network used to learn compressed data representations
and reconstruct inputs.

## Backpropagation

An algorithm used to train neural networks by propagating the error from
the output layer back through the network to update the weights. It
relies on the chain rule of calculus to compute gradients of the loss
function with respect to each parameter, enabling optimization methods
such as stochastic gradient descent to adjust weights and minimize
error.

## Batch

A subset of the training dataset processed together in a single forward
and backward pass of a neural network. Using batches instead of the full
dataset speeds up training and stabilizes optimization. Variants include
****mini-batch**** (small subsets, most common in practice) and
****batch size****, which controls how many samples are included in each
batch.

## Bayesian optimization

An optimization technique that uses Bayesian inference (often with
Gaussian processes) to build a probabilistic model of an unknown
function. It balances exploration (trying uncertain regions) and
exploitation (focusing on promising regions) to find optimal conditions
with as few evaluations as possible. In chemistry and materials science,
Bayesian optimization is used to design experiments, such as tuning
reaction conditions, exploring catalyst compositions, or screening
material properties, while minimizing the number of costly or
time-consuming experiments.

## Bias (model bias)

A form of systematic error in predictions that arises from overly
simplistic model assumptions. High bias can lead to underfitting, where
the model fails to capture relevant patterns in the data.

## Bias (neural network parameter)

A trainable constant added to the weighted sum of inputs in a neuron. It
allows the activation function to shift and improves the flexibility of
the model to fit data.

## Bias (ethical / societal)

Unintended preference or discrimination in data or algorithms that leads
to unfair outcomes. In chemistry and materials science, this may occur
if datasets are incomplete, unbalanced, or skewed toward particular
types of molecules or experiments.

## Categorical data

Data that represent discrete groups or categories rather than numerical
values. Examples include atom types (C, H, O, N), catalyst supports
(oxide, zeolite, carbon), or experimental conditions classified as
"low/medium/high." Such data are often encoded numerically for machine
learning using techniques like one-hot encoding or label encoding.

## Class

A category or label that a machine learning model predicts in a
classification task. For example, in a dataset of catalysts, classes
might be "active" vs. "inactive," or in image recognition,
"nanoparticle" vs. "support." Each training sample is associated with
one (or sometimes multiple) classes.

## Classification

A supervised learning task predicting discrete categories or classes.

## Clipping

A technique used to limit the range of values during training. In neural
networks, the most common form is **gradient clipping**, which sets
a maximum threshold for gradient values to prevent exploding gradients
and stabilize training. Clipping can also refer more generally to
constraining input or output values within predefined bounds.

## Clustering

An unsupervised learning technique that groups data points into clusters
based on similarity. Unlike classification, the groups (clusters) are
not predefined but discovered by the algorithm. Common methods include
k-means, hierarchical clustering, and DBSCAN. In chemistry, clustering
can reveal families of molecules, materials, or spectra with similar
properties.

## Confidence / Uncertainty estimation

Techniques used to quantify how reliable a model's predictions are. A
**confidence score** expresses how certain the model is about a
specific prediction, while **uncertainty estimation** goes further
by assessing the variability or lack of knowledge in the prediction. In
chemistry and materials science, uncertainty estimation helps identify
predictions that require experimental validation, ensuring AI is used
responsibly in high-stakes applications such as catalyst discovery or
drug design.

## Convolution

A mathematical operation that combines two functions to produce a third
one, expressing how the shape of one is modified by the other. In neural
networks, convolution refers to sliding a small matrix (kernel or
filter) over input data (e.g., images, spectra) to detect local patterns
such as edges, peaks, or textures. Convolutions are the core building
blocks of Convolutional Neural Networks (CNNs).

## Convolutional Neural Network (CNN)

A neural network architecture designed for grid-like data such as images
or signals.

## **Cross-entropy loss **function****

Widely used loss function for classification tasks.

## Cross-validation

A model evaluation technique used to assess how well a machine learning
model generalizes to unseen data. The dataset is split into several
folds (subsets). The model is trained on some folds and tested on the
remaining one, and the process is repeated until every fold has served
as a test set. The results are then averaged. Common forms include
****k-fold cross-validation**** and ****leave-one-out
cross-validation****. In chemistry, it is often used to validate models
built on limited datasets of molecules or materials.

## Decision boundary

In classification, the hypersurface in feature space that separates data
points assigned to different classes. For simple models (e.g., logistic
regression), the decision boundary may be a straight line or plane; for
complex models (e.g., neural networks, ensemble methods), it can be
highly non-linear. Visualizing decision boundaries helps illustrate how
a model discriminates between classes.

## Decoder

The counterpart of an encoder, designed to reconstruct or generate data
from the compressed latent representation. In autoencoders, the decoder
rebuilds the original input; in generative models, it can produce new
molecules, spectra, or images from latent vectors.

## Descriptors (molecular descriptors)

Numerical values capturing molecular or nano structural features, used
as ML inputs.

## Dropout

A regularization technique used in neural networks to prevent
overfitting. During training, a fraction of neurons is randomly
"dropped" (temporarily ignored) in each iteration, forcing the network
to learn more robust and distributed representations. At inference time,
all neurons are used, with weights scaled accordingly.

## Early Stopping

A regularization technique in training neural networks where
training is halted once performance on a validation set stops improving.
This prevents overfitting by keeping the model at its best
generalization point rather than allowing it to memorize the training
data.

## Encoder

A component of a machine learning model that transforms input data
into a compact internal representation (often called a latent space). In
chemistry, an encoder might compress molecular descriptors, spectra, or
images into a lower-dimensional vector that captures the most relevant
features. Encoders are used in autoencoders, variational autoencoders
(VAEs), and transformer models.

## Entropy

A measure of uncertainty or disorder. In machine learning, entropy
is used in information theory to quantify the unpredictability of a
probability distribution, and it forms the basis of loss functions such
as cross-entropy. In decision trees, entropy helps decide how to split
data (information gain). In chemistry, entropy describes the degree of
disorder in a system, highlighting the analogy between physical and
informational definitions.

## Epoch

One complete pass of the entire training dataset through the model
during training. Training usually involves many epochs, each consisting
of multiple **batches** (mini-batches). After each epoch, model
parameters are updated based on all the data, and performance is
typically evaluated on a validation set.

## Exploding gradients

A problem in training deep neural networks where gradients grow
excessively large during backpropagation, causing unstable weight
updates and divergence of the model. Often occurs in very deep or
recurrent networks. Gradient clipping is a common remedy.

## Fairness (in ML)

Ensuring that model predictions are unbiased and equitable across
different groups or datasets.

## Feature extraction

The process of deriving informative numerical values from raw data.

## Feature engineering

The process of creating, selecting, or transforming input variables
(features) to improve a machine learning model's performance. It may
involve domain knowledge (e.g., computing molecular descriptors, steric
parameters, or spectral ratios), mathematical transformations
(log-scaling, polynomial terms), or combining multiple raw variables
into more informative features. Good feature engineering can
significantly enhance model accuracy, especially when datasets are
small.

## Feature matrix

A 2D table where each row represents a data sample and each column a
feature.

## Filter (Kernel)

In Convolutional Neural Networks (CNNs), a filter (also called a kernel)
is a small matrix of learnable weights that slides across the input data
to detect local patterns. Each filter produces a feature map
highlighting specific characteristics such as edges, textures, or peaks.
Multiple filters are typically used in a convolutional layer, each
learning to capture different features. In chemistry and materials
science, filters can be trained to detect characteristic patterns in
spectra, diffraction images, or microscopy data, enabling automated
feature extraction from complex experimental datasets.

## GAN (Generative Adversarial Network)

A type of generative model composed of two competing neural networks: a
generator, which creates synthetic data, and a discriminator, which
evaluates whether the data is real or generated. Through this
adversarial process, the generator learns to produce increasingly
realistic data. In chemistry and nanoscience, GANs can be used to
generate new molecular structures, materials, or images (e.g.,
microscopy simulations) that resemble real experimental data

## Generative AI

A branch of artificial intelligence focused on creating new data that
resemble existing datasets. Generative AI models learn the underlying
distribution of the training data and can then produce novel samples
such as text, images, spectra, or molecular structures. Examples include
GANs, VAEs, and Transformers. In chemistry and nanoscience, generative
AI is used for molecular design, catalyst discovery, and the simulation
of experimental data

## Gradient descent

An optimization algorithm used to minimize a loss function by
iteratively adjusting model parameters in the opposite direction of the
gradient. Variants include stochastic gradient descent (SGD), mini-batch
gradient descent, and adaptive methods such as Adam or AdaGrad.

## Graph Neural Network (GNN)

A neural network architecture designed to operate directly on graphs.
Through message passing, GNNs learn node, edge, or graph-level
representations. In chemistry, GNNs are used to predict molecular
properties, reaction outcomes, or material properties directly from
structural graphs.

## Graph representation

Encoding molecules or materials as graphs with nodes (atoms) and edges
(bonds).

## Hallucination

In artificial intelligence, hallucination refers to the generation of
outputs that are plausible but factually incorrect or unsupported by the
data. This issue is particularly common in large language models (LLMs),
which may produce confident but false answers. In scientific
applications such as chemistry or nanoscience, hallucinations can lead
to misleading predictions or fabricated references, highlighting the
need for critical evaluation and validation of AI outputs

## Hidden layer

A layer of neurons in a neural network that lies between the input and
output layers. Hidden layers apply weights, biases, and activation
functions to transform inputs into increasingly abstract
representations. Adding more hidden layers allows deep neural networks
to capture complex, non-linear relationships.

## Holdout

A simple model evaluation technique where the dataset is split into
separate subsets: a **training set** to fit the model and a **test
set** (the holdout set) to assess its performance. Unlike
cross-validation, the split is done only once. Commonly used when data
is abundant.

## Hyperparameter

A parameter set before training that controls model behavior (e.g.,
learning rate, number of layers).

## Hyperparameter tuning

The process of finding the best configuration of model settings
(learning rate, number of layers, etc.).

## Image segmentation

Partitioning an image into meaningful regions or objects.

## Integrity (data integrity, experimental integrity)

The reliability and correctness of data, ensuring reproducibility and
trust in ML results.

## K-means

A clustering algorithm that partitions data into k groups based on
similarity. It works by assigning each data point to the nearest cluster
center (centroid) and then updating the centroids iteratively until
convergence. The value of k (the number of clusters) must be chosen in
advance. In chemistry and materials science, k-means can be used to
group molecules with similar descriptors, classify spectra, or cluster
nanomaterials with related properties

## Label encoding

A method to convert categorical data into numerical values by assigning
an integer to each category. Example: the atom types {C, H, O} could be
encoded as {0, 1, 2}. Unlike one-hot encoding, this approach introduces
an artificial ordinal relationship between categories, which may not
always be appropriate for machine learning models.

## Latent space

A lower-dimensional representation learned by a model that captures the
essential features of the data. In latent space, similar inputs (e.g.,
molecules, spectra, or materials) are placed close to one another,
making patterns and relationships easier to identify. Generative models
such as autoencoders, VAEs, and transformers use latent spaces to
interpolate between known data points and generate new, meaningful
samples. In chemistry, latent spaces are exploited to explore chemical
space, design new molecules, or cluster nanomaterials by hidden
structural similarities.

## Logistic regression

A supervised learning algorithm used for binary (yes/no) classification.
It models the probability of belonging to a class using the logistic
(sigmoid) function applied to a linear combination of input features.
The output is a value between 0 and 1, which can be interpreted as a
probability. In chemistry, logistic regression can be used to classify
compounds as "active" vs. "inactive" catalysts or "toxic" vs.
"non-toxic" molecules.

## Loss function

A mathematical expression that measures the difference between model
predictions and true values.

## Machine learning (ML)

A branch of artificial intelligence that develops algorithms able to
learn patterns from data and make predictions or decisions without being
explicitly programmed for every task. Instead of following fixed rules,
ML models improve their performance as they are exposed to more data. In
chemistry and materials science, ML is used to predict molecular
properties, design catalysts, analyze spectra, process images, and guide
experiments efficiently.

## Mean Absolute Error (MAE)

A common metric for evaluating regression models. It measures the
average of the absolute differences between predicted values and true
values:

where yi are the true values and
ŷi​ the predicted values. MAE is easy to interpret since
it has the same units as the predicted property. In chemistry and
materials science, MAE can be used to assess how well a model predicts
quantities such as activation energies, band gaps, or solubilities.

## Mean squared error (MSE)

A standard metric for evaluating regression models. It measures the
average of the squared differences between predicted values and true
values:

where yi are the true values and ŷi the predicted values.

Because the errors are squared, MSE penalizes large deviations more
strongly than small ones. In chemistry and materials science, MSE can be
used to evaluate models predicting molecular properties such as reaction
energies, band gaps, or adsorption energies.

## Metadata

Descriptive information about data, such as source, units, or
experimental context.

## Message passing

A framework used in graph neural networks where information is exchanged
between nodes (atoms) and edges (bonds). At each iteration, nodes update
their representations by aggregating information from their neighbors.
This makes message passing well suited for molecular and materials data.

## **Neural network**

A machine learning model composed of layers of interconnected neurons.
Neural networks can approximate complex, non-linear relationships
between inputs and outputs. Depending on the architecture, they can
handle tabular data (dense networks), sequential data (RNNs), images
(CNNs), or text (transformers). In chemistry and materials science,
neural networks are used for property prediction, reaction modeling, and
generative design of molecules or materials.

## **Neuron**

The basic computational unit of a neural network, inspired by biological
neurons. A neuron takes one or more input values, multiplies them by
weights, adds a bias, and applies an activation function to produce an
output. In machine learning, neurons are organized into layers that
transform data step by step.

## Normalization

A preprocessing technique in machine learning where features are
rescaled to a fixed range, typically \[0, 1\].

For each feature x, the normalized value is computed as:

where *x*~min~ and *x*~max~ are the minimum and maximum values of the
feature.

Normalization preserves relative distances but ensures all features fall
within the same range. In chemistry and materials science, normalization
is often applied to spectral data, intensities, or descriptor values
before feeding them into machine learning models.

## **One-hot encoding**

A method to convert categorical data into a numerical format suitable
for machine learning. Each category is represented by a binary vector
with all values set to 0 except for a single 1 at the index
corresponding to that category. Example: the atom types {C, H, O} become
\[1,0,0\], \[0,1,0\], and \[0,0,1\].

## Optimizers (AdaGrad / Adam / SGD)

Algorithms that adjust weights during training to minimize loss; Adam
and AdaGrad adapt learning rates, SGD uses stochastic updates.

## Outlier

A data point that deviates significantly from the general pattern of a
dataset. Outliers may result from experimental errors, noise, or genuine
rare phenomena. They can strongly affect statistical measures (such as
the mean) and machine learning models, particularly regression. In
chemistry and materials science, outliers may correspond to faulty
measurements, unusual molecular structures, or rare catalytic behaviors.

Detecting and handling outliers (through removal, robust scaling, or
separate analysis) is an important preprocessing step before training
models.

## Overfitting

When a model learns training data too well and performs poorly on unseen
data.

## Padding

A technique used in Convolutional Neural Networks (CNNs) where extra
values (often zeros) are added around the edges of input data before
applying convolution filters. Padding controls the spatial dimensions of
the output feature maps and helps preserve border information.

Types of padding include:

\- **Valid padding**: no padding is added, output shrinks after
convolution.

\- **Same padding**: zeros are added so that the output has the same
spatial size as the input.

In chemistry and materials science, padding may be used when applying
convolutions to spectra, microscopy images, or 2D/3D material maps,
ensuring that edge features are not lost.

## Perceptron

The simplest form of an artificial neuron, introduced in the 1950s as
one of the first machine learning models. A perceptron computes a
weighted sum of its inputs, adds a bias, and applies a step activation
function to produce a binary output:

where **x** is the input vector, **w** the weights, and *b* the bias
parameter.

While limited to linearly separable problems, the perceptron is the
conceptual building block for modern neural networks, where more complex
activation functions and multiple layers are used. In chemistry,
perceptron-based models can classify simple binary properties, such as
whether a molecule is active or inactive.

## Pooling (in CNN)

A down-sampling operation (e.g., max pooling) that reduces data
dimensionality while preserving features.

## Predictions (output)

The values or labels a model generates when given new inputs.

## *R*^2^ (Coefficient of determination)

A metric for evaluating regression models that measures how well
predictions approximate true values. It is defined as:

where *y*~*i*~ are the true values, *ŷ*~*i*~ the predicted values, and
the mean of true values. An *R*^2^ close to 1 indicates excellent fit; a
negative value indicates worse-than-baseline performance.

## Recurrent Neural Network (RNN)

A neural network architecture designed for sequential data, where
connections between units form directed cycles. RNNs keep a hidden state
that carries information across time steps, making them suitable for
time series, sequences of reactions, or spectra. Variants include LSTM
(Long Short-Term Memory) and GRU (Gated Recurrent Unit).

## ReduceLROnPlateau

A learning rate scheduler that reduces the learning rate when a
monitored metric (such as validation loss) has stopped improving. By
lowering the step size, the optimizer can continue refining weights in
flatter regions of the loss landscape.

## Regression

A supervised learning task predicting continuous values rather than
categories.

## **Regularization**

Techniques to prevent overfitting (dropout, L1/L2 penalties).

## Reinforcement learning

A machine learning paradigm where an agent learns by interacting with an
environment, receiving rewards or penalties for its actions, and
optimizing a policy to maximize long-term reward. Example: exploring
reaction pathways or catalyst design strategies through trial-and-error
simulations.

## ReLU activation function

The Rectified Linear Unit (ReLU) is one of the most widely used
activation functions in modern neural networks. It is defined as:

ReLU introduces non-linearity while being computationally simple. It
avoids the saturation problem of sigmoid and tanh, and helps mitigate
vanishing gradients in deep networks. However, neurons can sometimes
become inactive permanently (*dying ReLU* problem). In chemistry and
materials science, ReLU is typically used in hidden layers of models
predicting molecular or material properties.

## Representations (molecular, nano)

Ways of encoding molecules or nanomaterials numerically for machine
learning.

## Robustness

The ability of a model to maintain performance under noisy or shifted
data conditions.

## Root Mean Squared Error (RMSE)

It is the square root of the Mean Squared Error (MSE), and thus has the
same units as the predicted property, making it more interpretable.

where *y*~*i*~ are the true values and *ŷ*~*i*~ the predicted values.

RMSE penalizes large errors more strongly than small ones, similar to
MSE, but remains directly comparable to the scale of the data. In
chemistry and materials science, RMSE is often reported when assessing
models that predict physical properties such as solubility, reaction
energies, or band gaps.

## Sampling / train / test split

A fundamental step in machine learning where a dataset is divided into
separate parts to evaluate model performance.

Typically:

\- The **training set** is used to fit the model.

\- The **test set**, or **holdout set** is kept aside to evaluate
generalization.

Sometimes, a third subset called the **validation set** is also used to
tune hyperparameters. This process relies on **sampling**, *i.e*.,
selecting which data points go into each subset, often done randomly to
avoid bias. In chemistry and materials science, train--test splits
ensure that models predicting molecular properties or catalytic activity
are evaluated fairly, preventing overfitting to a specific dataset.

## Segmentation (image)

Dividing an image into distinct meaningful segments for analysis.

## Sensitivity / specificity

Metrics for classification performance: sensitivity measures true
positives, specificity measures true negatives.

## Shape

In data science and machine learning, \"shape\" refers to the dimensions
of an array, tensor, or dataset. For example, in Python libraries such
as NumPy or TensorFlow, the shape is expressed as a tuple of integers
indicating the size along each dimension.

<u>Examples:</u>

\- A dataset with 100 molecules each described by 20 features has shape
(100, 20).

\- A grayscale image of 128 x 128 pixels has shape (128, 128).

\- A batch of 32 RGB images of 64 x 64 pixels has shape (32, 64, 64, 3).

Understanding shape is essential for correctly feeding data into machine
learning models, since mismatches lead to errors in training or
prediction.

## Shuffle

Randomly reordering the training data before each epoch. Shuffling
avoids bias due to the order of samples and ensures that mini-batches
are more representative of the overall dataset.

## Sigmoid activation function

A non-linear activation function that maps real values into the range
\[0,1\]:

The sigmoid function was widely used in early neural networks,
especially for binary classification tasks, since its output can be
interpreted as a probability. However, it suffers from vanishing
gradients for large positive or negative inputs. In chemistry and
materials science, sigmoid activations are used in models predicting
binary outcomes (e.g., active vs. inactive catalysts).

## Signal processing (1D data)

Techniques to analyze 1D sequences like spectra or time series before ML
modeling.

## Softmax activation function

An activation function that converts a vector of real numbers into a
probability distribution. Each output value lies between 0 and 1, and
all outputs sum to 1.

The softmax of an input vector** z **with components**
***z***~***i***~ **is defined as:****

****for** ***i*** **= 1, \...,** ***K*****.****

Softmax is typically used in the output layer of classification
neural networks to assign probabilities to** ***K*** **possible classes.
In chemistry and materials science, it can be applied to classification
tasks such as predicting the class of a catalyst (active/inactive),
material type, or reaction pathway.****

## Standardization (StandardScaler)

A preprocessing technique in machine learning where features are
rescaled to have zero mean and unit variance. For each feature x, the
standardized value is computed as:

where μ is the mean and σ is the standard deviation of the feature.\
Standardization ensures that features with different units or scales
contribute equally to model training. In chemistry and materials
science, it is often applied to molecular descriptors or spectral
intensities before training regression or classification models.

## Stride

A parameter in Convolutional Neural Networks (CNNs) that defines how
far the convolution filter moves across the input at each step.

- A stride of 1 means the filter slides one unit at a time,
producing highly detailed feature maps.****

- Larger strides (e.g., 2) reduce the size of the output by skipping
positions, effectively downsampling the input.
Stride works together with padding to control the spatial dimensions
of the output. In chemistry and materials science, stride is important
when analyzing spectral data or images of materials, as it determines
the resolution of extracted features.

## Supervised learning

A type of machine learning where the model is trained on labeled data, i.e. input--output pairs are known. The goal is to learn the mapping from inputs (features) to outputs (targets). Example: predicting
solubility from molecular descriptors. It is used to mimic the behavior
of a more complex or expensive system, enabling faster predictions and
optimization.

## Surrogate models

Surrogate models are often built using machine learning (e.g., neural
networks, Gaussian processes, or polynomial fits) trained on a limited
set of high-fidelity data. In chemistry and materials science, surrogate
models can replace costly quantum chemistry or molecular dynamics
calculations by providing rapid estimates of properties such as
activation energies, adsorption energies, or band gaps. They are also
used in design strategies where many candidate molecules or materials
must be screened efficiently.

## Tanh activation functions

A non-linear activation function mapping real numbers into the range
\[-1,1\]:

The tanh function is symmetric around zero, unlike the sigmoid, and was
widely used in neural networks before ReLU became dominant. It remains
useful in recurrent architectures such as LSTMs.

## Transfer learning

Using a pretrained model as a starting point for a new task with limited
data.

## **Unsupervised learning**

A type of machine learning where only input data are provided, with no
labels. The model seeks to identify patterns, clusters, or reduced
representations in the data. Example: grouping nanomaterials with
similar spectral features.

## VAE (Variational Autoencoder)

A generative model that learns a probabilistic mapping between input
data and a latent space. The encoder compresses data into a distribution
in the latent space, while the decoder reconstructs data from sampled
latent vectors. Unlike standard autoencoders, VAEs enforce structure in
the latent space, enabling smooth interpolation and generation of new,
realistic samples. In chemistry, VAEs are applied to design new
molecules or materials by exploring continuous latent representations of
chemical structures

## Validation set

A dataset used to tune hyperparameters and assess model performance
during training.

## Vanishing gradients

A problem in training deep neural networks where gradients become
extremely small during backpropagation, preventing effective weight
updates. This slows or stalls learning, especially in very deep networks
or when using activation functions like sigmoid or tanh. Solutions
include using ReLU activations, residual connections, or specialized
architectures such as LSTMs.

## Video frame processing

Analyzing or transforming images frame by frame to create or study
videos.

## Weight initialization

The method used to set initial values of neural network weights before
training.

## Whitelist / black box / interpretability

Interpretability relates to understanding model decisions; a \'black
box\' model is opaque, while whitelisting refers to transparent rules or
features.
