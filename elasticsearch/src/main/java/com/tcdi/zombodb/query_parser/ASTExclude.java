/* Generated By:JJTree: Do not edit this line. ASTExclude.java Version 6.1 */
/* JavaCCOptions:MULTI=true,NODE_USES_PARSER=false,VISITOR=true,TRACK_TOKENS=false,NODE_PREFIX=AST,NODE_EXTENDS=,NODE_FACTORY=,SUPPORT_CLASS_VISIBILITY_PUBLIC=true */
package com.tcdi.zombodb.query_parser;

public
class ASTExclude extends com.tcdi.zombodb.query_parser.QueryParserNode {
  public ASTExclude(int id) {
    super(id);
  }

  public ASTExclude(QueryParser p, int id) {
    super(p, id);
  }

  public String getIndexName() {
    return String.valueOf(getChild(0).getValue());
  }

  public QueryParserNode getQuery() {
    return getChild(1);
  }

  /** Accept the visitor. **/
  public Object jjtAccept(QueryParserVisitor visitor, Object data) {

    return
    visitor.visit(this, data);
  }
}
/* JavaCC - OriginalChecksum=396c53150c65c49056ea0f75eb4262be (do not edit this line) */
