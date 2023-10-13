l2=generate_random_parking_lot(12,15,5,30,30);
l2.plot()
[best ,l2]=GA(l2,100,100,0.3,0.4);
l2=Grey_wolf_optimizer(l2,100,100,4,1);