import numpy as np
import matplotlib.pyplot as plt

path=[]
with open('Map/path3.txt','r') as f:
    for line in f:
        line2 = list(map(float,line.rstrip().split('\t')))
        path.append(line2)

path=np.array(path)  # my path
Pre_GPS =np.array([141.3711261,409.5938649]) #Prev GPS DATA 
Current =np.array([141.3888678, 419.8158298])  #Current GPS DATA

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

plt.figure()
plt.plot(path[:,0],path[:,1],label='Full Path')
plt.scatter(Pre_GPS[0],Pre_GPS[1], label = 'Prev GPS')
plt.scatter(Current[0],Current[1], label ='Cur GPS')
plt.scatter(waypoint[0],waypoint[1],100,'r', label ='Waypoint')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Cross Pure Pursuit')
plt.grid()
plt.legend()
plt.savefig('SaveFig/txt.png')
plt.show()
plt.close()
