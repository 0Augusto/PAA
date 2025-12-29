import matplotlib.pyplot as plt
import solve as graph

import sys
x=5001
sys.setrecursionlimit(x)
  
# x axis values
xPerm = [1,2,3,4, 5,6,7,8,9]
xDFS = [1,2,3,4,5,6,7,8,9,10, 100, 500, 1000]
yPerm = []
yDFS = []

for i in xPerm:
    g = graph.Graph()

    g.fill_graph(i)

    yPerm.append(g.permutation_cycles_time())

plt.plot(xPerm, yPerm, label = "Permutation")

for i in xDFS:
    print(i)
    g = graph.Graph()

    g.fill_graph(i)

    yDFS.append(g.DFS_cycles_time())

# plotting the points 

print(yPerm)
print(yDFS)

plt.plot(xDFS, yDFS, label = "Walking")
  
# naming the x axis
plt.xlabel('# of instances')
# naming the y axis
plt.ylabel('Time (ms)')
  
# giving a title to my graph
plt.title('Cycles on Graph - Permutation vs DFS')
  
# function to show the plot
plt.show()

