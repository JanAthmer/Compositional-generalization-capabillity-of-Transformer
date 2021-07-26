# Compositional generalization capability of Transformer

This project is part of of my bachelor thesis for University of Utrecht. 

I have expanded on experiments done by L Russin. I have used transformer models to test systematic/compositional generalization with SCAN and NACS datasets.


### References
Code used as a baseline : L Russin J.transformerscan https://github.com/jlrussin/transformer_scan.

Transformer model:https://arxiv.org/abs/1706.03762

SCAN dataset: https://arxiv.org/abs/1711.00350

### Repository structure
* transformer_scan
  * data (all data used in experiments)
    * scan (SCAN task)
      * addjump 		(systematic generalization split)
      * addleft 		(systematic generalization split)
      * addleft_removedleft	(split to check whether the "TURN LEFT" command was used by the model)
      * addx			(replaced "left" with "x")
      * churny			(replaced "turn left" with "churn y")
      * length			(split based on length)
      * simple 			(random split)
    * nacs (NACS task)
      * addjump 		(systematic generalization split)
      * addleft 		(systematic generalization split)
      * addleft_removedleft	(split to check whether the "TURN LEFT" command was used by the model)
      * addx			(replaced "left" with "x")
      * churny			(replaced "turn left" with "churn y")
      * length			(split based on length)
      * simple 			(random split)	
  * models
    * transformer (PyTorch code implementing transformer model)
  * parse data	(scripts to alter the data)
    * delete_left
    * quick_parse
    * TURN_X_test
    * TURN_X_train
  * results (raw results from all experiments)
  * scripts (scripts for running jobs on gpus)
  * main.py (main function - mostly just gathers arguments and runs train())
  * train.py (main training function)
  * data.py (code for dealing with SCAN dataset)
  * test.py (function used for testing and computing accuracy)
  * results.ipynb (notebook for displaying results in results/)
  * results_addx_jump.ipynb (another notebook for results that were run with 100 iterations)
  * requirements.txt (list of all requirements)
  
### Dependencies
[pytorch](https://pytorch.org/)
```
conda install pytorch torchvision -c pytorch
```
[torchtext](https://pytorch.org/text/)
```
conda install -c pytorch torchtext
```
The complete list of requirments in my anaconda environment are in requirements.txt. This was included in case there is a dependency that I missed, but many in that list will not be necessary to run the code in this repository. 
### To run (example):
Simple SCAN split:
```
python main.py --split simple_scan --out_data_file simple_scan
```

Simple NACS split:
```
python main.py --split simple_nacs --out_data_file simple_nacs
```
