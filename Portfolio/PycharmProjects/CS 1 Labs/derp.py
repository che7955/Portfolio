"""
141 Tree Lab - Derp the Interpreter

The Derp interpreter parses and evaluates prefix integer expressions 
containing basic arithmetic operators (*,//,-,+). It performs arithmetic with
integer operands that are either literals or variables (read from a 
symbol table).  It dumps the symbol table, prints the infix expression with 
parentheses to denote order of operation, and evaluates the expression to
print the result.

Author: CS@RIT.EDU

Author: Christopher Eng
"""

from derp_types import *        # dataclasses for the Derp interpreter


##############################################################################
# symbol table
##############################################################################

def symbol_table(in_file):
    """creates a table as a dictionary to store the variables as keys and
    their values as values for those keys"""
    table = {}
    with open(in_file) as file:
        for line in file:
            (key, value) = line.split()
            table[key] = int(value)
    return table


##############################################################################
# parse
############################################################################## 
    
def parse(tokens):
    """parse: list(String) -> Node
    From a prefix stream of tokens, construct and return the tree,
    as a collection of Nodes, that represent the expression.
    precondition: tokens is a non-empty list of strings
    """
    if not tokens:
        return None
    else:
        while tokens is not None:
            current = tokens.pop(0)
            if current.isdigit():
                return LiteralNode(int(current))
            elif current.isidentifier():
                return VariableNode(current)
            else:
                if current == str('*') or current == str('//') or current == str('-') or current == str('+'):
                    return MathNode(parse(tokens), current, parse(tokens))


##############################################################################
# infix
##############################################################################
        
def infix(node):
    """infix: Node -> String 
    Perform an inorder traversal of the node and return a string that
    represents the infix expression.
    precondition: node is a valid derp tree node
    """
    if node is None:
        return None
    else:
        if isinstance(node, LiteralNode) is True:
            return str(node.val)
        if isinstance(node, VariableNode) is True:
            return str(node.name)
        else:
            return str('(') + infix(node.left) + str(node.operator) + infix(node.right) + str(')')


##############################################################################
# evaluate
##############################################################################

def evaluate(node, sym_tbl):
    """evaluate: Node * dict(key=String, value=int) -> int 
    Return the result of evaluating the expression represented by node.
    Precondition: all variable names must exist in sym_tbl
    precondition: node is a valid derp tree node
    """
    if node is None:
        return None
    else:
        if isinstance(node, LiteralNode) is True:
            return node.val
        if isinstance(node, VariableNode) is True:
            if node.name in sym_tbl.keys():
                return sym_tbl[node.name]
            else:
                return node.name
        else:
            if node.operator == '*':
                return evaluate(node.left, sym_tbl) * evaluate(node.right, sym_tbl)
            if node.operator == '//':
                return evaluate(node.left, sym_tbl) // evaluate(node.right, sym_tbl)
            if node.operator == '+':
                return evaluate(node.left, sym_tbl) + evaluate(node.right, sym_tbl)
            if node.operator == '-':
                return evaluate(node.left, sym_tbl) - evaluate(node.right, sym_tbl)


##############################################################################
# main
##############################################################################
                     
def main():
    """main: None -> None
    The main program prompts for the symbol table file, and a prefix 
    expression.  It produces the infix expression, and the integer result of
    evaluating the expression"""
    
    print("Hello Herp, welcome to Derp v1.0 :)")
    
    in_file = input("Herp, enter symbol table file: ")
    
    # STUDENT: CONSTRUCT AND DISPLAY THE SYMBOL TABLE HERE

    symbol_table(in_file)
    table = symbol_table(in_file)
    for key, value in table.items():
        print(str(key) + str(' => ') + str(value))
    
    print("Herp, enter prefix expressions, e.g.: + 10 20 (ENTER to quit)...")
    
    # input loop prompts for prefix expressions and produces infix version
    # along with its evaluation
    while True:
        prefix_exp = input("derp> ")
        if prefix_exp == "":
            break
            
        # STUDENT: GENERATE A LIST OF TOKENS FROM THE PREFIX EXPRESSION
        list_of_derp = list(prefix_exp.split())
        # STUDENT: CALL parse WITH THE LIST OF TOKENS AND SAVE THE ROOT OF 
        # THE PARSE TREE.
        parsed_input = parse(list_of_derp)
        # STUDENT: GENERATE THE INFIX EXPRESSION BY CALLING infix AND SAVING
        # THE STRING.
        infix_expression = infix(parsed_input)
        # STUDENT: MODIFY THE print STATEMENT TO INCLUDE RESULT.    
        print("Derping the infix expression: " + infix_expression)
        # STUDENT: EVALUTE THE PARSE TREE BY CALLING evaluate AND SAVING THE
        # INTEGER RESULT.
        eval_infix = evaluate(parsed_input, table)
        # STUDENT: MODIFY THE print STATEMENT TO INCLUDE RESULT.
        print("Derping the evaluation: " + str(eval_infix))
         
    print("Goodbye Herp :(")


##############################################################################
# main pps
##############################################################################

def main_for_pss():
    """used for the post problem solving to create hard coded trees and make calls to the functions"""
    list_to_parse = ['*', '8', '+', 'x', 'y']
    print(parse(list_to_parse))
    in_file = input("Herp, enter symbol table file: ")
    print('table created: ' + str(symbol_table(in_file)))
    tr = MathNode(left=LiteralNode(3), operator=str('*'),
                  right=MathNode(left=LiteralNode(2), operator=str('*'), right=LiteralNode(1)))
    print('node created: ' + str(tr))
    print('infix: ' + infix(tr))
    print('evaluation: ' + str(evaluate(tr, symbol_table(in_file))))


if __name__ == "__main__":
    main()
