from wfexception import *
from validvalue import *

class Node:
    
    def __init__(self,node_name):
        self.__node_name = node_name
        self.parent_node = list()
        self.sub_node = list()
        
    def get_node_name(self):
        return self.__node_name
    
    def set_action(self,action):
        self.__action = action
        
    def process(self):
        self.result = self.__action.process()
        
        if self.result not in (ValidProcessResult.SUCCESS,ValidProcessResult.FAILED):
            self.result = ValidProcessResult.PROCESS_RUN_UNDEFINED
            raise WFMissResultException(self.result)
        
    def add_parent_node(self,parent_node):    
        self.parent_node.append(parent_node)
    
    def add_sub_node(self,sub_node):
        self.sub_node.append(sub_node)
