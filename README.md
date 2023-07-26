## Optimizing Functions with Methods Research and Artificial Neural Networks
Building and optimizing certain algorithms from scratch using Matlab: 
* Hill-Climbing Algorithm
* Simulated Annealing Algorithm
* Random Search Algorithm
* Artificial Neural Networks

## Main Problem 

In the search algorithms the main problem was to find the maximums of the follow functions, in this project was used a = 3 e b = 10:
![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/f952255b-391e-4491-9054-b000a3d6f819)

In the Artificial Neural Networks the main problem was to classify between 3 classes:

![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/7ff6f923-9111-4652-b776-416b9548cdf8)


# Hill-Climbing Algorithm

The **Hill-Climbing algorithm** is a search technique local, with the aim of proposing a configuration and modifying it until obtaining a solution. This algorithm is a kind of local search algorithm, i.e. at every moment the algorithm only considers the states immediately accessible from the current state. Assuming that the type of function is maximization, its operation consists of in climbing the “hill” until finding the optimal solution. Someway iterative, it will always look for new solutions in the neighborhood and if this one is better choose this one as the new one, otherwise another neighbor is chosen and it is checked whether the new solution is the best. The execution of this algorithm ends when an answer is reached stop, just as there is no improvement in the best solution after a few iterations or when a given execution timeout passes.
This was the result of the main problem using 10 iterations:

![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/cf672f74-6838-4aae-ae3c-764c5fca3831)


# Random Search Algorithm
The **Random-Search algorithm** is the simplest of the other algorithms mentioned because it uses either a randomness or a probability in the definition of the method. the algorithms Random-Search are often useful in optimization problems where the objective function may be non-convex, non-differentiable and possibly discontinuous over a domain continuous, discrete, or continuous-discrete.
This was the result with 1000 iterations:
![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/cc0c9998-6f5c-4436-9328-541db8b71b06)![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/ce26bc32-74db-48a1-943e-49c500417600)

# Simulated Annealing
**Simulated Annealing (SA)** is one of the first modern optimization algorithms. It is a method that is similar to Hill Climbing, which is inspired by the cooling of metals, where assumes that a metal is initially heated and then cooled by in a controlled manner until obtaining a metal in a solid state. Its operation consists in choosing a high value for the variable T (often referred to as temperature) and an initial random solution. In each iteration, a looking for Hill Climbing, but with a probabilistic result that depends on the temperature. Thus, the choice of solution to adopt is initially more random for high temperatures, but as the process evolves, and the temperature cools down, theprocess tends to be more deterministic.

![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/2b4d3163-fc92-40f8-9be5-01ad931a2cc0)

# Artificial Neural Networks
For network training, we consider that of the 120 Exposures in the training set given, yields 40 Examples for each class. Using as requested the activation function sigmoid, a learning rate α = 0.9, and weights that are started randomly in the range [-1, 1] and 10000 training epochs.The following data set was used to test the network:

![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/4e14d0d6-94f2-4423-8bcf-a6d0b287f051)
![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/b1fd6fc4-e82d-4f83-b1f1-f0b74fbf67ec)

This was the results of the test data in diamond shape, the circle shape is the training data:

![imagem](https://github.com/FranciscoDNConceicao/Optimizing-Functions-with-Methods-Research-and-Artificial-Neural-Networks/assets/123041029/334f3bab-ea3a-48eb-83dd-a0fa10b18d55)



