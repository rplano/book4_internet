<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Stack"%>
<%!
    /**
     * Arithmetic Expression Evaluation An important application of stacks is in
     * parsing. For example, a compiler must parse arithmetic expressions
     * written using infix notation. For example the following infix expression
     * evaluates to 212: ( 2 + ( ( 3 + 4 ) * ( 5 * 6 ) ) )
     *
     * @author your name goes here
     */
    /**
     * Converting from infix to postfix notation. We read in the tokens one at a
     * time. If it is an operator, we push it on the stack; if it is an integer,
     * we print it out; if it is a right parentheses, we pop the topmost element
     * from the stack and print it out; if it is a left parentheses, we ignore
     * it.
     *
     * @param infix
     * @return
     */
    private String convertFromInfixToPostfix(String infix) {
        String postfix = "";
        // your code goes here:
        Stack<String> stack = new Stack<String>();

        StringTokenizer st = new StringTokenizer(infix);
        while (st.hasMoreTokens()) {
            String token = st.nextToken();
            // If it is an operator, we push it on the stack; 
            if ("+-*/".contains(token)) {
                stack.push(token);

                        // if it is a right parentheses, we pop the topmost element  
                // from the stack and print it out; 
            } else if (token.equals(")")) {
                postfix += " " + stack.pop();

                // if it is a left parentheses, we ignore it.
            } else if (token.equals("(")) {
                                // do nothing

                // if it is an integer, we print it out;
            } else {
                postfix += " " + token;

            }
        }
        return postfix;
    }

    /**
     * Parse and evaluate a postfix expression. We read the tokens in one at a
     * time. If it is an integer, push it on the stack; if it is a binary
     * operator, pop the top two elements from the stack, apply the operator to
     * the two elements, and push the result back on the stack.
     *
     * @param string
     * @return
     */
    private int evaluate(String postfix) {
        int result = 0;
        // your code goes here:
        Stack<String> stack = new Stack<String>();

        StringTokenizer st = new StringTokenizer(postfix);
        while (st.hasMoreTokens()) {
            String token = st.nextToken();

                        // if it is a binary operator, pop the top two elements from the stack, 
            // apply the operator to the two elements, and push the result back on the stack.
            if ("+-*/".contains(token)) {
                int x = Integer.parseInt(stack.pop().trim());
                int y = Integer.parseInt(stack.pop());
                int res = 0;
                switch (token.charAt(0)) {
                    case '+':
                        res = x + y;
                        break;
                    case '-':
                        res = x - y;
                        break;
                    case '*':
                        res = x * y;
                        break;
                    case '/':
                        res = x / y;
                        break;
                    default:
                        //out.println("we should never get here");
                        break;
                }
                stack.push("" + res);

                // If it is an integer, push it on the stack; 
            } else {
                stack.push(token);
            }
        }
        result = Integer.parseInt(stack.pop());
        return result;
    }
%>
<%
    String infix = request.getParameter("mathExpression");
    String postfix = convertFromInfixToPostfix(infix);
    int result = evaluate(postfix);
    out.println("The result is: " + result);
%>