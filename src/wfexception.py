

class WFException(Exception):
    
    def __init__(self,message):
        self.__error_message = message
        
        
    def __str__(self):
        return self.__error_message

      
class WFMissResultException(WFException):   
    
    def __init__(self,current_value):
        self.__error_message = 'Should correctly return process status(True,False), but ' + current_value +'.'