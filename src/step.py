from wfexception import *
from validvalue import *

class Step:
    
    def __init__(self,step_name):
        self.__step_name = step_name
        self.parent_node = list()
        self.sub_node = list()
        
    def get_node_name(self):
        return self.__node_name
    
    def set_action(self,action):
        self.__action = action
        
    def process(self):
        try:
            self.result = self.__action.process()
        except Exception:
            self.result = ValidStepStatus.FAILED
        
    def add_parent_node(self,parent_node):    
        self.parent_node.append(parent_node)
    
    def add_sub_node(self,sub_node):
        self.sub_node.append(sub_node)
