import numpy as np
import math
import os, sys


def pure_pursuit(path_array,my_point,path_length,alpha):
    min_dist = float('inf')
    idx = 0
    for i in range(path_length):
        dist = np.linalg.norm(path_array[i] - my_point)
        if dist < min_dist:
            min_dist = dist
            idx = i
    print("nearpoint:{}  nearidx:{}".format(min_dist, idx))
    speed = 10
    Dist = 0.2 * speed + 1
    for i in range(idx, path_length):  
        if Dist < np.linalg.norm(path_array[i] - my_point):
            waypoint = path_array[i]
            break
    ld = np.linalg.norm(waypoint - my_point)
    delta1= np.arctan2(2 * 1 * np.sin(alpha), ld)
    delta= np.rad2deg(delta1)
    return waypoint,ld,delta



if __name__=="__main__":
    path = np.loadtxt('Map/path1.txt',delimiter='\t',unpack=False)
    path_array = np.array(path)
    path_length=len(path_array)
    my_point = np.array([5.81, 3.9675])
    alpha=np.radians(45)
    waypoint,LD,delta = pure_pursuit(path_array,my_point,path_length,alpha)

    print("x:{}  y:{}  LD:{}  delta:{}".format(waypoint[0],waypoint[1],LD,delta))