import numpy as np
import matplotlib.pyplot as plt

# x, y =np.loadtxt('Control/path3.txt', delimiter='\t',unpack=True)
path=[]
with open('Control/path3.txt','r') as f:
    for line in f:
        line2 = list(map(float,line.rstrip().split('\t')))
        path.append(line2)

path=np.array(path)  # my path
Pre_GPS =np.array([141.3711261,409.5938649])  
Current =np.array([141.3888678, 409.8158298])

path_len = len(path)

current_min_dist= 2000
past_min_dist = 2000

idx =0
for i in range(path_len):
    dist = np.linalg.norm(path[i]-Pre_GPS)
    if dist < past_min_dist:
        past_min_dist = dist
        idx = i

idx2=0
for i in range(idx,idx +10):
    dist2 = np.linalg.norm(path[i]-Current)
    if dist2 < current_min_dist:
        current_min_dist = dist2
        idx2 = i

Speed = 100
LD = 0.237*Speed + 5
for i in range(idx2, path_len):  
        if LD < np.linalg.norm(path[i] - Current):
            waypoint = path[i]
            break
    
print(waypoint)
# def pure_pursuit(path_array,my_point,path_length):
#     min_dist = float('inf')
#     idx = 0
#     for i in range(path_length):
#         dist = np.linalg.norm(path_array[i] - my_point)
#         if dist < min_dist:
#             min_dist = dist
#             idx = i
#     print("nearpoint:{}  nearidx:{}".format(min_dist, idx))





# print(len(path))



plt.figure()
plt.plot(path[:,0],path[:,1],label='int load file')
plt.scatter(Pre_GPS[0],Pre_GPS[1])
plt.scatter(Current[0],Current[1])
plt.scatter(waypoint[0],waypoint[1])
plt.xlabel('x')
plt.ylabel('y')
plt.title('txt to graph')
plt.grid()
plt.legend()
plt.savefig('txt2.png')
plt.show()
plt.close()
