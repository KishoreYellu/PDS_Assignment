import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
import seaborn as sns
data= pd.read_csv('/Users/kishoreyellu/Desktop/PDS/Assign/StudentsPerformance.CSV')

# visualising the number of male and female in the dataset


data['gender'].value_counts(dropna = False).plot.bar(color = ['green', 'blue'])
plt.title('Comparison of Males and Females')
plt.xlabel('gender')
plt.ylabel('count')
plt.show()

# visualizing the different groups in the dataset


data['race/ethnicity'].value_counts(dropna = False).plot.bar(color = 'cyan')
plt.title('Comparison of various groups')
plt.xlabel('Groups')
plt.ylabel('count')
plt.show()

# visualizing the differnt parental education levels


data['parental level of education'].value_counts(dropna = False).plot.bar()
plt.title('Comparison of Parental Education')
plt.xlabel('Degree')
plt.ylabel('count')
plt.show()


# visualizing different types of lunch 


data['lunch'].value_counts(dropna = False).plot.bar(color = 'yellow')
plt.title('Comparison of different types of lunch')
plt.xlabel('types of lunch')
plt.ylabel('count')
plt.show()


# visualizing maths score


data['math score'].value_counts(dropna = False).plot.bar(figsize = (18, 10))
plt.title('Comparison of math scores')
plt.xlabel('score')
plt.ylabel('count')
plt.show()






