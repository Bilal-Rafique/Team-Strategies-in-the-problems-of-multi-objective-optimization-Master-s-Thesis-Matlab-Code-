car1 = Car(1, Position(1,2), false);
car2 = Car(2, Position(1,5), false);
car3 = Car(3, Position(1,8), false);
slot1 = Slot(1, Position(10,2), []);
slot2 = Slot(2, Position(10,5), []);
slot3 = Slot(3, Position(10,8), []);
slot4 = Slot(4, Position(10,11), []);
obs1 = Obstacle(Position(2,3), 0.1, 0.1);
obs2 = Obstacle(Position(4,1.8), 0.3, 0.3);
obs3 = Obstacle(Position(2,6), 0.6, 0.6);
obs4 = Obstacle(Position(6,7), 0.1, 0.1);
lot = ParkingLot(15, 15, [slot1, slot2, slot3, slot4], [car1, car2, car3], [], [obs1, obs2, obs3, obs4]);
[best, lot]=GA(lot,100,100,0.4,0.4);
lot=Grey_wolf_optimizer(lot,10,100,3,1);