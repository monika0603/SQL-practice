""" 
How to design a parking lot using object-oriented principles?

1. The parking lot should have multiple floors where customers can park their cars/motorbikes.
2. The parking lot should have multiple entry and exit points. 
3. Customers should be able to enter and take a parking ticket from any point and exit at another 
point in the lot.
4. Customers should be able to pay by cash or credit. 
5. If the parking lot is full, there should be an automatic sign showing parking lot is full. 
6. The system should be able to handle multiple parking types, standard cars, compact cars, handicap, 
motorbikes, electric cars. 
7. Each floor should display a sign showing the number of free spots. 
8. The system should be able to handle different pay structure by the hour/day. 

Main actors in our systems
1. Admins: They can or subtract floors and parking spots. 
2. Customers can reserve a spot and pay for it. Or reserve it but cancel it after. 
"""


class ParkingSystem(object):

    def __init__(self, big, medium, small):
        """
        type big: int 
        type medium: int
        type small: int 
        """
        self.lotsize = [big, medium, small] 

    def addCar(self, carType):
        """ 
        type carSize: int 
        rtype: bool 
        """
        if self.lotsize[carType-1] == 0: return False 
        self.lotsize[carType-1] -= 1
        return True 
