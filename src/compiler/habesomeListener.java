// Generated from C:/Users/Aditya/IdeaProjects/hk/src\habesome.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link habesomeParser}.
 */
public interface habesomeListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link habesomeParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(habesomeParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(habesomeParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(habesomeParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(habesomeParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#declaration}.
	 * @param ctx the parse tree
	 */
	void enterDeclaration(habesomeParser.DeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#declaration}.
	 * @param ctx the parse tree
	 */
	void exitDeclaration(habesomeParser.DeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#datatype}.
	 * @param ctx the parse tree
	 */
	void enterDatatype(habesomeParser.DatatypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#datatype}.
	 * @param ctx the parse tree
	 */
	void exitDatatype(habesomeParser.DatatypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#statementList}.
	 * @param ctx the parse tree
	 */
	void enterStatementList(habesomeParser.StatementListContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#statementList}.
	 * @param ctx the parse tree
	 */
	void exitStatementList(habesomeParser.StatementListContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(habesomeParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(habesomeParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(habesomeParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(habesomeParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(habesomeParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(habesomeParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#whileloop}.
	 * @param ctx the parse tree
	 */
	void enterWhileloop(habesomeParser.WhileloopContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#whileloop}.
	 * @param ctx the parse tree
	 */
	void exitWhileloop(habesomeParser.WhileloopContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#bool}.
	 * @param ctx the parse tree
	 */
	void enterBool(habesomeParser.BoolContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#bool}.
	 * @param ctx the parse tree
	 */
	void exitBool(habesomeParser.BoolContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(habesomeParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(habesomeParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#term}.
	 * @param ctx the parse tree
	 */
	void enterTerm(habesomeParser.TermContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#term}.
	 * @param ctx the parse tree
	 */
	void exitTerm(habesomeParser.TermContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#identifier}.
	 * @param ctx the parse tree
	 */
	void enterIdentifier(habesomeParser.IdentifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#identifier}.
	 * @param ctx the parse tree
	 */
	void exitIdentifier(habesomeParser.IdentifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link habesomeParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(habesomeParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link habesomeParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(habesomeParser.NumberContext ctx);
}